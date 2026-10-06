# frozen_string_literal: true
# 编译当前生产缓存与订阅 token，通过本地 task 替身验证共享和独立取消；不访问网络。
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
