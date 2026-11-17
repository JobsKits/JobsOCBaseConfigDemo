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
require 'rbconfig'
require_relative '../../update_readme_results.rb/update_readme_results'

# 用途：验证派生图标不污染源码指纹，而原始图标、配置和生成器变更会使构建缓存失效。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
Dir.mktmpdir('jobs-stability-sources-') do |root|
  catalog = File.join(root, 'JobsOCBaseConfigDemo', '资源', 'Assets.xcassets')
  source = File.join(catalog, 'AppIcon.appiconset')
  debug = File.join(catalog, 'JobsAppIconRibbon-Debug.appiconset')
  release = File.join(catalog, 'JobsAppIconRibbon-Release.appiconset')
  ordinary = File.join(root, 'JobsByPods', 'Fixture@Pods', 'Resource', 'JobsAppIconRibbon-Debug.appiconset')
  generator = File.join(root, 'JobsByPods', 'JobsAppIconRibbon@Pods', 'Scripts', 'Generator.swift')
  FileUtils.mkdir_p([source, debug, release, ordinary, File.dirname(generator)])
  [source, debug, release, ordinary].each do |folder|
    File.write(File.join(folder, 'Contents.json'), '{}')
    File.write(File.join(folder, 'icon.png'), 'initial image')
  end
  File.write(generator, '// real generator')
  config = File.join(root, 'JobsAppIconRibbon.config')
  assert.call(source_paths(root).include?(File.join(debug, 'icon.png')), 'no configuration must not hide similarly named resources')
  File.write(config, "SOURCE_APPICONSET='JobsOCBaseConfigDemo/资源/Assets.xcassets/AppIcon.appiconset'\nOUTPUT_NAME_PREFIX=JobsAppIconRibbon\n")
  inputs = source_paths(root)
  assert.call(inputs.include?(File.join(source, 'icon.png')), 'original icon is missing from fingerprint')
  assert.call(inputs.include?(config) && inputs.include?(generator), 'configuration or generator is missing from fingerprint')
  assert.call(inputs.include?(File.join(ordinary, 'icon.png')), 'unrelated resource was excluded by its name')
  assert.call(inputs.none? { |path| path.start_with?(debug + '/') || path.start_with?(release + '/') }, 'generated outputs leaked into fingerprint')
  baseline = source_fingerprint(root, 'fixture Xcode')
  previous_mode = ENV['JOBS_SIMULATOR_ONLY']
  begin
    ENV['JOBS_SIMULATOR_ONLY'] = nil
    regular_mode = source_fingerprint(root, 'fixture Xcode')
    ENV['JOBS_SIMULATOR_ONLY'] = '1'
    assert.call(source_fingerprint(root, 'fixture Xcode') != regular_mode, 'different dependency installation modes shared a fingerprint')
  ensure
    ENV['JOBS_SIMULATOR_ONLY'] = previous_mode
  end
  assert.call(source_fingerprint(root, 'fixture Xcode', 'arm64') != baseline, 'single architecture reused the default fingerprint')
  assert.call(source_fingerprint(root, 'fixture Xcode', 'arm64') != source_fingerprint(root, 'fixture Xcode', 'x86_64'), 'different architectures shared a fingerprint')
  File.write(File.join(debug, 'icon.png'), 'runner-generated different pixels')
  FileUtils.rm_f(File.join(release, 'icon.png'))
  File.write(File.join(release, 'new.png'), 'new generated image')
  assert.call(source_fingerprint(root, 'fixture Xcode') == baseline, 'generated rewrite/add/delete changed fingerprint')
  File.write(File.join(source, 'icon.png'), 'changed original')
  original_changed = source_fingerprint(root, 'fixture Xcode')
  assert.call(original_changed != baseline, 'original icon mutation did not invalidate results')
  File.write(generator, '// changed real generator')
  generator_changed = source_fingerprint(root, 'fixture Xcode')
  assert.call(generator_changed != original_changed, 'generator mutation did not invalidate results')
  File.open(config, 'a') { |file| file.puts('DEBUG_TEXT=CI') }
  assert.call(source_fingerprint(root, 'fixture Xcode') != generator_changed, 'configuration mutation did not invalidate results')
  File.write(config, "SOURCE_APPICONSET=JobsOCBaseConfigDemo/资源/Assets.xcassets/AppIcon.appiconset\nOUTPUT_NAME_PREFIX=../escape\n")
  assert.call(source_paths(root).include?(File.join(debug, 'icon.png')), 'unsafe prefix caused a broad exclusion')
  File.write(config, "SOURCE_APPICONSET=JobsOCBaseConfigDemo/资源/Assets.xcassets/JobsAppIconRibbon-Debug.appiconset\nOUTPUT_NAME_PREFIX=JobsAppIconRibbon\n")
  assert.call(source_paths(root).include?(File.join(debug, 'icon.png')), 'input/output alias excluded the original source')

  # 在隔离工程执行真实 runner，以替身 xcodebuild 复现构建改写派生图标和原始图标两条分支。
  scripts = File.join(root, 'ScriptsByPods', '自动化测试相关脚本', 'jobs_pods_stability_verify.rb')
  tools = File.join(root, 'tools')
  pod = File.join(root, 'JobsByPods', 'Fixture@Pods')
  FileUtils.mkdir_p([scripts, tools, File.join(root, 'Pods', 'Pods.xcodeproj')])
  %w[jobs_pods_stability_verify.rb jobs_stability_command.rb jobs_stability_host_entitlements.rb jobs_stability_sources.rb].each do |name|
    FileUtils.cp_r(File.expand_path('../../' + name, __dir__), File.join(scripts, name))
  end
  File.write(File.join(pod, 'Fixture.podspec'), "Pod::Spec.new {}\n")
  File.write(config, "SOURCE_APPICONSET=JobsOCBaseConfigDemo/资源/Assets.xcassets/AppIcon.appiconset\nOUTPUT_NAME_PREFIX=JobsAppIconRibbon\n")
  fake_xcodebuild = File.join(tools, 'xcodebuild')
  File.write(fake_xcodebuild, <<~RUBY)
    #!#{RbConfig.ruby}
    if ARGV == ['-version']
      puts 'Xcode 26 fixture'
    else
      File.write(ENV.fetch('JOBS_FIXTURE_IMAGE'), 'pixels regenerated by isolated build')
    end
  RUBY
  File.chmod(0o755, fake_xcodebuild)
  [[debug, nil], [source, nil], [debug, 'arm64'], [debug, 'x86_64']].each_with_index do |(folder, architecture), index|
    output = File.join(root, index >= 2 ? 'architecture-results' : "results-#{index}")
    env = { 'PATH' => tools + File::PATH_SEPARATOR + ENV.fetch('PATH'), 'JOBS_FIXTURE_IMAGE' => File.join(folder, 'icon.png') }
    architecture_args = architecture ? ['--architecture', architecture] : []
    message, status = Open3.capture2e(env, RbConfig.ruby, File.join(scripts, 'jobs_pods_stability_verify.rb'),
      '--phase', 'pods', '--pod', 'Fixture', '--configuration', 'Debug', '--output', output, *architecture_args)
    receipt = JSON.parse(File.read(File.join(output, 'results.json')))
    row = receipt.fetch('results').last
    if index == 1
      assert.call(!status.success? && row['exit_status'] == 75 && !row['source_consistent'], "runner accepted original mutation: #{message}")
    else
      assert.call(status.success? && row['exit_status'] == 0 && row['source_consistent'], "runner rejected derived regeneration: #{message}")
    end
    if architecture
      assert.call(receipt['architecture'] == architecture && row['command'].include?("ARCHS=#{architecture}") && row['command'].include?('ONLY_ACTIVE_ARCH=YES'), 'single architecture command and receipt disagree')
      assert.call(message.include?('RUN pod Fixture Debug') && !message.include?('(cached)'), 'different architecture reused a successful cache')
    else
      assert.call(row['command'].include?('ONLY_ACTIVE_ARCH=NO') && row['command'].none? { |argument| argument.start_with?('ARCHS=') }, 'default dual architecture changed')
    end
  end
