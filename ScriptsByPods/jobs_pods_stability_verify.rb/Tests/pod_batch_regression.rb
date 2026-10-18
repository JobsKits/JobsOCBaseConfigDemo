#!/usr/bin/env ruby
# 在隔离工程用替身 xcodebuild 验证批量覆盖、证据、缓存与失败边界；不安装或真实编译。
require 'tmpdir'
require 'fileutils'
require 'json'
require 'open3'
require 'rbconfig'
require 'xcodeproj'
require_relative '../jobs_stability_pod_batch'
require_relative '../update_readme_results'

checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
source = File.expand_path('..', __dir__)
fixture = lambda do |root|
  scripts = File.join(root, 'ScriptsByPods', 'jobs_pods_stability_verify.rb')
  tools = File.join(root, 'tools')
  FileUtils.mkdir_p([scripts, tools, File.join(root, 'Pods')])
  %w[jobs_pods_stability_verify.rb jobs_stability_sources.rb jobs_stability_command.rb
     jobs_stability_host_entitlements.rb jobs_stability_pod_batch.rb].each do |name|
    FileUtils.cp(File.join(source, name), scripts)
  end
  %w[HeaderOwned NativeOwned ScriptOwned].each do |name|
    folder = File.join(root, 'JobsByPods', "#{name}@Pods")
    FileUtils.mkdir_p(folder)
    File.write(File.join(folder, "#{name}.podspec"), 'Pod::Spec.new {}')
  end
  project = Xcodeproj::Project.new(File.join(root, 'Pods', 'Pods.xcodeproj'))
  native = project.new_target(:framework, 'NativeOwned', :ios, '15.6')
  header = project.new_aggregate_target('HeaderOwned')
  script = project.new_aggregate_target('ScriptOwned')
  script.new_shell_script_build_phase('Fixture owned script').shell_script = 'true'
  dependency = project.new_target(:framework, 'ExternalDependency', :ios, '15.6')
  resource = project.new_target(:bundle, 'NativeOwned-Resource', :ios, '15.6')
  project.new_target(:unit_test_bundle, 'NativeOwned-Unit-Stability', :ios, '15.6')
  project.new_target(:application, 'AppHost-NativeOwned-Unit-Tests', :ios, '15.6')
  native.add_dependency(dependency)
  native.add_dependency(resource)
  project.save
  mock = <<~'RUBY'
    #!RUBY_EXECUTABLE
    require 'json'
    require 'rexml/document'
    if ARGV == ['-version']
      puts 'Xcode 26 batch fixture'
      exit 0
    end
    File.open(ENV.fetch('JOBS_BATCH_COMMANDS'), 'a') { |file| file.puts(JSON.generate(ARGV)) }
    if (index = ARGV.index('-workspace'))
      workspace = ARGV[index + 1]
      name = ARGV[ARGV.index('-scheme') + 1]
      path = File.join(workspace, 'xcshareddata', 'xcschemes', name + '.xcscheme')
      doc = REXML::Document.new(File.read(path))
      refs = doc.get_elements('Scheme/BuildAction/BuildActionEntries/BuildActionEntry/BuildableReference')
      expected = ENV.fetch('JOBS_BATCH_EXPECTED', 'HeaderOwned,NativeOwned,ScriptOwned').split(',')
      raise 'wrong batch targets' unless refs.map { |ref| ref.attributes['BlueprintName'] } == expected
      raise 'forbidden alltargets' if ARGV.include?('-alltargets')
      raise 'test action leaked into build graph' if doc.elements['Scheme/TestAction']
      ref = REXML::Document.new(File.read(File.join(workspace, 'contents.xcworkspacedata'))).elements['Workspace/FileRef']
      project = File.expand_path(ref.attributes['location'].delete_prefix('group:'), File.dirname(workspace))
      raise 'workspace cannot resolve Pods project' unless File.file?(File.join(project, 'project.pbxproj'))
      refs.each do |entry|
        resolved = File.expand_path(entry.attributes['ReferencedContainer'].delete_prefix('container:'), File.dirname(workspace))
        raise 'scheme cannot resolve Pods project' unless resolved == project
      end
    end
    File.write(ENV['JOBS_BATCH_MUTATE'], 'changed input') if ENV['JOBS_BATCH_MUTATE']
    sleep ENV.fetch('JOBS_BATCH_SLEEP', '0').to_f
    puts '** BUILD SUCCEEDED **' unless ENV['JOBS_BATCH_EXIT']
    exit ENV.fetch('JOBS_BATCH_EXIT', '0').to_i
  RUBY
  mock.sub!('RUBY_EXECUTABLE', RbConfig.ruby)
  File.write(File.join(tools, 'xcodebuild'), mock)
  File.chmod(0o755, File.join(tools, 'xcodebuild'))
  { root: root, runner: File.join(scripts, 'jobs_pods_stability_verify.rb'), tools: tools,
    project: File.join(root, 'Pods', 'Pods.xcodeproj', 'project.pbxproj'),
    calls: File.join(root, 'commands.jsonl'), output: File.join(root, 'output') }
