#!/usr/bin/env ruby
# JOBS_TERMINAL_STYLE_GUARD_V1_BEGIN
if $PROGRAM_NAME == __FILE__
  # 直接运行时由 fork 父进程保护配色；子进程继续原文件，不重放 Ruby 参数和预载模块。
  def jobs_terminal_style_bootstrap_v1
    return unless $PROGRAM_NAME == __FILE__
    plain = lambda do
      ENV.update('PLAIN_OUTPUT' => '1', 'NO_COLOR' => '1', 'FORCE_COLOR' => '0',
                 'CLICOLOR' => '0', 'ANSI_COLORS_DISABLED' => '1', 'npm_config_color' => 'false')
    end
    notify = lambda do |message|
      encoding = $stderr.external_encoding || Encoding::UTF_8
      $stderr.write((message + "\n").encode(encoding, invalid: :replace, undef: :replace))
    end
    return unless $stdin.tty? && $stdout.tty?
    return if ENV.key?('NO_COLOR') || ENV['PLAIN_OUTPUT'] == '1' ||
              ENV['IS_SOURCETREE_RUNTIME'] == '1' ||
              ENV.keys.any? { |key| key.match?(/\A(?:SOURCETREE|SOURCE_TREE)/i) }
    return if ['', 'dumb'].include?(ENV.fetch('TERM', ''))
    if File::ALT_SEPARATOR == '\\' || !Process.respond_to?(:fork) ||
       Thread.list.length > 1 || ENV['TMUX'] || ENV['STY']
      plain.call
      return
    end
    tty_name = IO.popen(['tty'], err: File::NULL, &:read).strip
    groups = IO.popen(['ps', '-o', 'pgid=', '-o', 'tpgid=', '-p', Process.pid.to_s], err: File::NULL, &:read).split
    unless tty_name.match?(%r{\A/dev/[A-Za-z0-9_./-]+\z}) && groups.length == 2 &&
           groups.all? { |group| group.match?(/\A\d+\z/) } && groups[0].to_i > 0 && groups[0] == groups[1]
      plain.call
      return
    end
    owner = ENV['JOBS_TERMINAL_STYLE_OWNER']
    if ENV['JOBS_TERMINAL_STYLE_TTY'] == tty_name && owner && owner.match?(/\A\d+\z/)
      begin
        Process.kill(0, owner.to_i)
        return
      rescue Errno::ESRCH, Errno::EPERM
      end
    end
    require 'io/console'
    require 'tmpdir'
    if Thread.list.length > 1
      plain.call
      return
    end
    tty = File.open('/dev/tty', 'r+')
    tty.binmode
    tty.sync = true
    keys = ['10', '11', '12'] + (0..15).map { |index| "4;#{index}" }
    palette = %w[000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee
                 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff]
    targets = { '10' => 'ffffff', '11' => '000000', '12' => 'ffffff' }
    palette.each_with_index { |color, index| targets["4;#{index}"] = color }
    query = lambda do |key|
      tty.write("\e]#{key};?\a")
      bytes = ''.b
      deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 0.3
      loop do
        remaining = deadline - Process.clock_gettime(Process::CLOCK_MONOTONIC)
        return nil if remaining <= 0 || !IO.select([tty], nil, nil, remaining)
        piece = tty.read_nonblock(256, exception: false)
        next if piece == :wait_readable
        return nil unless piece && !piece.empty?
        bytes << piece
        return nil if bytes.bytesize > 256 || !bytes.start_with?("\e".b)
        break if bytes.end_with?("\a".b) || bytes.end_with?("\e\\".b)
      end
      match = bytes.match(/\A\e\]#{Regexp.escape(key)};rgb:([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})(?:\a|\e\\)\z/n)
      return nil unless match
      components = match.captures.map { |hex| (hex.to_i(16) * 65535.0 / (16**hex.length - 1)).round }
      { raw: bytes, rgb: components }
    rescue IOError, SystemCallError
      nil
    end
    snapshot = lambda do
      values = {}
      tty.raw(min: 0, time: 0, intr: true) do
        keys.each do |key|
          value = query.call(key)
          return nil unless value
          values[key] = value
        end
      end
      values
    rescue IOError, SystemCallError, ArgumentError
      nil
    end
    original = snapshot.call
    unless original
      notify.call('终端不支持完整配色保存，或启动时收到其它输入；保留原配色并使用纯文本。')
      tty.close
      plain.call
      return
    end
    directory = Dir.mktmpdir('jobs-terminal-style-')
    recovery = File.join(directory, 'restore.sh')
    original_bytes = keys.map { |key| original.fetch(key).fetch(:raw) }.join
    recovery_source = "#!/bin/sh\n" \
      "[ -t 0 ] && [ \"$(tty)\" = '#{tty_name}' ] || { printf '请在原终端运行恢复入口。\\n' >&2; exit 1; }\n" \
      "printf '本操作会覆盖此终端当前配色。确认恢复脚本启动前的配色，请输入 YES：' >&2\n" \
      "IFS= read -r jobs_restore_choice\n[ \"$jobs_restore_choice\" = YES ] || exit 1\n" \
      "printf '%s\\033[0m' '#{original_bytes}' > /dev/tty\n"
    File.open(recovery, File::WRONLY | File::CREAT | File::EXCL, 0o600) do |file|
      file.binmode
      file.write(recovery_source.b)
    end
    notify.call("本次终端临时使用黑底白字；强退后恢复入口：sh \"#{recovery}\"")
    changed = false
    applied = nil
    # 比较仍生效的本轮颜色，只恢复未被用户另行修改的项。
    cleanup = lambda do
      current = applied && snapshot.call
      unless current
        notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
        return false
      end
      conflicts = []
      restore_bytes = ''.b
      keys.each do |key|
        if current.fetch(key).fetch(:rgb) == applied.fetch(key).fetch(:rgb)
          restore_bytes << original.fetch(key).fetch(:raw)
        else
          conflicts << key
        end
      end
      tty.write(restore_bytes + "\e[0m".b)
      if conflicts.empty?
        File.unlink(recovery)
        Dir.rmdir(directory)
        true
      else
        notify.call("检测到运行期间的配色变更，已保留这些项：#{conflicts.join(' ')}")
        notify.call("确认要覆盖后续改色时才使用恢复入口：sh \"#{recovery}\"")
        false
      end
    rescue IOError, SystemCallError
      notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
      false
    end
    child_pid = nil
    guardian = false
    interrupted = nil
    previous_signals = {}
    %w[INT TERM HUP].each do |name|
      previous_signals[name] = Signal.trap(name) do
        interrupted = name
        if child_pid && name != 'INT'
          begin
            Process.kill(name, child_pid)
          rescue Errno::ESRCH
          end
        end
      end
    end
    begin
      changed = true
      tty.write(targets.map { |key, color| "\e]#{key};##{color}\a" }.join + "\e[0m")
      applied = snapshot.call
      unless applied
        notify.call('无法核实本次临时配色，已停止启动业务。')
        raise SystemExit, 1
      end
      desired = targets.all? do |key, hex|
        rgb = hex.scan(/../).map { |component| component.to_i(16) * 257 }
        applied.fetch(key).fetch(:rgb).zip(rgb).all? { |actual, expected| (actual - expected).abs <= 255 }
      end
      unless desired
        notify.call('终端未接受本次配色，恢复后使用纯文本。')
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      if interrupted
        raise SystemExit, 128 + Signal.list.fetch(interrupted)
      end
      if Thread.list.length > 1
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      $stdout.flush
      $stderr.flush
      begin
        child_pid = Process.fork
      rescue NotImplementedError, SystemCallError
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      unless child_pid
        changed = false
        ENV['JOBS_TERMINAL_STYLE_TTY'] = tty_name
        ENV['JOBS_TERMINAL_STYLE_OWNER'] = Process.ppid.to_s
        raise SystemExit, 128 + Signal.list.fetch(interrupted) if interrupted
        return
      end
      guardian = true
      result = nil
      loop do
        begin
          _, result = Process.wait2(child_pid)
          break
        rescue Interrupt, Errno::EINTR
        end
      end
      status_code = result.exitstatus || 128 + result.termsig
      %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
      restored = cleanup.call
      changed = false
      status_code = 1 if !restored && status_code.zero?
      tty.close
      Process.exit!(status_code)
    ensure
      if changed
        %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
        cleanup.call
      end
      previous_signals.each { |name, handler| Signal.trap(name, handler) } unless guardian
      tty.close unless tty.closed?
    end
  rescue IOError, SystemCallError, LoadError => error
    if guardian
      notify.call("终端保护监督进程异常：#{error.message}")
      Process.exit!(1)
    end
    raise SystemExit, 1 if changed
    notify.call("终端保护不可用，使用纯文本：#{error.message}")
    plain.call
  end
  jobs_terminal_style_bootstrap_v1

