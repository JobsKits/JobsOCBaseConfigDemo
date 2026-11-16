require_relative '../Support/ProductionPaths'

#!/usr/bin/env ruby
# JobsBaseUI 的原始生产安全解档内核回归；不访问系统 Keychain。
# Created by Jobs on 2026年10月5日，星期一.

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

project_root = JobsComponentStability.project_root
source = JobsComponentStability.production_path('Libs/JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/JobsKeychainHelper/JobsKeychainHelper.m')
header = File.read(source.sub(/\.m\z/, '.h'))
guard = header[/^#ifndef\s+(\w+)/, 1]
interface = header[/@interface JobsKeychainHelper : NSObject.*?@end/m]
raise 'Missing canonical public interface / header guard' unless guard && interface
block_root = JobsComponentStability.production_path('Libs/OCBaseConfig/JobsBlock/Core')
block_headers = Dir.glob(File.join(block_root, '**', '*.h'))
typedefs = %w[JobsRetIDByStrBlock JobsRetBOOLByStrBlock jobsByStrBlock].map do |name|
  pattern = /\(\^#{Regexp.escape(name)}\)/
  declaration = block_headers.lazy.flat_map { |path| File.readlines(path) }.find do |line|
    line.start_with?('typedef ') && line.match?(pattern)
  end
  raise "Missing canonical JobsBlock #{name}" unless declaration
  declaration
end.join

main = <<~'OBJC'
  //
  //  JobsKeychainDecodeRegression.m
  //  JobsBaseUI
  //
  //  Created by Jobs on 2026年10月5日，星期一.
  //

  #import <Foundation/Foundation.h>
  #import <Security/Security.h>
  #import <objc/runtime.h>
  #define __HEADER_GUARD__
  __TYPEDEFS__
  __INTERFACE__
  // 完整工程可能可见同名 BOOL selector，确保内核使用具体 Foundation 接收类型。
  @protocol JobsKeychainArrayNameCollision <NSObject>
  @property (nonatomic, readonly) BOOL array;
  @end

  // 原始实现作为 include 时被 Clang 当作头文件；这里只关闭该上下文产生的完整性警告。
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wnullability-completeness"
  #import __PRODUCTION_SOURCE__
  #pragma clang diagnostic pop

  static void JobsCheck(BOOL condition, NSString *message) {
      if (!condition) {
          fprintf(stderr, "FAIL: %s\n", message.UTF8String);
          exit(EXIT_FAILURE);
      }
  }

  static NSData *JobsArchive(id value) {
      NSError *error = nil;
      NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value requiringSecureCoding:YES error:&error];
      JobsCheck(data != nil && error == nil, @"secure fixture archive");
      return data;
  }

  int main(void) {
      @autoreleasepool {
          NSError *error = nil;
          NSData *stringData = JobsArchive(@"original");
          NSSet *strings = [NSSet setWithObject:NSString.class];
          JobsCheck([JobsKeychainDecodeData(stringData, strings, &error) isEqual:@"original"] && error == nil,
                    @"NSString allowed");
          JobsCheck(JobsKeychainDecodeData(stringData, [NSSet setWithObject:NSDate.class], &error) == nil &&
                    error.code == errSecDecode, @"NSDate does not authorize primitive NSString");
          JobsCheck([JobsKeychainDecodeData(stringData, strings, &error) isEqual:@"original"] && error == nil,
                    @"success clears previous decode error");

          NSArray *payload = @[@{@"label": @"value", @"count": @1}];
          NSData *nestedData = JobsArchive(payload);
          NSSet *withoutNumbers = [NSSet setWithObjects:NSArray.class, NSDictionary.class, NSString.class, nil];
          JobsCheck(JobsKeychainDecodeData(nestedData, withoutNumbers, &error) == nil &&
                    error.code == errSecDecode, @"nested primitive NSNumber denied");
          JobsCheck([JobsKeychainDecodeData(nestedData, [withoutNumbers setByAddingObject:NSNumber.class], &error)
                    isEqual:payload] && error == nil, @"explicit container and leaf whitelist succeeds");
          JobsCheck(JobsKeychainDecodeData(JobsArchive(@{@"key": @"value"}),
                    [NSSet setWithObjects:NSDictionary.class, NSDate.class, nil], &error) == nil &&
                    error.code == errSecDecode, @"dictionary string keys also checked");

          NSSet *setValue = [NSSet setWithObject:@"member"];
          JobsCheck([JobsKeychainDecodeData(JobsArchive(setValue),
                    [NSSet setWithObjects:NSSet.class, NSString.class, nil], &error) isEqual:setValue] &&
                    error == nil, @"set members allowed");
          JobsCheck(JobsKeychainDecodeData(JobsArchive(setValue), [NSSet setWithObject:NSSet.class], &error) == nil,
                    @"set primitive members denied");
          NSOrderedSet *ordered = [NSOrderedSet orderedSetWithObject:@"member"];
          JobsCheck([JobsKeychainDecodeData(JobsArchive(ordered),
                    [NSSet setWithObjects:NSOrderedSet.class, NSArray.class, NSString.class, nil], &error)
                    isEqual:ordered] && error == nil, @"ordered-set members allowed");

          for (id invalid in @[@42, @[], [NSSet setWithObject:@"NSString"], NSSet.new,
                                [NSSet setWithObject:object_getClass(NSObject.class)]]) {
              JobsCheck(JobsKeychainDecodeData(stringData, invalid, &error) == nil &&
                        error.code == errSecParam, @"invalid allowedClasses rejects safely");
              JobsCheck([JobsKeychainHelper loadService:@"no-security-call" allowedClasses:invalid error:&error] == nil &&
                        error.code == errSecParam, @"facade rejects invalid classes before Security");
          }
          JobsCheck(JobsKeychainDecodeData(stringData, nil, &error) == nil && error.code == errSecParam,
                    @"nil whitelist rejected");
          JobsCheck([JobsKeychainHelper loadService:@"no-security-call" allowedClasses:nil error:&error] == nil &&
                    error.code == errSecParam, @"facade nil whitelist rejected before Security");
          JobsCheck(JobsKeychainDecodeData(NSData.new, strings, &error) == nil && error.code == errSecDecode,
                    @"empty archive rejected");
          JobsCheck(JobsKeychainDecodeData([@"invalid" dataUsingEncoding:NSUTF8StringEncoding], strings, &error) == nil &&
                    error != nil, @"malformed archive rejected");
          JobsCheck(JobsKeychainDecodeData(stringData, [NSSet setWithObject:NSDate.class], NULL) == nil,
                    @"optional NSError pointer safe");

          NSMutableArray *cycle = NSMutableArray.new;
          id cycleReference = cycle;
          [cycle addObject:cycleReference];
          JobsCheck(JobsKeychainDecodedGraphIsAllowed(cycle, [NSSet setWithObject:NSArray.class]),
                    @"identity traversal terminates on cycles");
          [cycle removeAllObjects];
          puts("PASS: unchanged production .m; strict root/container whitelist, invalid classes, nil, errors, cycles; no system Keychain I/O");
      }
      return EXIT_SUCCESS;
  }
OBJC
main = main.gsub('__HEADER_GUARD__', guard)
           .gsub('__TYPEDEFS__', typedefs)
           .gsub('__INTERFACE__', interface)
           .gsub('__PRODUCTION_SOURCE__', source.to_json)

Dir.mktmpdir('JobsKeychainDecodeRegression-') do |directory|
  path = File.join(directory, 'JobsKeychainDecodeRegression.m')
  binary = File.join(directory, 'JobsKeychainDecodeRegression')
  File.write(path, main)
  command = ['xcrun', '--sdk', 'macosx', 'clang', '-fobjc-arc', '-fblocks', '-fmodules',
             "-fmodules-cache-path=#{File.join(directory, 'ModuleCache')}",
             '-framework', 'Foundation', '-framework', 'Security', path, '-o', binary]
  stdout, stderr, status = Open3.capture3(*command)
  puts stdout unless stdout.empty?
  warn stderr unless stderr.empty?
  exit status.exitstatus unless status.success?
  stdout, stderr, status = Open3.capture3(binary)
  puts stdout unless stdout.empty?
  warn stderr unless stderr.empty?
  exit status.exitstatus unless status.success?
end
