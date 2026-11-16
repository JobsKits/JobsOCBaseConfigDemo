require_relative '../Support/ProductionPaths'

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

pod_root = JobsComponentStability.project_root
core = JobsComponentStability.production_path('Libs/OCBaseConfig/JobsMixFunc/JobsOCCrashLog/JobsCrashSignalRecorder')
Dir.mktmpdir('jobs-signal-regression-') do |root|
  executable = File.join(root, 'signal-tests')
  output, status = Open3.capture2e('clang', '-std=c11', '-fsanitize=undefined', '-fno-sanitize-recover=all', '-I', core,
    File.join(core, 'JobsCrashSignalRecorder.c'), File.join(__dir__, 'JobsCrashSignalRecorderTests', 'JobsCrashSignalRecorderTests.c'), '-o', executable)
  abort output unless status.success?
  output, status = Open3.capture2e(executable, File.join(root, 'signals.bin'))
  puts output
  abort 'Signal regression failed' unless status.success?
end

# 普通导入使用当前生产内核；故障仅注入普通POSIX writer，不影响上面的pure-C signal回归。
crash_source = File.read(JobsComponentStability.production_path('Libs/OCBaseConfig/JobsMixFunc/JobsOCCrashLog/JobsOCCrashLogCenter/JobsOCCrashLogCenter.m'))
def jobs_crash_extract(source, signature)
  start = source.index(signature)
  abort "Missing production method #{signature}" unless start
  opening = source.index('{', start)
  depth = 1
  cursor = opening + 1
  while depth.positive?
    depth += 1 if source[cursor] == '{'
    depth -= 1 if source[cursor] == '}'
    cursor += 1
  end
  source[start...cursor]