end
# JOBS_TERMINAL_STYLE_GUARD_V1_END

require 'tmpdir'
require 'fileutils'
require 'json'
require 'open3'
require 'rbconfig'
require 'xcodeproj'
require_relative '../../jobs_stability_pod_batch.rb/jobs_stability_pod_batch'
require_relative '../../update_readme_results.rb/update_readme_results'

# 用途：在隔离工程用替身 xcodebuild 验证批量 Pod 覆盖、证据、缓存与失败边界，不安装或真实构建。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
source = File.expand_path('../..', __dir__)
fixture = lambda do |root|
  scripts = File.join(root, 'ScriptsByPods', 'jobs_pods_stability_verify.rb')
  tools = File.join(root, 'tools')
  FileUtils.mkdir_p([scripts, tools, File.join(root, 'Pods')])
  %w[jobs_pods_stability_verify.rb jobs_stability_sources.rb jobs_stability_command.rb
     jobs_stability_host_entitlements.rb jobs_stability_pod_batch.rb].each do |name|
    FileUtils.cp_r(File.join(source, name), scripts)
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
    sleep ENV.fetch('JOBS_BATCH_STARTUP_DELAY', '0').to_f
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

  %w[failed timeout startup-timeout source-change].each do |scenario|
    test = fixture.call(File.join(folder, scenario))
    env = {}
    args = ['--batch-pods']
    case scenario
    when 'failed'
      env['JOBS_BATCH_EXIT'] = '65'
    when 'timeout', 'startup-timeout'
      env['JOBS_BATCH_SLEEP'] = '2'
      env['JOBS_BATCH_STARTUP_DELAY'] = '2' if scenario == 'startup-timeout'
      args += ['--build-timeout', '0.1']
    when 'source-change'
      env['JOBS_BATCH_MUTATE'] = File.join(test[:root], 'JobsByPods', 'NativeOwned@Pods', 'NativeOwned.podspec')
    end
    status, record, calls, message = run.call(test, args, env)
    timed_out = %w[timeout startup-timeout].include?(scenario)
    details = "status=#{status.exitstatus.inspect} calls=#{calls.inspect}\n#{message}"
    # 超时可能发生在 Ruby 写入替身日志前；实际尝试和停止边界以 runner 的进程结果为准。
    expected_calls = timed_out ? calls.size <= 1 : calls.size == 1
    debug_calls = calls.all? do |command|
      index = command.index('-configuration')
      index && command[index + 1] == 'Debug'
    end
    assert.call(!status.success? && expected_calls && debug_calls, "#{scenario} did not stop before Release: #{details}")
    rows = record.fetch('results')
    batches = rows.select { |row| row['kind'] == 'pod_batch' }
    batch = batches.first
    command = batch && batch['command']
    debug_command = command.is_a?(Array) && command.include?('-configuration') && command[command.index('-configuration') + 1] == 'Debug'
    assert.call(batches.size == 1 && rows.all? { |row| row['configuration'] == 'Debug' } && debug_command,
                "#{scenario} runner attempted Release or lost the Debug command: #{details}")
    expected = { 'failed' => 65, 'timeout' => 124, 'startup-timeout' => 124, 'source-change' => 75 }.fetch(scenario)
    assert.call(batch['exit_status'] == expected && batch['process_status_collected'], "#{scenario} exit status lost: #{details}")
    assert.call(batch['timed_out'] == true, "#{scenario} timeout evidence lost: #{details}") if timed_out
    assert.call(calls.empty?, "startup-timeout reached the mock command log: #{details}") if scenario == 'startup-timeout'
    assert.call(rows.none? { |row| row['kind'] == 'pod' && row['exit_status'] == 0 }, "#{scenario} fabricated a successful member: #{details}")
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