end
# XCTest 根目录的实现体、头文件和新增源均属于执行/缓存身份；方法名相同也不能领旧结果。
Dir.mktmpdir('jobs-application-source-fingerprint-') do |root|
  folder = File.join(root, 'JobsOCBaseConfigDemoTests')
  FileUtils.mkdir_p(folder)
  implementation = File.join(folder, 'JobsOCBaseConfigDemoTests.m')
  header = File.join(folder, 'JobsOCBaseConfigDemoTests.h')
  original = "@implementation JobsOCBaseConfigDemoTests\n-(void)testBodyIdentity {\n  NSInteger value = 1;\n}\n@end\n"
  File.write(implementation, original)
  File.write(header, "@interface JobsOCBaseConfigDemoTests : XCTestCase\n@end\n")
  assert.call([implementation, header].all? { |path| source_paths(root).include?(path) }, 'actual ApplicationTests root missing from source freeze inputs')
  before = source_fingerprint(root, 'fixture Xcode')
  changed = original.sub('value = 1', 'value = 2')
  selectors = lambda { |source| source.scan(/^\s*-\s*\(\s*void\s*\)\s*(test\w+)\s*(?:\{|$)/).flatten }
  File.write(implementation, changed)
  assert.call(selectors.call(changed) == selectors.call(original), 'body-only fixture accidentally changed the test inventory')
  body_changed = source_fingerprint(root, 'fixture Xcode')
  assert.call(body_changed != before, 'body-only ApplicationTests change reused an old fingerprint')
  added = File.join(folder, 'Nested', 'AdditionalTests.mm')
  FileUtils.mkdir_p(File.dirname(added))
  File.write(added, '@implementation AdditionalTests @end')
  assert.call(source_paths(root).include?(added) && source_fingerprint(root, 'fixture Xcode') != body_changed, 'added ApplicationTests source did not invalidate results')
  File.unlink(added)
  assert.call(source_fingerprint(root, 'fixture Xcode') == body_changed, 'deleting added ApplicationTests source did not restore the input set')
  File.write(header, File.read(header) + "\n#define JOBS_TEST_BODY_MARKER 1\n")
  assert.call(source_fingerprint(root, 'fixture Xcode') != body_changed, 'ApplicationTests header mutation was absent from fingerprint')
end

puts "PASS: #{checks} source fingerprint checks"
