# 真实时间原语 macOS 回归；临时头只提取现有 JobsBlock typedef/时间枚举，不改生产源。
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
require 'open3'
require 'fileutils'

pod_root = File.expand_path('..', __dir__)
pods_root = File.dirname(pod_root)
core = File.join(pod_root, 'Core/Foundation/NSString+JobsModelTime')
block_header = File.join(pods_root, 'JobsBlock@Pods/Core/确定参数的Block/ReturnByCertainParametersBlock/ReturnByCertainParametersBlock.h')
block_type = File.readlines(block_header).find { |line| line.start_with?('typedef ') && line.include?('(^JobsRetStrByStrBlock)') }
abort 'JobsBlock canonical typedef 未找到' unless block_type
enum_header = File.join(pods_root, 'JobsOCDefs@Pods/Core/JobsDefines/JobsDefineEnums/JobsDefineTimeEnums/JobsDefineTimeEnums.h')
sdk, errors, status = Open3.capture3('xcrun', '--sdk', 'macosx', '--show-sdk-path')
abort errors unless status.success?

source = <<~'OBJC'
//
//  main.m
//  JobsModelTimestampRegression
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "NSString+JobsModelTime.h"

static void Check(BOOL condition, NSString *message) {
    if (!condition) {
        fprintf(stderr, "%s\n", message.UTF8String);
        exit(1);
    }
}

int main(void) {
    @autoreleasepool {
        Check([@"1700000000000".chinaTime(nil) isEqual:@"2023-11-15 06:13:20"], @"China millisecond formatting failed");
        Check([[@"1700000000" timeStampByTimeFormatter:nil timeZoneType:TimeZoneTypeUTC intervalStyle:intervalBySec] isEqual:@"2023-11-14 22:13:20"], @"UTC second formatting failed");
        Check([@"0".chinaTime(@"") isEqual:@"1970-01-01 08:00:00"], @"Empty default format failed");
        NSString *nul = [NSString stringWithFormat:@"1700000000%Ctail", (unichar)0];
        for (NSString *value in @[@"", @".", @"-1", @"nan", @"1e3", @"1.2.3", @"123tail", nul]) {
            NSTimeInterval seconds = 42;
            Check(!JobsModelParseTimestamp(value, NO, &seconds) && seconds == 42, @"Invalid parse modified output");
            Check(value.chinaTime(nil) == nil, @"Invalid timestamp became formatted epoch");
        }
        Check([@"0" timeStampByTimeFormatter:nil timeZoneType:TimeZoneTypeUTC intervalStyle:(IntervalStyle)999] == nil, @"Unknown unit accepted");
        NSTimeInterval seconds = -1;
        Check(JobsModelParseTimestamp(@"1000.5", YES, &seconds) && fabs(seconds - 1.0005) < 0.000001, @"Fractional milliseconds failed");
        JobsRetStrByStrBlock saved;
        __weak NSString *weakOwner;
        @autoreleasepool {
            NSMutableString *owner = [NSMutableString stringWithString:@"1700000000000"];
            weakOwner = owner;
            saved = owner.chinaTime;
        }
        Check(weakOwner == nil && saved(nil) == nil, @"Saved formatter block retained or dereferenced dead owner");
        puts("JobsModel timestamp: real implementation units, POSIX/Gregorian/IANA/default format, invalid/NUL/output preservation, weak lifecycle passed");
    }
    return 0;
}
OBJC

Dir.mktmpdir('jobs-model-timestamp-') do |directory|
  FileUtils.mkdir_p(File.join(directory, 'JobsBlock'))
  FileUtils.mkdir_p(File.join(directory, 'JobsOCDefs'))
  File.write(File.join(directory, 'JobsBlock/JobsBlock.h'), "#import <Foundation/Foundation.h>\n#{block_type}")
  FileUtils.cp(enum_header, File.join(directory, 'JobsOCDefs/JobsDefineTimeEnums.h'))
  main = File.join(directory, 'main.m')
  executable = File.join(directory, 'regression')
  File.write(main, source)
  arguments = ['xcrun', '--sdk', 'macosx', 'clang', '-fobjc-arc', '-fblocks', '-isysroot', sdk.strip,
               '-framework', 'Foundation', '-I', directory, '-I', core,
               main, File.join(core, 'NSString+JobsModelTime.m'), '-o', executable]
  output, errors, status = Open3.capture3(*arguments)
  warn errors unless errors.empty?
  abort output unless status.success?
  output, errors, status = Open3.capture3(executable)
  print output
  warn errors unless errors.empty?
  abort 'Timestamp regression failed' unless status.success?
end
