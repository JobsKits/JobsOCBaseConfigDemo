require_relative '../Support/ProductionPaths'

# frozen_string_literal: true
# 从当前生产实现抽取事务方法，链接工程实际 FMDB 和 SQLite；不安装依赖或修改工程。
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
require 'open3'

pod_root = JobsComponentStability.project_root
project_root = JobsComponentStability.project_root
source = File.read(JobsComponentStability.production_path('Libs/OCBaseConfig/JobsMixFunc/FMDatabaseExtra/FMDatabase+Manager/FMDatabase+Manager.m'))
def method_source(source, signature)
  start = source.index(signature) or abort "Missing production method: #{signature}"
  opening = source.index('{', start)
  depth = 1
  cursor = opening + 1
  while depth.positive?
    depth += 1 if source[cursor] == '{'
    depth -= 1 if source[cursor] == '}'
    cursor += 1
    abort 'Unbalanced method' if cursor >= source.length
  end
  source[start...cursor]
end
methods = ['-(BOOL)handleExecuteUpdate:', '-(BOOL)jobsPerformTransaction:', '-(void)handleMultiThreadedProtectionDB:'].map { |signature| method_source(source, signature) }.join("\n\n")
fmdb = File.join(project_root, 'Pods/FMDB/src/fmdb')
abort "Install existing FMDB dependency before running: #{fmdb}" unless File.file?(File.join(fmdb, 'FMDatabase.m'))
Dir.mktmpdir('jobs-fmdb-regression-') do |directory|
  input = File.join(directory, 'regression.m')
  File.write(input, <<~OC)
    #import <Foundation/Foundation.h>
    #import <objc/runtime.h>
    #import "FMDatabase.h"
    #import "FMDatabaseQueue.h"
    typedef BOOL (^JobsRetBOOLByIDBlock)(id);
    typedef void (^jobsByIDBlock)(id);
    static char JobsFMTransactionErrorKey;
    @interface FMDatabase (JobsRegression)
    -(BOOL)jobsPerformTransaction:(JobsRetBOOLByIDBlock)body error:(NSError **)error;
    -(BOOL)handleExecuteUpdate:(NSString *)sql withArgumentsInArray:(NSArray *)arguments;
    -(void)handleMultiThreadedProtectionDB:(NSString *)path doWith:(jobsByIDBlock)body;
    @end
    @implementation FMDatabase (JobsRegression)
    #{methods}
    @end
    static void check(BOOL condition, NSString *message) {
        if (!condition) { fprintf(stderr, "%s\\n", message.UTF8String); exit(1); }
    }
    static int count(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT COUNT(*) FROM sample"];
        check([result next], @"row query failed");
        int value = [result intForColumnIndex:0];
        [result close];
        return value;
    }
    int main(void) {
        @autoreleasepool {
            FMDatabase *db = [FMDatabase databaseWithPath:@":memory:"];
            check([db open], @"open failed");
            check([db executeUpdate:@"CREATE TABLE sample(id INTEGER PRIMARY KEY)"], @"schema failed");
            NSError *error = nil;
            check([db jobsPerformTransaction:^BOOL(id database) {
                return [database handleExecuteUpdate:@"INSERT INTO sample VALUES(1)" withArgumentsInArray:nil];
            } error:&error], @"successful transaction failed");
            check(!error && db.isOpen && count(db) == 1, @"commit/connection ownership failed");
            check(![db jobsPerformTransaction:^BOOL(id database) {
                [database handleExecuteUpdate:@"INSERT INTO sample VALUES(2)" withArgumentsInArray:nil];
                [database handleExecuteUpdate:@"INSERT INTO missing VALUES(3)" withArgumentsInArray:nil];
                [database handleExecuteUpdate:@"INSERT INTO sample VALUES(4)" withArgumentsInArray:nil];
                return YES;
            } error:&error], @"intermediate SQL failure was committed");
            check(error && count(db) == 1 && !db.isInTransaction, @"failed SQL left partial data");
            check(![db jobsPerformTransaction:^BOOL(id database) {
                [database handleExecuteUpdate:@"INSERT INTO sample VALUES(5)" withArgumentsInArray:nil];
                @throw [NSException exceptionWithName:@"fixture" reason:@"expected" userInfo:nil];
            } error:&error], @"exception was swallowed as success");
            check(error && count(db) == 1 && db.isOpen, @"exception rollback failed");
            check(![db jobsPerformTransaction:^BOOL(id database) { return NO; } error:&error] && error, @"false body contract failed");
            check([db beginTransaction], @"outer begin failed");
            check(![db jobsPerformTransaction:^BOOL(id database) { return YES; } error:&error], @"nested transaction accepted");
            check(db.isInTransaction, @"nested rejection ended caller transaction");
            [db rollback];
            [db close];
            NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSUUID.UUID.UUIDString stringByAppendingString:@".sqlite"]];
            FMDatabase *closed = [FMDatabase databaseWithPath:path];
            check([closed jobsPerformTransaction:^BOOL(id database) {
                return [database handleExecuteUpdate:@"CREATE TABLE sample(id INTEGER PRIMARY KEY)" withArgumentsInArray:nil];
            } error:&error] && !closed.isOpen, @"owned connection not closed");
            dispatch_apply(30, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
                [closed handleMultiThreadedProtectionDB:path doWith:^(id database) {
                    check([database executeUpdate:@"INSERT INTO sample VALUES(?)", @(index)], @"shared path write failed");
                }];
            });
            [closed open];
            check(count(closed) == 30, @"concurrent path writes lost");
            [closed close];
            [NSFileManager.defaultManager removeItemAtPath:path error:nil];
            puts("PASS: FMDB commit, SQL/exception rollback, nested rejection, connection ownership, 30 shared-path writers");
        }
        return 0;
    }
  OC
  command = ['clang', '-fobjc-arc', '-fblocks', '-Wno-deprecated-declarations', '-I', fmdb,
             '-framework', 'Foundation', '-lsqlite3', input,
             *%w[FMDatabase.m FMDatabaseQueue.m FMResultSet.m].map { |name| File.join(fmdb, name) },
             '-o', File.join(directory, 'regression')]
  output, status = Open3.capture2e(*command)
  abort output unless status.success?
  output, status = Open3.capture2e(File.join(directory, 'regression'))
  puts output
  abort 'Regression failed' unless status.success?
end
