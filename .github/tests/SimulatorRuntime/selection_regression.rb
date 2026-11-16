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

require_relative 'select_simulator'

# 用途：用内存中的模拟器清单验证 SDK 代际、数字版本、可用性与架构筛选，拒绝旧已启动设备抢占。
# 运行：终端用 ruby 执行本文件，或由 CI 调用；不启动模拟器，不执行主 App 测试。

def runtime(version, **attributes)
  { 'identifier' => "com.apple.CoreSimulator.SimRuntime.iOS-#{version.tr('.', '-')}",
    'version' => version, 'isAvailable' => true, 'supportedArchitectures' => ['arm64'] }.merge(attributes.transform_keys(&:to_s))
end

def iphone(number, **attributes)
  { 'udid' => format('00000000-0000-0000-0000-%012d', number), 'name' => "iPhone #{number}",
    'deviceTypeIdentifier' => 'com.apple.CoreSimulator.SimDeviceType.iPhone-17-Pro',
    'isAvailable' => true, 'state' => 'Shutdown' }.merge(attributes.transform_keys(&:to_s))
end

checks = 0
check = lambda do |condition, message|
  raise message unless condition

  checks += 1
end
select = ->(sdk, runtimes, devices) { JobsSimulatorSelection.select(sdk, runtimes, devices).fetch(:device).fetch('udid') }
old = runtime('18.5')
current = runtime('26.2')
current_id = current.fetch('identifier')
old_phone = iphone(1, state: 'Booted')
phone = iphone(2)
devices = { old.fetch('identifier') => [old_phone], current_id => [phone] }
check.call(select.call('26.2', [old, current], devices) == phone['udid'], 'Booted iOS 18.5 displaced the SDK generation')
check.call(select.call('26.2', [current, old], devices) == phone['udid'], 'JSON ordering changed selection')

older = runtime('26.9')
newer = runtime('26.10')
numeric = { older['identifier'] => [iphone(3, state: 'Booted')], newer['identifier'] => [iphone(4)] }
check.call(select.call('26.2', [older, newer], numeric) == iphone(4)['udid'], 'Runtime sorting is lexical')
check.call(select.call('26.2', [older, newer], { older['identifier'] => [iphone(3)] }) == iphone(3)['udid'], 'Empty newest runtime masked another matching runtime')

unavailable = runtime('26.11', isAvailable: false)
intel = runtime('26.12', supportedArchitectures: ['x86_64'])
wrong_platform = runtime('26.13', platform: 'tvOS')
tvos = runtime('26.14').merge('identifier' => 'com.apple.CoreSimulator.SimRuntime.tvOS-26-14')
inventory = [current, unavailable, intel, wrong_platform, tvos]
all_devices = inventory.to_h { |item| [item.fetch('identifier'), [iphone(5)]] }
all_devices[current_id] = [phone]
check.call(select.call('26.2', inventory, all_devices) == phone['udid'], 'Unavailable, Intel, or non-iOS runtime was accepted')

renamed_ipad = iphone(6, deviceTypeIdentifier: 'com.apple.CoreSimulator.SimDeviceType.iPad-Pro', state: 'Booted')
renamed_iphone = iphone(7, name: 'CI phone')
check.call(select.call('26.2', [current], { current_id => [renamed_ipad, renamed_iphone] }) == renamed_iphone['udid'], 'Device display name was used as its type')
check.call(select.call('26.2', [current], { current_id => [iphone(8, isAvailable: false), phone] }) == phone['udid'], 'Unavailable device was accepted')
check.call(select.call('26.2', [current], { current_id => [phone, iphone(9, state: 'Booted')] }) == iphone(9)['udid'], 'Booted preference within matching runtime was lost')
check.call(select.call('26.2', [current.reject { |key, _| key == 'supportedArchitectures' }], { current_id => [phone] }) == phone['udid'], 'Older runtime JSON schema was rejected')
check.call(select.call('26.2', [current], { current_id => [iphone(10, udid: "invalid\nINJECT=1"), phone] }) == phone['udid'], 'Invalid UDID was accepted')

[
  ['26.2', [old], { old['identifier'] => [old_phone] }],
  ['26.2', [current], { current_id => [iphone(11, isAvailable: false)] }],
  ['26.2', [current], {}],
  ["26.2\n", [current], { current_id => [phone] }]
].each do |arguments|
  rejected = false
  begin
    select.call(*arguments)
  rescue ArgumentError
    rejected = true
  end
  check.call(rejected, "Missing or invalid matching runtime did not fail: #{arguments.first.inspect}")
end
puts "Simulator selection: #{checks} checks PASS"
