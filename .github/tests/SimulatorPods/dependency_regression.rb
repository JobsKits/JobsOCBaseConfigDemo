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

require 'json'
require 'optparse'

begin
  require 'cocoapods'
rescue LoadError
  prefix = %w[/opt/homebrew /usr/local].find do |path|
    File.file?("#{path}/opt/ruby/bin/ruby") && File.directory?("#{path}/opt/cocoapods/libexec")
  end
  abort '需要已安装 CocoaPods；不会自动安装工具。' unless prefix
  exec({ 'GEM_HOME' => "#{prefix}/opt/cocoapods/libexec", 'GEM_PATH' => nil },
       "#{prefix}/opt/ruby/bin/ruby", __FILE__, *ARGV)
end

# 用途：核验普通安装与模拟器安装的 Pod 依赖合同，可另验已有锁文件和真实生成的依赖图。
# 运行：终端用 ruby 执行本文件，--installed-root 可指定已安装工程；不下载或安装依赖，不修改第三方源码。

# 每次重新解析真实 podspec，并恢复调用方原有安装模式。
def dependencies(path, mode)
  previous = ENV['JOBS_SIMULATOR_ONLY']
  ENV['JOBS_SIMULATOR_ONLY'] = mode
  Pod::Specification.from_file(path).dependencies.map(&:name)
ensure
  ENV['JOBS_SIMULATOR_ONLY'] = previous
end

root = File.expand_path('../../..', __dir__)
options = {}
OptionParser.new do |parser|
  parser.on('--installed-root PATH', '同时核验 pod install 后的锁文件和 Pods 工程') { |path| options[:installed_root] = File.expand_path(path) }
end.parse!
checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
if File.file?(File.join(root, 'Tests', 'ComponentStability', 'manifest.json'))
  # 主工程集成形态直接核验真实Podfile.deps，保留普通设备的默认播放器能力。
  integrated_dependencies = lambda do |mode|
    previous = ENV['JOBS_SIMULATOR_ONLY']
    begin
      ENV['JOBS_SIMULATOR_ONLY'] = mode
      Pod::Podfile.from_ruby(Pathname.new(File.join(root, 'Podfile.deps'))).dependencies.map(&:name)
    ensure
      ENV['JOBS_SIMULATOR_ONLY'] = previous
    end
  end
  regular = integrated_dependencies.call(nil)
  simulator = integrated_dependencies.call('1')
  assert.call(regular.include?('ZFPlayer'), 'default installation lost device ZFPlayer support')
  assert.call(!simulator.include?('ZFPlayer'), 'Simulator installation still selects all device player subspecs')
  %w[ZFPlayer/AVPlayer ZFPlayer/ControlView].each do |dependency|
    assert.call(regular.include?(dependency) && simulator.include?(dependency), "lost #{dependency}")
  end
  assert.call((regular - simulator) == ['ZFPlayer'] && (simulator - regular).empty?, 'unexpected integrated dependency change')
else
  %w[JobsByOCPods ZFPlayerExtra].each do |name|
    path = File.join(root, 'JobsByPods', "#{name}@Pods", "#{name}.podspec")
    regular = dependencies(path, nil)
    simulator = dependencies(path, '1')
    assert.call(regular.include?('ZFPlayer/ijkplayer'), "#{name}: default installation lost device IJK support")
    assert.call(!simulator.include?('ZFPlayer/ijkplayer'), "#{name}: Simulator installation still requires device IJK")
    %w[ZFPlayer/AVPlayer ZFPlayer/ControlView].each do |dependency|
      assert.call(regular.include?(dependency) && simulator.include?(dependency), "#{name}: lost #{dependency}")
    end
    assert.call((regular - simulator) == ['ZFPlayer/ijkplayer'] && (simulator - regular).empty?, "#{name}: unexpected dependency change")
  end
end
if options[:installed_root]
  installed = options[:installed_root]
  lock = Pod::Lockfile.from_file(Pathname.new(File.join(installed, 'Podfile.lock')))
  assert.call(lock && !lock.pod_names.include?('IJKMediaFramework'), 'installed graph still contains IJKMediaFramework')
  entries = lock.to_hash.fetch('PODS').flat_map { |row| row.is_a?(Hash) ? row.keys : [row] }.map { |row| row.split(' ').first }
  assert.call(!entries.include?('ZFPlayer/ijkplayer'), 'installed graph still contains ZFPlayer/ijkplayer')
  assert.call(%w[ZFPlayer/AVPlayer ZFPlayer/ControlView].all? { |name| entries.include?(name) }, 'installed graph lost AVPlayer/ControlView')
  project = Xcodeproj::Project.open(File.join(installed, 'Pods', 'Pods.xcodeproj'))
  assert.call(project.root_object.isa == 'PBXProject', 'generated Pods project is invalid')
  assert.call(project.targets.none? { |target| target.name == 'IJKMediaFramework' }, 'generated project still builds IJK')
  player = project.targets.find { |target| target.name == 'ZFPlayer' }
  assert.call(player && player.source_build_phase.files_references.none? { |file| file.real_path.to_s.include?('/ijkplayer/') }, 'generated ZFPlayer still compiles IJK integration')
  umbrella = File.read(File.join(installed, 'Pods', 'Target Support Files', 'ZFPlayer', 'ZFPlayer-umbrella.h'))
  assert.call(!umbrella.include?('ZFIJKPlayerManager.h'), 'generated umbrella still imports IJK')
end
puts "Simulator Pod dependencies: #{checks} checks PASS"