end
run = lambda do |test, extra = [], env = {}|
  environment = { 'PATH' => test[:tools] + File::PATH_SEPARATOR + ENV.fetch('PATH'),
                  'JOBS_BATCH_COMMANDS' => test[:calls], 'JOBS_SIMULATOR_ONLY' => nil }.merge(env)
  message, status = Open3.capture2e(environment, RbConfig.ruby, test[:runner], '--phase', 'pods',
    '--architecture', 'arm64', '--output', test[:output], *extra)
  record = File.file?(File.join(test[:output], 'results.json')) ? JSON.parse(File.read(File.join(test[:output], 'results.json'))) : nil
  calls = File.file?(test[:calls]) ? File.readlines(test[:calls]).map { |line| JSON.parse(line) } : []
  [status, record, calls, message]
end

Dir.mktmpdir('jobs batch（中文）-') do |folder|
  test = fixture.call(File.join(folder, 'success'))
  original_project = File.binread(test[:project])
  status, record, calls, message = run.call(test, ['--batch-pods'])
  assert.call(status.success?, "batch failed: #{message}")
  assert.call(calls.size == 2 && calls.map { |args| args[args.index('-configuration') + 1] } == %w[Debug Release], 'expected one command per configuration')
  batches = record['results'].select { |row| row['kind'] == 'pod_batch' }
  members = record['results'].select { |row| row['kind'] == 'pod' }
  assert.call(batches.size == 2 && members.size == 6, 'coverage receipts missing')
  assert.call(members.all? { |row| row['execution_mode'] == 'batch-member' && row['seconds'].nil? && !row.key?('process_pid') }, 'per-Pod independent process/timing was fabricated')
  assert.call(batches.all? { |row| row['seconds'].is_a?(Numeric) && row['process_status_collected'] }, 'actual batch process evidence missing')
  assert.call(File.binread(test[:project]) == original_project, 'original Pods project was modified')
  assert.call(!File.directory?(File.join(File.dirname(test[:project]), 'xcshareddata')), 'generated scheme leaked into Pods project')
  manifest = JSON.parse(File.read(batches.first.fetch('batch_manifest')))
  assert.call(manifest['targets'].map { |target| target['name'] } == %w[HeaderOwned NativeOwned ScriptOwned], 'unknown/resource/test/host root target included')
  assert.call(manifest['targets'].count { |target| target['isa'] == 'PBXAggregateTarget' && target['product_name'].nil? } == 2, 'aggregate/header-only semantics lost')
  members.each do |member|
    errors = []
    require_result(errors, record, record['source_fingerprint'], test[:root], 'pod', member['name'], member['configuration'])
    assert.call(errors.empty?, "batch member rejected: #{errors}")
  end
  status, _, calls, message = run.call(test, ['--batch-pods'])
  assert.call(status.success? && calls.size == 2 && message.scan('PASS (cached) pod_batch').size == 2, 'valid batch cache missed')
  status, changed_mode, calls, = run.call(test, ['--batch-pods'], { 'JOBS_SIMULATOR_ONLY' => '1' })
  assert.call(status.success? && calls.size == 4 && changed_mode['source_fingerprint'] != record['source_fingerprint'], 'installation-mode identity reused')
  status, _, calls, = run.call(test, ['--batch-pods', '--architecture', 'x86_64'])
  assert.call(status.success? && calls.size == 6, 'architecture identity reused')
  assert.call(calls.last.include?('ARCHS=x86_64'), 'selected architecture missing')
  status, subset, calls, = run.call(test, ['--batch-pods', '--pod', 'NativeOwned'], { 'JOBS_BATCH_EXPECTED' => 'NativeOwned' })
  assert.call(status.success? && calls.size == 8 && subset['results'].last['name'] == 'NativeOwned', 'membership change reused old batch')
  errors = []
  require_result(errors, subset, subset['source_fingerprint'], test[:root], 'pod', 'HeaderOwned', 'Debug')
  assert.call(errors.empty?, 'membership-specific manifest did not preserve historical subset evidence')

  # 没有 batch 开关时仍逐 Pod；批量成功成员不得作为独立构建的缓存。
  status, individual, calls, = run.call(test)
  assert.call(status.success? && calls.size == 14, 'default individual mode did not run each Pod')
  assert.call(individual['results'].last(6).all? { |row| !row.key?('execution_mode') && row['seconds'].is_a?(Numeric) }, 'default individual receipt changed')

  %w[failed timeout source-change].each do |scenario|
    test = fixture.call(File.join(folder, scenario))
    env = {}
    args = ['--batch-pods']
    case scenario
    when 'failed'
      env['JOBS_BATCH_EXIT'] = '65'
    when 'timeout'
      env['JOBS_BATCH_SLEEP'] = '2'
      args += ['--build-timeout', '0.1']
    when 'source-change'
      env['JOBS_BATCH_MUTATE'] = File.join(test[:root], 'JobsByPods', 'NativeOwned@Pods', 'NativeOwned.podspec')
    end
    status, record, calls, message = run.call(test, args, env)
    assert.call(!status.success? && calls.size == 1, "#{scenario} did not stop before Release")
    batch = record['results'].find { |row| row['kind'] == 'pod_batch' }
    expected = { 'failed' => 65, 'timeout' => 124, 'source-change' => 75 }.fetch(scenario)
    assert.call(batch && batch['exit_status'] == expected, "#{scenario} exit status lost: #{message}")
    assert.call(record['results'].none? { |row| row['kind'] == 'pod' && row['exit_status'] == 0 }, "#{scenario} fabricated a successful member")
  end

  test = fixture.call(File.join(folder, 'evidence'))
  status, record, = run.call(test, ['--batch-pods'])
  assert.call(status.success?, 'evidence setup failed')
  member = record['results'].find { |row| row['kind'] == 'pod' }
  ['unknown member', 'wrong uuid', 'wrong configuration', 'old fingerprint', 'fake seconds',
   'batch failure', 'batch timeout', 'uncollected status', 'missing member', 'duplicate member',
   'latest failure', 'missing manifest', 'bad manifest hash', 'bad log', 'wrong command workspace',
   'wrong command scheme', 'wrong command configuration', 'dry run'].each do |scenario|
    changed = Marshal.load(Marshal.dump(record))
    row = changed['results'].find { |value| value['kind'] == 'pod' }
    batch = changed['results'].find { |value| value['kind'] == 'pod_batch' && value['batch_id'] == row['batch_id'] }
    case scenario
    when 'unknown member' then row['name'] = 'NotOwned'
    when 'wrong uuid' then row['target_uuid'] = 'WRONG'
    when 'wrong configuration' then row['configuration'] = 'Other'
    when 'old fingerprint' then row['source_fingerprint'] = 'stale'
    when 'fake seconds' then row['seconds'] = 1
    when 'batch failure' then batch['exit_status'] = 65
    when 'batch timeout' then batch['timed_out'] = true
    when 'uncollected status' then batch['process_status_collected'] = false
    when 'missing member' then batch['members'].shift
    when 'duplicate member' then batch['members'] << batch['members'].first
    when 'latest failure' then changed['results'] << batch.merge('exit_status' => 65)
    when 'missing manifest' then batch['batch_manifest'] = '/missing/manifest'
    when 'bad manifest hash' then batch['batch_manifest_sha256'] = 'wrong'
    when 'bad log' then batch['log'] = '/missing/log'
    when 'wrong command workspace' then batch['command'][batch['command'].index('-workspace') + 1] = '/missing/workspace'
    when 'wrong command scheme' then batch['command'][batch['command'].index('-scheme') + 1] = 'OtherScheme'
    when 'wrong command configuration' then batch['command'][batch['command'].index('-configuration') + 1] = 'Other'
    when 'dry run' then batch['command'].insert(1, '-dry-run')
    end
    assert.call(!JobsStabilityPodBatch.member_errors(changed, row, test[:root]).empty?, "#{scenario} evidence was accepted")
  end
  batch = record['results'].find { |row| row['kind'] == 'pod_batch' }
  manifest = JSON.parse(File.read(batch['batch_manifest']))
  path = manifest['scheme']
  original = File.read(path)
  original_manifest = File.read(batch['batch_manifest'])
  workspace_data = File.join(manifest['workspace'], 'contents.xcworkspacedata')
  original_workspace = File.read(workspace_data)
  ['disabled member', 'wrong container', 'wrong workspace project'].each do |scenario|
    changed = Marshal.load(Marshal.dump(record))
    receipt = changed['results'].find { |row| row['kind'] == 'pod_batch' }
    proof = JSON.parse(original_manifest)
    scheme_document = REXML::Document.new(original)
    workspace_document = REXML::Document.new(original_workspace)
    if scenario == 'disabled member'
      scheme_document.elements['Scheme/BuildAction/BuildActionEntries/BuildActionEntry'].attributes['buildForRunning'] = 'NO'
    elsif scenario == 'wrong container'
      scheme_document.elements['Scheme/BuildAction/BuildActionEntries/BuildActionEntry/BuildableReference'].attributes['ReferencedContainer'] = 'container:/missing/Pods.xcodeproj'
    else
      workspace_document.elements['Workspace/FileRef'].attributes['location'] = 'group:/missing/Pods.xcodeproj'
    end
    File.write(path, scheme_document.to_s)
    File.write(workspace_data, workspace_document.to_s)
    proof['scheme_sha256'] = Digest::SHA256.file(path).hexdigest
    proof['workspace_sha256'] = Digest::SHA256.file(workspace_data).hexdigest
    File.write(batch['batch_manifest'], JSON.pretty_generate(proof) + "\n")
    receipt['batch_manifest_sha256'] = Digest::SHA256.file(batch['batch_manifest']).hexdigest
    changed_member = changed['results'].find { |row| row['kind'] == 'pod' }
    assert.call(!JobsStabilityPodBatch.member_errors(changed, changed_member, test[:root]).empty?, "#{scenario} accepted after recomputing file hashes")
    File.write(path, original)
    File.write(workspace_data, original_workspace)
    File.write(batch['batch_manifest'], original_manifest)
  end
  File.write(path, original.sub('BlueprintName = "HeaderOwned"', 'BlueprintName = "Unknown"'))
  assert.call(!JobsStabilityPodBatch.member_errors(record, member, test[:root]).empty?, 'mutated Scheme accepted')
  status, _, calls, = run.call(test, ['--batch-pods'], { 'JOBS_BATCH_EXIT' => '65' })
  # prepare 会重建原始 Scheme，之前成功的原始证据仍有效；失败注入不应绕过可用缓存。
  assert.call(status.success? && calls.size == 2, 'reconstructed identical Scheme invalidated a valid cache')

  invalid = fixture.call(File.join(folder, 'invalid-target'))
  rejected = false
  begin
    JobsStabilityPodBatch.prepare(invalid[:root], ['MissingOwned'], invalid[:output])
  rescue RuntimeError
    rejected = true
  end
  assert.call(rejected, 'missing target accepted')
  %w[NativeOwned-Resource NativeOwned-Unit-Stability AppHost-NativeOwned-Unit-Tests].each do |name|
    rejected = false
    begin
      JobsStabilityPodBatch.prepare(invalid[:root], [name], invalid[:output])
    rescue RuntimeError
      rejected = true
    end
    assert.call(rejected, "resource/test/host target accepted: #{name}")
  end
end
puts "PASS #{checks} isolated batch checks; no real xcodebuild, pod install or project mutation"
