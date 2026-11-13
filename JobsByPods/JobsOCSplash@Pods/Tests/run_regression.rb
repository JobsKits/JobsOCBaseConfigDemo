# frozen_string_literal: true
# 编译当前生产缓存与订阅 token，通过本地 task 替身验证共享和独立取消；不访问网络。
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
root = File.expand_path('..', __dir__)
cache = File.read(File.join(root, 'Core/JobsOCSplash/JobsOCSplashMediaCache/JobsOCSplashMediaCache.m')).sub('#import "JobsOCSplashMediaCache.h"', '')
token = File.read(File.join(root, 'Core/JobsOCSplash/JobsOCSplashMediaDownloadToken/JobsOCSplashMediaDownloadToken.m')).sub('#import "JobsOCSplashMediaDownloadToken.h"', '')
Dir.mktmpdir('jobs-splash-') do |directory|
  source = File.join(directory, 'regression.m')
  File.write(source, <<~OC)
    #import <Foundation/Foundation.h>
    #import <ImageIO/ImageIO.h>
    #import <errno.h>
    #import <stdio.h>
    typedef void (^jobsByVoidBlock)(void);
    typedef id (^JobsRetIDByVoidBlock)(void);
    typedef void (^jobsByURLBlock)(NSURL *);
    typedef NSURL *(^JobsRetURLByURLBlock)(NSURL *);
    typedef NSTimeInterval (^JobsRetNSTimeIntervalByNSIntegerBlock)(NSInteger);
    typedef NSString *(^JobsRetStrByStrBlock)(NSString *);
    typedef void (^JobsOCSplashMediaCacheCompletion)(NSURL *, NSError *);
    #define Prop_strong(...) @property(nonatomic, strong)
    #define jobs_weakify(o) autoreleasepool {} __weak __typeof__(o) weak_##o = o;
    #define jobs_strongify(o) autoreleasepool {} __strong __typeof__(o) o = weak_##o;
    @interface JobsOCSplashMediaDownloadToken : NSObject
    @property(atomic, readonly, getter=isCancelled) BOOL cancelled;
    -(instancetype)initWithIdentifier:(NSUUID *)identifier cancellation:(jobsByVoidBlock)handler;
    -(jobsByVoidBlock)cancel;
    @end
    #{token}
    @interface JobsOCSplashMediaCache : NSObject
    +(JobsRetIDByVoidBlock)shared;
    -(JobsRetURLByURLBlock)cachedFileURLForRemoteURL;
    -(NSURLSessionDownloadTask *)download:(NSURL *)URL completion:(JobsOCSplashMediaCacheCompletion)completion;
    -(JobsOCSplashMediaDownloadToken *)downloadImage:(NSURL *)URL completion:(JobsOCSplashMediaCacheCompletion)completion;
    @end
    #{cache}
    @interface FixtureTask : NSObject
    @property NSUInteger cancellations;
    -(void)cancel;
    @end
    @implementation FixtureTask
    -(void)cancel { self.cancellations += 1; }
    @end
    @interface FixtureCache : JobsOCSplashMediaCache
    @property NSUInteger starts;
    @property(copy) JobsOCSplashMediaCacheCompletion completion;
    @property(strong) FixtureTask *fixtureTask;
    @end
    @implementation FixtureCache
    -(NSURLSessionDownloadTask *)download:(NSURL *)URL completion:(JobsOCSplashMediaCacheCompletion)completion {
        self.starts += 1;
        self.completion = completion;
        self.fixtureTask = [FixtureTask new];
        return (NSURLSessionDownloadTask *)self.fixtureTask;
    }
    @end
    static NSMutableArray *keptTokens;
    static void check(BOOL condition, NSString *description) {
        if (!condition) { fprintf(stderr, "%s\\n", description.UTF8String); exit(1); }
    }
    int main(void) {
        @autoreleasepool {
            FixtureCache *fixture = [FixtureCache alloc];
            dispatch_queue_t queue = dispatch_queue_create("splash.fixture", DISPATCH_QUEUE_SERIAL);
            [fixture setValue:queue forKey:@"stateQueue"];
            [fixture setValue:[NSMutableDictionary dictionary] forKey:@"imageTransfers"];
            keptTokens = [NSMutableArray array];
            NSURL *remote = [NSURL URLWithString:@"https://fixture.invalid/image.png"];
            JobsOCSplashMediaDownloadToken *first = [fixture downloadImage:remote completion:^(NSURL *URL, NSError *error) {
                check(NO, @"cancelled subscriber received completion");
            }];
            JobsOCSplashMediaDownloadToken *second = [fixture downloadImage:remote completion:^(NSURL *URL, NSError *error) {
                check(URL != nil && error == nil, @"surviving subscriber failed");
                JobsOCSplashMediaDownloadToken *third = [fixture downloadImage:remote completion:nil];
                [keptTokens addObject:third];
                dispatch_sync(queue, ^{});
                FixtureTask *task = fixture.fixtureTask;
                JobsOCSplashMediaCacheCompletion oldCompletion = fixture.completion;
                third.cancel();
                third.cancel();
                dispatch_sync(queue, ^{});
                check(task.cancellations == 1, @"last subscription did not cancel exactly once");
                JobsOCSplashMediaDownloadToken *fourth = [fixture downloadImage:remote completion:^(NSURL *newURL, NSError *newError) {
                    check(newError.code == 123 && newURL == nil, @"old completion corrupted new transfer");
                    puts("PASS: production URL coalescing, subscriber isolation, last-subscriber cancel, stale completion; no network access");
                    exit(0);
                }];
                [keptTokens addObject:fourth];
                dispatch_sync(queue, ^{});
                oldCompletion([NSURL fileURLWithPath:@"/old.png"], nil);
                dispatch_sync(queue, ^{});
                check([[fixture valueForKey:@"imageTransfers"] count] == 1, @"stale completion removed new group");
                fixture.completion(nil, [NSError errorWithDomain:@"fixture" code:123 userInfo:nil]);
            }];
            [keptTokens addObject:second];
            dispatch_sync(queue, ^{});
            check(fixture.starts == 1, @"same URL started duplicate downloads");
            FixtureTask *task = fixture.fixtureTask;
            first.cancel();
            dispatch_sync(queue, ^{});
            check(task.cancellations == 0, @"single unsubscribe cancelled other subscriber");
            fixture.completion([NSURL fileURLWithPath:@"/fixture.png"], nil);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                check(NO, @"completion timed out");
            });
        }
        dispatch_main();
    }
  OC
  output, status = Open3.capture2e('clang', '-fobjc-arc', '-fblocks', '-Wno-deprecated-declarations', '-framework', 'Foundation', '-framework', 'ImageIO', '-framework', 'CoreGraphics', source, '-o', File.join(directory, 'regression'))
  abort output unless status.success?
  output, status = Open3.capture2e(File.join(directory, 'regression'))
  puts output
  abort 'Splash regression failed' unless status.success?
end
