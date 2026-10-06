# frozen_string_literal: true
# 抽取当前生产启动/播放路径，替换会话与初始化 factory；不使用麦克风或真实 AudioSession。
require 'tmpdir'
require 'open3'
source = File.read(File.expand_path('../Core/JobsOCAudioRecorder.m', __dir__))
def extract(source, signature)
  start = source.index(signature)
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
start = extract(source, '-(BOOL)startWithMode:')
toggle = extract(source, '-(BOOL)toggleURL:')
by_player = extract(source, '-(JobsRetIDByIDBlock _Nonnull)byPlayer{')
Dir.mktmpdir('jobs-audio-failure-') do |directory|
  path = File.join(directory, 'regression.m')
  File.write(path, <<~OC)
    #import <Foundation/Foundation.h>
    #import <math.h>
    typedef NSUInteger JobsOCAudioRecordingMode;
    typedef void (^jobsByVoidBlock)(void);
    typedef id (^JobsRetIDByVoidBlock)(void);
    typedef id (^JobsRetIDByIDBlock)(id);
    typedef NSURL *(^JobsRetNSURLByJobsOCAudioRecordingModeBlock)(JobsOCAudioRecordingMode);
    #define JobsOCAudioRecordingModeShort 0
    #define AVFormatIDKey @"format"
    #define AVSampleRateKey @"rate"
    #define AVNumberOfChannelsKey @"channels"
    #define AVEncoderAudioQualityKey @"quality"
    #define kAudioFormatMPEG4AAC 1
    #define AVAudioQualityHigh 1
    #define AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation 1
    #define jobs_weakify(o) autoreleasepool {} __weak __typeof__(o) weak_##o = o;
    #define jobs_strongify(o) autoreleasepool {} __strong __typeof__(o) o = weak_##o;
    #define AVAudioSession JobsAudioFixtureSession
    #define AVAudioRecorder JobsAudioFixtureRecorder
    #define AVAudioPlayer JobsAudioFixturePlayer
    @interface AVAudioSession : NSObject
    @property NSUInteger deactivations;
    -(BOOL)setActive:(BOOL)active withOptions:(NSUInteger)options error:(NSError **)error;
    @end
    @implementation AVAudioSession
    -(BOOL)setActive:(BOOL)active withOptions:(NSUInteger)options error:(NSError **)error {
        if (!active) self.deactivations += 1;
        return YES;
    }
    @end
    @interface AVAudioRecorder : NSObject
    -(JobsRetIDByIDBlock)byDelegate;
    -(BOOL)prepareToRecord;
    -(BOOL)record;
    -(BOOL)recordForDuration:(NSTimeInterval)duration;
    -(void)stop;
    @end
    @interface AVAudioPlayer : NSObject
    @property(readonly)BOOL isPlaying;
    -(JobsRetIDByIDBlock)byDelegate;
    -(BOOL)play;
    -(void)stop;
    @end
    @class JobsOCAudioRecorderEngine;
    typedef JobsOCAudioRecorderEngine *(^RetMode)(JobsOCAudioRecordingMode);
    typedef JobsOCAudioRecorderEngine *(^RetKeep)(BOOL);
    typedef JobsOCAudioRecorderEngine *(^RetURL)(NSURL *);
    typedef JobsOCAudioRecorderEngine *(^RetRecorder)(AVAudioRecorder *);
    @interface NSObject (DelegateFixture)
    -(void)audioRecorderEngineDidStart:(id)engine;
    @end
    @interface JobsOCAudioRecorderEngine : NSObject
    @property(strong)AVAudioRecorder *recorder;
    @property(strong)NSURL *currentURL;
    @property BOOL stopping;
    @property(weak)id delegate;
    @property(strong)AVAudioSession *fixtureSession;
    @property(strong)NSURL *fixtureURL;
    +(JobsRetIDByVoidBlock)shared;
    -(RetMode)byMode;
    -(RetKeep)byKeepFile;
    -(RetURL)byCurrentURL;
    -(RetRecorder)byRecorder;
    -(JobsRetNSURLByJobsOCAudioRecordingModeBlock)recordingURLForMode;
    -(BOOL)activateRecordingSession:(AVAudioSession **)session error:(NSError **)error;
    -(AVAudioRecorder *)recorderWithURL:(NSURL *)URL settings:(NSDictionary *)settings error:(NSError **)error;
    @end
    @implementation JobsOCAudioRecorderEngine
    +(JobsRetIDByVoidBlock)shared {
        return ^id { static JobsOCAudioRecorderEngine *owner; if (!owner) owner=[self new]; return owner; };
    }
    -(BOOL)activateRecordingSession:(AVAudioSession **)session error:(NSError **)error {
        *session=self.fixtureSession; return YES;
    }
    -(AVAudioRecorder *)recorderWithURL:(NSURL *)URL settings:(NSDictionary *)settings error:(NSError **)error {
        [@"partial" writeToURL:URL atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if (error) *error=[NSError errorWithDomain:@"fixture" code:99 userInfo:nil];
        return nil;
    }
    -(JobsRetNSURLByJobsOCAudioRecordingModeBlock)recordingURLForMode {
        return ^NSURL *(JobsOCAudioRecordingMode mode) { return self.fixtureURL; };
    }
    #{start}
    @end
    @class JobsOCAudioPlayerEngine;
    typedef JobsOCAudioPlayerEngine *(^RetPlayingURL)(NSURL *);
    @interface JobsOCAudioPlayerEngine : NSObject
    @property(strong)AVAudioPlayer *player;
    @property(strong)NSURL *playingURL;
    @property(strong)AVAudioSession *fixtureSession;
    -(JobsRetIDByIDBlock)byPlayer;
    -(RetPlayingURL)byPlayingURL;
    -(jobsByVoidBlock)jobsStop;
    -(BOOL)activatePlaybackSession:(AVAudioSession **)session error:(NSError **)error;
    -(AVAudioPlayer *)playerWithURL:(NSURL *)URL error:(NSError **)error;
    @end
    @implementation JobsOCAudioPlayerEngine
    -(BOOL)activatePlaybackSession:(AVAudioSession **)session error:(NSError **)error {
        *session=self.fixtureSession; return YES;
    }
    -(AVAudioPlayer *)playerWithURL:(NSURL *)URL error:(NSError **)error {
        if (error) *error=[NSError errorWithDomain:@"fixture" code:100 userInfo:nil]; return nil;
    }
    -(RetPlayingURL)byPlayingURL {
        return ^JobsOCAudioPlayerEngine *(NSURL *URL) { self.playingURL=URL; return self; };
    }
    #{by_player}
    #{toggle}
    @end
    static void check(BOOL condition, NSString *description) {
        if (!condition) { fprintf(stderr, "%s\\n", description.UTF8String); exit(1); }
    }
    int main(void) {
        @autoreleasepool {
            JobsOCAudioRecorderEngine *engine=[JobsOCAudioRecorderEngine new];
            engine.fixtureSession=[AVAudioSession new];
            engine.fixtureURL=[NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:NSUUID.UUID.UUIDString]];
            NSError *error=nil;
            check(![engine startWithMode:0 maximumDuration:1 error:&error], @"nil recorder returned success");
            check(error.code==99 && engine.fixtureSession.deactivations==1, @"recorder error/session cleanup incorrect");
            check(!engine.recorder && !engine.currentURL && ![NSFileManager.defaultManager fileExistsAtPath:engine.fixtureURL.path], @"recorder failure leaked state or partial file");
            JobsOCAudioPlayerEngine *player=[JobsOCAudioPlayerEngine new];
            player.fixtureSession=[AVAudioSession new];
            check(![player toggleURL:engine.fixtureURL error:&error], @"nil player returned success");
            check(error.code==100 && player.fixtureSession.deactivations==1 && !player.player && !player.playingURL, @"player error/session cleanup incorrect");
            puts("PASS: production start/toggle nil initialization, NSError preservation, partial-file cleanup, session deactivation; no audio hardware/session access");
        }
        return 0;
    }
  OC
  output, status = Open3.capture2e('clang', '-fobjc-arc', '-fblocks', '-Wno-incomplete-implementation', '-framework', 'Foundation', path, '-o', File.join(directory,'regression'))
  abort output unless status.success?
  output, status = Open3.capture2e(File.join(directory,'regression'))
  puts output
  abort 'Audio initialization regression failed' unless status.success?
end
