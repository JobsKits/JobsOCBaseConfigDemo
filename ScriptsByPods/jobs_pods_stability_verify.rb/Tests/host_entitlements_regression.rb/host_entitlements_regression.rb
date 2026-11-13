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

require 'fileutils'
require 'json'
require 'open3'
require 'tmpdir'
require_relative '../../jobs_stability_host_entitlements.rb/jobs_stability_host_entitlements'

# 用途：用 clang 生成模拟器 Mach-O，验证各架构真实二进制的权限读取与身份校验；不启动 iOS 或 xcodebuild。
# 运行：终端用 ruby 执行本文件；可附加本次测试宿主可执行文件进行实际验收，默认只跑独立 fixture。

abort 'Usage: ruby host_entitlements_regression.rb [HOST_BINARY]' if ARGV.length > 1
host_binary = File.expand_path(ARGV.first) if ARGV.first
abort "指定的 AppHost executable 不存在：#{host_binary}" if host_binary && !File.file?(host_binary)

# 失败立即退出，保留系统工具的真实诊断。
def assert(condition, message)
  raise message unless condition
end

# 执行fixture编译/读取工具，任何实际失败均不当作成功。
def run_tool(*command)
  output, error, status = Open3.capture3(*command)
  raise "#{command.inspect} failed (#{status.exitstatus}): #{output}\n#{error}" unless status.success?
  output.strip
end

# 真实clang链接Simulator executable，刻意不附加codesign签名。
def build_binary(folder, name, architecture, plist: nil)
  source = File.join(folder, 'main.c')
  File.write(source, "int main(void) { return 0; }\n") unless File.exist?(source)
  binary = File.join(folder, name)
  command = [$fixture_clang, '-target', "#{architecture}-apple-ios16.6-simulator", '-isysroot', $fixture_sdk,
    source, '-o', binary, '-Wl,-no_adhoc_codesign']
  if plist
    path = File.join(folder, name + '.plist')
    File.write(path, plist)
    command << "-Wl,-sectcreate,__TEXT,__entitlements,#{path}"
  end
  run_tool(*command)
  binary
end

# fixture生成数据与audit实现无关：只声明预期的宿主权限值。
def entitlement_xml(identifier, empty: false)
  content = empty ? '' : <<~XML
    <key>application-identifier</key><string>#{identifier}</string>
    <key>keychain-access-groups</key><array><string>#{identifier}</string></array>
    <key>get-task-allow</key><true/>
  XML
  '<?xml version="1.0" encoding="UTF-8"?><plist version="1.0"><dict>' + content + '</dict></plist>'
end

# 每个arch独立检查，防止只读取fat首片就接受整个宿主。
def assert_valid(result, architectures)
  assert(result['valid'], JSON.pretty_generate(result))
  assert(result.fetch('architectures').map { |row| row['architecture'] }.sort == architectures.sort, 'architecture coverage differs')
  assert(result['architectures'].all? { |row| row['valid'] && row['section']['size'].positive? }, 'compiled section proof missing')
end

# 负向结果必须保留具体架构诊断，而不是仅返回空字典。
def assert_invalid(result, text = nil)
  assert(!result['valid'], 'invalid compiled permissions accepted')
  errors = ([result['error']] + result['architectures'].map { |row| row['error'] }).compact.join('\n')
  assert(!errors.empty?, 'invalid compiled permissions lost error evidence')
  assert(errors.include?(text), "missing error #{text}: #{errors}") if text
end