end
writer = jobs_crash_extract(crash_source, 'static BOOL JobsOCCrashLogAppendDataToPath(')
initializer = jobs_crash_extract(crash_source, '-(instancetype)init{')
# 跳过 private declaration，只抽取实际生产 implementation。
implementation = crash_source[crash_source.index('@implementation JobsOCCrashLogCenter')..]
write_method = jobs_crash_extract(implementation, '-(BOOL)jobsWriteData:')
import_method = jobs_crash_extract(implementation, '-(BOOL)jobsImportSignalJournalAtPath:')
Dir.mktmpdir('jobs-crash-import-') do |directory|
  input = File.join(directory, 'import-regression.m')
  File.write(input, <<~OC)
    #import <Foundation/Foundation.h>
    #import <errno.h>
    #import <limits.h>
    #import <sys/stat.h>
    #import "JobsCrashSignalRecorder.h"
    typedef void (^jobsByVoidBlock)(void);
    static void *JobsOCCrashLogIOQueueSpecificKey = &JobsOCCrashLogIOQueueSpecificKey;
    static int failureMode, openCalls, writeCalls, syncCalls, closeCalls;
    static void *expectedQueueOwner;
    static BOOL wrongQueue;
    static int FixtureOpen(const char *path, int flags, mode_t mode) {
        openCalls += 1;
        if (failureMode == 1) { errno = EACCES; return -1; }
        if (failureMode == 7 && openCalls == 1) { errno = EINTR; return -1; }
        return open(path, flags, mode);
    }
    static ssize_t FixtureWrite(int descriptor, const void *bytes, size_t size) {
        writeCalls += 1;
        if (expectedQueueOwner && dispatch_get_specific(JobsOCCrashLogIOQueueSpecificKey) != expectedQueueOwner) wrongQueue = YES;
        if (failureMode == 2 || (failureMode == 3 && writeCalls > 1)) { errno = ENOSPC; return -1; }
        if (failureMode == 4) return 0;
        if (failureMode == 7 && writeCalls == 1) { errno = EINTR; return -1; }
        if (failureMode == 3 || failureMode == 7) size = MIN(size, (size_t)3);
        return write(descriptor, bytes, size);
    }
    static int FixtureSync(int descriptor) {
        syncCalls += 1;
        if (failureMode == 5) { errno = EIO; return -1; }
        if (failureMode == 7 && syncCalls == 1) { errno = EINTR; return -1; }
        return fsync(descriptor);
    }
    static int FixtureClose(int descriptor) {
        closeCalls += 1;
        int result = close(descriptor);
        if (failureMode == 6 || failureMode == 8) { errno = failureMode == 8 ? EINTR : EIO; return -1; }
        return result;
    }
    #define open FixtureOpen
    #define write FixtureWrite
    #define fsync FixtureSync
    #define close FixtureClose
    #{writer}
    #undef open
    #undef write
    #undef fsync
    #undef close
    @interface JobsOCCrashLogCenter : NSObject
    @property(strong)dispatch_queue_t ioQueue;
    @property(strong)NSMutableArray *notificationTokens;
    @property(copy)NSString *sessionID;
    @property(strong)NSDate *sessionStartedAt;
    -(BOOL)jobsWriteData:(NSData *)data toPath:(NSString *)path;
    -(BOOL)jobsImportSignalJournalAtPath:(NSString *)signalPath logPath:(NSString *)logPath;
    @end
    @implementation JobsOCCrashLogCenter
    #{initializer}
    #{write_method}
    #{import_method}
    @end
    static void check(BOOL condition, NSString *message) {
        if (!condition) { fprintf(stderr, "%s\\n", message.UTF8String); exit(1); }
    }
    static void reset(int mode) {
        failureMode = mode;
        openCalls = writeCalls = syncCalls = closeCalls = 0;
        expectedQueueOwner = NULL;
        wrongQueue = NO;
    }
    int main(void) {
        alarm(20);
        @autoreleasepool {
            NSString *directory = [NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString];
            check([NSFileManager.defaultManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil], @"fixture directory failed");
            NSString *journal = [directory stringByAppendingPathComponent:@"pending.signals"];
            JobsCrashSignalRecord records[] = {{JOBS_CRASH_SIGNAL_MAGIC, 1, SIGABRT, 41}, {JOBS_CRASH_SIGNAL_MAGIC, 1, SIGSEGV, 42}};
            NSData *original = [NSData dataWithBytes:records length:sizeof(records)];
            JobsOCCrashLogCenter *center = [JobsOCCrashLogCenter new];
            int failures[] = {1, 2, 3, 4, 5, 6, 8};
            for (NSUInteger index = 0; index < sizeof(failures)/sizeof(failures[0]); index++) {
                reset(failures[index]);
                check([original writeToFile:journal options:NSDataWritingAtomic error:nil], @"journal fixture write failed");
                NSString *log = [directory stringByAppendingPathComponent:[NSString stringWithFormat:@"failure-%d.log", failureMode]];
                check(![center jobsImportSignalJournalAtPath:journal logPath:log], @"failed POSIX operation reported import success");
                check([[NSData dataWithContentsOfFile:journal] isEqualToData:original], @"failed import erased journal");
                check(failureMode == 1 || closeCalls == 1, @"descriptor not closed exactly once");
            }
            reset(7);
            check([original writeToFile:journal options:NSDataWritingAtomic error:nil], @"journal fixture write failed");
            NSString *log = [directory stringByAppendingPathComponent:@"recovered.log"];
            check([center jobsImportSignalJournalAtPath:journal logPath:log], @"EINTR/short-write recovery failed");
            check(openCalls == 2 && writeCalls > 2 && syncCalls == 2 && closeCalls == 1, @"POSIX retry path not exercised");
            check([NSData dataWithContentsOfFile:journal].length == 0, @"successful import did not clear journal");
            NSString *text = [NSString stringWithContentsOfFile:log encoding:NSUTF8StringEncoding error:nil];
            check([text containsString:@"process=41"] && [text containsString:@"process=42"], @"successful import omitted a record");
            reset(0);
            records[1].magic = 0;
            NSData *invalid = [NSData dataWithBytes:records length:sizeof(records)];
            check([invalid writeToFile:journal options:NSDataWritingAtomic error:nil], @"malformed fixture write failed");
            check(![center jobsImportSignalJournalAtPath:journal logPath:log] && openCalls == 0, @"malformed journal imported valid prefix");
            check([[NSData dataWithContentsOfFile:journal] isEqualToData:invalid], @"malformed journal erased");
            check([[NSData dataWithBytes:"abc" length:3] writeToFile:journal options:NSDataWritingAtomic error:nil], @"truncated fixture write failed");
            check(![center jobsImportSignalJournalAtPath:journal logPath:log] && [NSData dataWithContentsOfFile:journal].length == 3, @"truncated journal erased");
            check([original writeToFile:journal options:NSDataWritingAtomic error:nil], @"reentry fixture write failed");
            __block BOOL reentrant = NO;
            dispatch_sync(center.ioQueue, ^{ reentrant = [center jobsImportSignalJournalAtPath:journal logPath:log]; });
            check(reentrant, @"own queue import failed or deadlocked");
            expectedQueueOwner = (__bridge void *)center;
            JobsOCCrashLogCenter *other = [JobsOCCrashLogCenter new];
            dispatch_sync(other.ioQueue, ^{
                check([center jobsWriteData:[@"foreign queue" dataUsingEncoding:NSUTF8StringEncoding] toPath:log], @"cross-instance write failed");
            });
            check(!wrongQueue, @"different instance bypassed owner IO queue");
            NSString *readOnlyDirectory = [directory stringByAppendingPathComponent:@"read-only"];
            check([NSFileManager.defaultManager createDirectoryAtPath:readOnlyDirectory withIntermediateDirectories:NO attributes:nil error:nil], @"readonly fixture directory failed");
            NSString *readOnlyJournal = [readOnlyDirectory stringByAppendingPathComponent:@"pending.signals"];
            check([original writeToFile:readOnlyJournal options:NSDataWritingAtomic error:nil], @"readonly journal fixture failed");
            chmod(readOnlyDirectory.fileSystemRepresentation, 0500);
            BOOL cleared = [center jobsImportSignalJournalAtPath:readOnlyJournal logPath:log];
            chmod(readOnlyDirectory.fileSystemRepresentation, 0700);
            check(!cleared && [[NSData dataWithContentsOfFile:readOnlyJournal] isEqualToData:original], @"journal clear failure erased evidence or reported success");
            [NSFileManager.defaultManager removeItemAtPath:directory error:nil];
            puts("PASS: current production crash import; open/write/short-write/zero-write/fsync/close failures preserve journal, EINTR recovery, malformed/truncated/clear failure, own/foreign queue isolation");
        }
        return 0;
    }
  OC
  output, status = Open3.capture2e('clang', '-fobjc-arc', '-fblocks', '-I', core, '-framework', 'Foundation', input, '-o', File.join(directory, 'import-regression'))
  abort output unless status.success?
  output, status = Open3.capture2e(File.join(directory, 'import-regression'))
  puts output
  abort 'Crash journal import regression failed' unless status.success?
end