$fixture_clang = run_tool('/usr/bin/xcrun', '--sdk', 'iphonesimulator', '--find', 'clang')
$fixture_sdk = run_tool('/usr/bin/xcrun', '--sdk', 'iphonesimulator', '--show-sdk-path')
identifier = 'org.jobs.StabilityFixture'
passed = 0
Dir.mktmpdir('jobs-host-entitlements-regression-') do |folder|
  arm64 = build_binary(folder, 'valid-arm64', 'arm64', plist: entitlement_xml(identifier))
  x86 = build_binary(folder, 'valid-x86_64', 'x86_64', plist: entitlement_xml(identifier))
  _, _, thin_signature = Open3.capture3('/usr/bin/codesign', '--verify', '--strict', arm64)
  assert(!thin_signature.success?, 'permission extractor must be tested independently of a valid code signature')
  assert_valid(JobsStabilityHostEntitlements.audit(arm64, bundle_identifier: identifier), ['arm64'])
  puts 'PASS real unsigned thin Simulator binary contains valid compiled entitlement bytes'
  passed += 1

  fat = File.join(folder, 'valid-fat')
  run_tool('/usr/bin/lipo', '-create', arm64, x86, '-output', fat)
  assert_valid(JobsStabilityHostEntitlements.audit(fat, bundle_identifier: identifier), %w[arm64 x86_64])
  puts 'PASS real fat Simulator binary validates every architecture'
  passed += 1

  missing = build_binary(folder, 'missing', 'arm64')
  # 相邻源权限文件存在不能使缺少compiled section的executable通过。
  File.write(missing + '.xcent', entitlement_xml(identifier))
  _, _, signature = Open3.capture3('/usr/bin/codesign', '--verify', '--strict', missing)
  assert(!signature.success?, 'unsigned fixture unexpectedly has a valid signature')
  assert_invalid(JobsStabilityHostEntitlements.audit(missing, bundle_identifier: identifier), 'exactly one __TEXT,__entitlements')
  puts 'PASS actual unsigned binary without section rejects adjacent xcent source proof'
  passed += 1

  empty = build_binary(folder, 'empty', 'arm64', plist: entitlement_xml(identifier, empty: true))
  assert_invalid(JobsStabilityHostEntitlements.audit(empty, bundle_identifier: identifier), 'do not match')
  puts 'PASS compiled empty dictionary is rejected'
  passed += 1

  wrong = build_binary(folder, 'wrong-x86_64', 'x86_64', plist: entitlement_xml('org.jobs.WrongHost'))
  assert_invalid(JobsStabilityHostEntitlements.audit(wrong, bundle_identifier: identifier), 'do not match')
  puts 'PASS compiled wrong bundle identifier is rejected'
  passed += 1

  mixed = File.join(folder, 'mixed-fat')
  run_tool('/usr/bin/lipo', '-create', arm64, wrong, '-output', mixed)
  mixed_result = JobsStabilityHostEntitlements.audit(mixed, bundle_identifier: identifier)
  assert_invalid(mixed_result, 'do not match')
  assert(mixed_result['architectures'].count { |row| row['valid'] } == 1, 'mixed fat architecture isolation not proven')
  puts 'PASS valid first architecture cannot hide invalid sibling architecture'
  passed += 1

  malformed = build_binary(folder, 'malformed', 'arm64', plist: 'not a property list')
  assert_invalid(JobsStabilityHostEntitlements.audit(malformed, bundle_identifier: identifier), 'plutil failed')
  puts 'PASS actual compiled non-plist section is rejected'
  passed += 1

  beyond = File.join(folder, 'out-of-bounds')
  bytes = File.binread(arm64)
  record = bytes.index('__entitlements'.ljust(16, "\0"))
  assert(record, 'real section_64 fixture record missing')
  # Apple section_64布局中offset位于记录+48；修改实际load-command，不伪造otool输出。
  bytes[record + 48, 4] = [bytes.bytesize + 4096].pack('V')
  File.binwrite(beyond, bytes)
  beyond_result = JobsStabilityHostEntitlements.audit(beyond, bundle_identifier: identifier)
  assert_invalid(beyond_result)
  assert(beyond_result['architectures'].all? { |row| !row.key?('entitlements') }, 'out-of-bounds section was read as permissions')
  puts 'PASS actual Mach-O section offset beyond EOF is rejected'
  passed += 1

  assert_invalid(JobsStabilityHostEntitlements.audit(File.join(folder, 'does-not-exist'), bundle_identifier: identifier), 'readable file')
  assert_invalid(JobsStabilityHostEntitlements.audit(nil, bundle_identifier: identifier))
  puts 'PASS missing/non-path input is rejected without source fallback'
  passed += 1
end

# 显式验收调用方当次构建的宿主，不依赖开发机残留的 work/Products 路径。
if host_binary
  bundle_identifier = run_tool('/usr/bin/plutil', '-extract', 'CFBundleIdentifier', 'raw', '-o', '-', File.join(File.dirname(host_binary), 'Info.plist'))
  actual = JobsStabilityHostEntitlements.audit(host_binary, bundle_identifier: bundle_identifier)
  assert_valid(actual, run_tool('/usr/bin/lipo', '-archs', host_binary).split)
  puts "PASS real task AppHost compiled permissions (#{actual['architectures'].map { |row| row['architecture'] }.join(',')})"
  passed += 1
  puts JSON.pretty_generate(actual)
end
puts "#{passed} real-Mach-O scenarios passed; no Xcode build/install or iOS launch executed."
