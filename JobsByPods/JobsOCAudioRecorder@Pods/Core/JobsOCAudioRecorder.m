//
//  JobsOCAudioRecorder.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import "JobsOCAudioRecorder.h"

#import <JobsOCTimer/JobsTimer.h>

@implementation JobsOCAudioRecording

#define JOBS_AUDIO_RECORDING_DSL(_selector_, _type_, _property_) \
-(_type_ _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCAudioRecording *_Nullable(__typeof__(self._property_) data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_AUDIO_RECORDING_DSL(byUrl, JobsRetJobsOCAudioRecordingByURLBlock, url)
JOBS_AUDIO_RECORDING_DSL(byMode, JobsRetJobsOCAudioRecordingByModeBlock, mode)
JOBS_AUDIO_RECORDING_DSL(byCreatedAt, JobsRetJobsOCAudioRecordingByDateBlock, createdAt)
JOBS_AUDIO_RECORDING_DSL(byDuration, JobsRetJobsOCAudioRecordingByTimeIntervalBlock, duration)
JOBS_AUDIO_RECORDING_DSL(byFileSize, JobsRetJobsOCAudioRecordingByLongLongBlock, fileSize)

#undef JOBS_AUDIO_RECORDING_DSL
@end

@implementation AVAudioRecorder (JobsOCAudioRecorderDSL)
-(JobsRetAVAudioRecorderByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof AVAudioRecorder *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
@end

@implementation AVAudioPlayer (JobsOCAudioRecorderDSL)
-(JobsRetAVAudioPlayerByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof AVAudioPlayer *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
@end

@interface JobsOCAudioRecordingStore ()
@property(nonatomic,strong,readwrite)NSURL *directoryURL;
@end

@implementation JobsOCAudioRecordingStore

+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static JobsOCAudioRecordingStore *store;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{ store = JobsOCAudioRecordingStore.new; });return store;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        NSURL *root = [NSFileManager.defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask].firstObject;
        _directoryURL = [root URLByAppendingPathComponent:@"JobsAudioRecordings" isDirectory:YES];
        [NSFileManager.defaultManager createDirectoryAtURL:_directoryURL withIntermediateDirectories:YES attributes:nil error:nil];
    };return self;
}

-(JobsRetNSURLByJobsOCAudioRecordingModeBlock _Nonnull)makeURLWithMode{
    @jobs_weakify(self)
    return ^NSURL *(JobsOCAudioRecordingMode mode){
        @jobs_strongify(self)
        if (!self) return nil;
        NSDateFormatter *formatter = jobsMakeDateFormatter(^(NSDateFormatter *object){});
        formatter.byDateFormat(@"yyyyMMdd_HHmmss_SSS");
        NSString *name = [NSString stringWithFormat:@"%@_%@.m4a",mode == JobsOCAudioRecordingModeLong ? @"long" : @"short",NSUUID.UUID.UUIDString];
        return [self.directoryURL URLByAppendingPathComponent:name];
    };
}

-(JobsRetNSArrayJobsOCAudioRecordingByVoidBlock _Nonnull)recordings{
    @jobs_weakify(self)
    return ^NSArray<JobsOCAudioRecording *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSArray<NSURL *> *urls = [NSFileManager.defaultManager contentsOfDirectoryAtURL:self.directoryURL includingPropertiesForKeys:@[NSURLCreationDateKey,NSURLFileSizeKey] options:NSDirectoryEnumerationSkipsHiddenFiles error:nil] ?: @[];
        NSMutableArray *items = NSMutableArray.array;
        for (NSURL *url in urls) {
            if (![url.pathExtension.lowercaseString isEqualToString:@"m4a"]) continue;
            NSDictionary *values = [url resourceValuesForKeys:@[NSURLCreationDateKey,NSURLFileSizeKey] error:nil];
            AVAudioPlayer *player = [AVAudioPlayer.alloc initWithContentsOfURL:url error:nil];
            JobsOCAudioRecording *item = JobsOCAudioRecording.new
                .byUrl(url)
                .byMode([url.lastPathComponent hasPrefix:@"long_"] ? JobsOCAudioRecordingModeLong : JobsOCAudioRecordingModeShort)
                .byCreatedAt(values[NSURLCreationDateKey] ?: NSDate.distantPast)
                .byFileSize([values[NSURLFileSizeKey] longLongValue])
                .byDuration(player.duration);
            [items addObject:item];
        }
        [items sortUsingComparator:^NSComparisonResult(JobsOCAudioRecording *a, JobsOCAudioRecording *b) { return [b.createdAt compare:a.createdAt]; }];return items;
    };
}

-(BOOL)deleteRecording:(JobsOCAudioRecording *)recording error:(NSError **)error{
    return [NSFileManager.defaultManager removeItemAtURL:recording.url error:error];
}
@end

@interface JobsOCAudioRecorderEngine ()<AVAudioRecorderDelegate>
@property(nonatomic,strong)AVAudioRecorder *recorder;
@property(nonatomic,strong)NSURL *currentURL;
@property(nonatomic,assign,readwrite)JobsOCAudioRecordingMode mode;
@property(nonatomic,assign)BOOL keepFile;
@property(nonatomic,assign)BOOL stopping;
-(BOOL)activateRecordingSession:(AVAudioSession **)session error:(NSError **)error;
-(nullable AVAudioRecorder *)recorderWithURL:(NSURL *)URL settings:(NSDictionary *)settings error:(NSError **)error;
-(JobsRetNSURLByJobsOCAudioRecordingModeBlock _Nonnull)recordingURLForMode;
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCAudioRecorderEngine
@interface JobsOCAudioRecorderEngine (JobsPropertyDSLSetterAutogen_58336575c7)
-(void)setCurrentURL:(NSURL * _Nullable)data;
-(void)setKeepFile:(BOOL)data;
-(void)setMode:(JobsOCAudioRecordingMode)data;
-(void)setRecorder:(AVAudioRecorder * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCAudioRecorderEngine

@implementation JobsOCAudioRecorderEngine
-(instancetype)init{
    if (self = [super init]) {
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(recordingInterrupted:)
                                                  name:AVAudioSessionInterruptionNotification object:nil];
    }
    return self;
}

-(void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    _recorder.delegate = nil;
    [_recorder stop];
}

-(void)recordingInterrupted:(NSNotification *)notification{
    if ([notification.userInfo[AVAudioSessionInterruptionTypeKey] unsignedIntegerValue] != AVAudioSessionInterruptionTypeBegan) return;
    @synchronized (self) {
        AVAudioRecorder *recorder = self.recorder;
        if (!recorder) return;
        recorder.byDelegate(nil);
        [recorder stop];
        NSError *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:5
                                         userInfo:@{NSLocalizedDescriptionKey:@"音频会话中断，当前录音已取消"}];
        [self finishRecorder:recorder successfully:NO error:error];
    }
}

+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static JobsOCAudioRecorderEngine *engine;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{ engine = JobsOCAudioRecorderEngine.new; });return engine;
    };
}
-(BOOL)isRecording{
    @synchronized (self) {
        return self.recorder.isRecording;
    }
}
-(NSTimeInterval)currentTime{
    @synchronized (self) {
        return self.recorder.currentTime;
    }
}
-(jobsByvoidBOOLBlock _Nonnull)requestPermission{
    @jobs_weakify(self)
    return ^(void (^completion)(BOOL)){
        @jobs_strongify(self)
        if (!self) return;
        [AVAudioSession.sharedInstance requestRecordPermission:^(BOOL granted) { dispatch_async(dispatch_get_main_queue(), ^{ if (completion) completion(granted); }); }];
    };
}
-(BOOL)startWithMode:(JobsOCAudioRecordingMode)mode maximumDuration:(NSTimeInterval)duration error:(NSError **)error{
    @synchronized (self) {
        if (error) *error = nil;
        if (self.recorder || self.stopping) {
            if (error) *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:1
                                               userInfo:@{NSLocalizedDescriptionKey:@"已有录音正在进行或收尾"}];
            return NO;
        }
        AVAudioSession *session = nil;
        if (![self activateRecordingSession:&session error:error]) {
            return NO;
        }
        NSURL *url = self.recordingURLForMode(mode);
        NSDictionary *settings = @{AVFormatIDKey:@(kAudioFormatMPEG4AAC), AVSampleRateKey:@44100,
                                   AVNumberOfChannelsKey:@1, AVEncoderAudioQualityKey:@(AVAudioQualityHigh)};
        AVAudioRecorder *recorder = url ? [self recorderWithURL:url settings:settings error:error] : nil;
        if (recorder) recorder.byDelegate(self);
        BOOL prepared = recorder && [recorder prepareToRecord];
        BOOL started = prepared && (duration > 0 && isfinite(duration) ? [recorder recordForDuration:duration] : [recorder record]);
        if (!started) {
            if (recorder) {
                recorder.byDelegate(nil);
                [recorder stop];
            }
            if (url) [NSFileManager.defaultManager removeItemAtURL:url error:nil];
            [session setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
            if (error && !*error) *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:4
                                                         userInfo:@{NSLocalizedDescriptionKey:@"录音设备未能启动"}];
            return NO;
        }
        self.byMode(mode)
            .byKeepFile(YES)
            .byCurrentURL(url)
            .byRecorder(recorder);
        dispatch_async(dispatch_get_main_queue(), ^{
            @synchronized (self) {
                if (self.recorder != recorder || self.stopping) return;
            }
            if ([self.delegate respondsToSelector:@selector(audioRecorderEngineDidStart:)]) {
                [self.delegate audioRecorderEngineDidStart:self];
            }
        });
        return YES;
    }
}

-(BOOL)activateRecordingSession:(AVAudioSession **)activatedSession error:(NSError **)error{
    AVAudioSession *session = AVAudioSession.sharedInstance;
    if (session.recordPermission != AVAudioSessionRecordPermissionGranted) {
        if (error) *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:3
                                           userInfo:@{NSLocalizedDescriptionKey:@"请先申请并取得麦克风权限"}];
        return NO;
    }
    if (![session setCategory:AVAudioSessionCategoryPlayAndRecord mode:AVAudioSessionModeDefault
                      options:AVAudioSessionCategoryOptionDefaultToSpeaker | AVAudioSessionCategoryOptionAllowBluetooth error:error] ||
        ![session setActive:YES error:error]) {
        return NO;
    }
    if (activatedSession) *activatedSession = session;
    return YES;
}

-(AVAudioRecorder *)recorderWithURL:(NSURL *)URL settings:(NSDictionary *)settings error:(NSError **)error{
    return [AVAudioRecorder.alloc initWithURL:URL settings:settings error:error];
}

-(JobsRetNSURLByJobsOCAudioRecordingModeBlock _Nonnull)recordingURLForMode{
    return ^NSURL *(JobsOCAudioRecordingMode mode) {
        return ((JobsOCAudioRecordingStore *)JobsOCAudioRecordingStore.shared()).makeURLWithMode(mode);
    };
}
-(jobsByVoidBlock _Nonnull)stopAndSave{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
            if (!self.recorder || self.stopping) return;
            self.stopping = YES;
            self.byKeepFile(YES);
            [self.recorder stop];
        }
    };
}
-(void)cancel{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecorderEngine.class, @selector(jobsCancel)))(self, @selector(jobsCancel));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsCancel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
            if (!self.recorder || self.stopping) return;
            self.stopping = YES;
            self.byKeepFile(NO);
            [self.recorder stop];
        }
    };
}
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    [self finishRecorder:recorder successfully:flag error:nil];
}

-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error{
    [self finishRecorder:recorder successfully:NO error:error];
}

-(void)finishRecorder:(AVAudioRecorder *)recorder successfully:(BOOL)flag error:(NSError *)encodingError{
    @synchronized (self) {
        if (!recorder || self.recorder != recorder) return;
        NSURL *url = self.currentURL;
        BOOL keep = self.keepFile && flag && !encodingError;
        recorder.byDelegate(nil);
        if (!keep && url) [NSFileManager.defaultManager removeItemAtURL:url error:nil];
        self.byRecorder(nil).byCurrentURL(nil);
        self.stopping = NO;
        [AVAudioSession.sharedInstance setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
        NSError *failure = encodingError ?: (flag ? nil : [NSError errorWithDomain:@"JobsOCAudioRecorder" code:2
                                                                         userInfo:@{NSLocalizedDescriptionKey:@"录音未正常完成"}]);
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(audioRecorderEngine:didFinishAtURL:error:)]) {
                [self.delegate audioRecorderEngine:self didFinishAtURL:keep ? url : nil error:failure];
            }
        });
    }
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCAudioRecorderEngine
-(JobsRetJobsOCAudioRecorderEngineByAVAudioRecorderBlock _Nonnull)byRecorder{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecorderEngine * _Nullable(AVAudioRecorder * _Nullable data){
        @jobs_strongify(self)
        [self setRecorder:data];
        return self;
    };
}

-(JobsRetJobsOCAudioRecorderEngineByBOOLBlock _Nonnull)byKeepFile{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecorderEngine * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setKeepFile:data];
        return self;
    };
}

-(JobsRetJobsOCAudioRecorderEngineByJobsOCAudioRecordingModeBlock _Nonnull)byMode{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecorderEngine * _Nullable(JobsOCAudioRecordingMode data){
        @jobs_strongify(self)
        [self setMode:data];
        return self;
    };
}

-(JobsRetJobsOCAudioRecorderEngineByNSURLBlock _Nonnull)byCurrentURL{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecorderEngine * _Nullable(NSURL * _Nullable data){
        @jobs_strongify(self)
        [self setCurrentURL:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCAudioRecorderEngine
@end

@interface JobsOCAudioPlayerEngine ()<AVAudioPlayerDelegate>
@property(nonatomic,strong)AVAudioPlayer *player;
@property(nonatomic,strong,readwrite)NSURL *playingURL;
-(JobsRetIDByIDBlock _Nonnull)byPlayer;
-(BOOL)activatePlaybackSession:(AVAudioSession **)session error:(NSError **)error;
-(nullable AVAudioPlayer *)playerWithURL:(NSURL *)URL error:(NSError **)error;
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCAudioPlayerEngine
@interface JobsOCAudioPlayerEngine (JobsPropertyDSLSetterAutogen_58336575c7)
-(void)setPlayingURL:(NSURL * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCAudioPlayerEngine

@implementation JobsOCAudioPlayerEngine
+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static JobsOCAudioPlayerEngine *engine;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{ engine = JobsOCAudioPlayerEngine.new; });return engine;
    };
}
-(JobsRetIDByIDBlock _Nonnull)byPlayer{
    @jobs_weakify(self)
    return ^id(AVAudioPlayer *player){
        @jobs_strongify(self)
        self.player = player;
        return self;
    };
}
-(BOOL)toggleURL:(NSURL *)url error:(NSError **)error{
    if (((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).currentURL) {
        if (error) *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:6
                                           userInfo:@{NSLocalizedDescriptionKey:@"录音或收尾期间不能切换播放会话"}];
        return NO;
    }
    if ([self.playingURL isEqual:url] && self.player.isPlaying) {self.jobsStop();return NO;}
    if (error) *error = nil;
    AVAudioSession *session = nil;
    if (![self activatePlaybackSession:&session error:error]) return NO;
    AVAudioPlayer *player = [self playerWithURL:url error:error];
    if (player) player.byDelegate(self);
    BOOL playing = player && [player play];
    if (!playing) {
        if (player) {
            player.byDelegate(nil);
            [player stop];
        }
        [self.player stop];
        self.byPlayer(nil);
        self.byPlayingURL(nil);
        [session setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
        if (error && !*error) *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:7
                                                     userInfo:@{NSLocalizedDescriptionKey:@"音频文件不能播放"}];
        return NO;
    }
    [self.player stop];
    self.byPlayer(player);
    self.byPlayingURL(url);
    return playing;
}

-(BOOL)activatePlaybackSession:(AVAudioSession **)activatedSession error:(NSError **)error{
    AVAudioSession *session = AVAudioSession.sharedInstance;
    if (![session setCategory:AVAudioSessionCategoryPlayback error:error] ||
        ![session setActive:YES error:error]) return NO;
    if (activatedSession) *activatedSession = session;
    return YES;
}

-(AVAudioPlayer *)playerWithURL:(NSURL *)URL error:(NSError **)error{
    return [AVAudioPlayer.alloc initWithContentsOfURL:URL error:error];
}
-(jobsByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    self.player.stop;self.player = nil;self.playingURL = nil;[AVAudioSession.sharedInstance setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    };
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (!player || self.player != player) return;
    self.jobsStop();
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCAudioPlayerEngine
-(JobsRetJobsOCAudioPlayerEngineByNSURLBlock _Nonnull)byPlayingURL{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioPlayerEngine * _Nullable(NSURL * _Nullable data){
        @jobs_strongify(self)
        [self setPlayingURL:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCAudioPlayerEngine
@end

@interface JobsOCAudioRecordButton ()
@property(nonatomic,strong)CAShapeLayer *trackLayer;
@property(nonatomic,strong)CAShapeLayer *progressLayer;
@property(nonatomic,strong)CAShapeLayer *innerLayer;
@property(nonatomic,strong)JobsTimer *timer;
@property(nonatomic,assign)BOOL active;
@property(nonatomic,assign)CFTimeInterval recordingStartedAt;
-(JobsRetIDByIDBlock _Nonnull)byBackgroundColor;
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCAudioRecordButton
@interface JobsOCAudioRecordButton (JobsPropertyDSLSetterAutogen_58336575c7)
-(void)setAccessibilityLabel:(NSString * _Nullable)data;
-(void)setActive:(BOOL)data;
-(void)setRecordingStartedAt:(CFTimeInterval)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCAudioRecordButton

@implementation JobsOCAudioRecordButton

-(JobsRetJobsOCAudioRecordButtonByTimeIntervalBlock _Nonnull)byDuration{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecordButton *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}

-(JobsRetJobsOCAudioRecordButtonByTimeIntervalBlock _Nonnull)byMinimumValidDuration{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecordButton *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.minimumValidDuration = data;
        return self;
    };
}

-(JobsRetJobsOCAudioRecordButtonByRetBOOLByVoidBlock _Nonnull)byAudioOnBegin{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecordButton *_Nullable(JobsRetBOOLByVoidBlock _Nullable data){
        @jobs_strongify(self)
        self.onBegin = data;
        return self;
    };
}

#define JOBS_AUDIO_RECORD_BUTTON_VOID_BLOCK_DSL(_selector_, _property_) \
-(JobsRetJobsOCAudioRecordButtonByVoidBlockBlock _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCAudioRecordButton *_Nullable(jobsByVoidBlock _Nullable data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_AUDIO_RECORD_BUTTON_VOID_BLOCK_DSL(byAudioOnFinish, onFinish)
JOBS_AUDIO_RECORD_BUTTON_VOID_BLOCK_DSL(byAudioOnCancel, onCancel)
JOBS_AUDIO_RECORD_BUTTON_VOID_BLOCK_DSL(byAudioOnTooShort, onTooShort)

#undef JOBS_AUDIO_RECORD_BUTTON_VOID_BLOCK_DSL

-(JobsRetIDByIDBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^id(UIColor *color){
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}
+(instancetype)button{return [self buttonWithType:UIButtonTypeCustom];}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _duration = 60;
        _minimumValidDuration = 3;
        self.byBackgroundColor(UIColor.clearColor);
        self.accessibilityLabel = @"按住录音";
        _trackLayer = CAShapeLayer.layer
            .byFillColor(UIColor.clearColor.CGColor)
            .byStrokeColor(UIColor.whiteColor.CGColor)
            .byLineWidth(4);
        _progressLayer = CAShapeLayer.layer
            .byFillColor(UIColor.clearColor.CGColor)
            .byStrokeColor(UIColor.systemRedColor.CGColor)
            .byLineWidth(4)
            .byLineCap(kCALineCapRound);
        _innerLayer = CAShapeLayer.layer
            .byFillColor(UIColor.whiteColor.CGColor);
        [self.layer insertSublayer:_innerLayer atIndex:0];
        [self.layer addSublayer:_trackLayer];[self.layer addSublayer:_progressLayer];
        [self addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(touchUp) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(touchCancel) forControlEvents:UIControlEventTouchDragExit | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
    };return self;
}
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecordButton.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        CGPathRef path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds,4,4)].CGPath;
        self.trackLayer.byPath(self.progressLayer.path = path);
        self.innerLayer.byPath([UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds,14,14)].CGPath);
    };
}
-(void)touchDown{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecordButton.class, @selector(jobsTouchDown)))(self, @selector(jobsTouchDown));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTouchDown{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.onBegin && !self.onBegin()) return;
        self.byActive(YES);
        self.byRecordingStartedAt(CACurrentMediaTime());
        self.byAccessibilityLabel(@"松开保存");
        [UIView animateWithDuration:0.15 animations:^{self.transform = CGAffineTransformMakeScale(1.08,1.08);}];
        @jobs_weakify(self)
        self.timer = jobsMakeTimer(^(__kindof JobsTimer *timer) {
            @jobs_strongify(self)
            if (!self) return;
            NSTimeInterval duration = self.duration;
            @jobs_weakify(self)
            timer.byTimerType(JobsTimerTypeDisplayLink).byTimerStyle(TimerStyle_anticlockwise).byStartTime(MAX(1,duration)).byTimeInterval(1.0/60.0).byOnTick(^(CGFloat time) {
                @jobs_strongify(self)
                if (!self) return;
                self.progressLayer.byStrokeEnd(1 - time / MAX(1,self.duration));
            }).byOnFinish(^(JobsTimer *timer) {
                @jobs_strongify(self)
                if (!self) return;
                self.finishAutomatically();
            });
        });
        self.timer.start();
    };
}
-(void)touchUp{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecordButton.class, @selector(jobsTouchUp)))(self, @selector(jobsTouchUp));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTouchUp{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.finishWithRecordedDuration(MAX(0,CACurrentMediaTime() - self.recordingStartedAt));
    };
}
-(void)touchCancel{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecordButton.class, @selector(jobsTouchCancel)))(self, @selector(jobsTouchCancel));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTouchCancel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.active) return;self.active = NO;self.resetVisuals();if (self.onCancel) self.onCancel();
    };
}
-(jobsByVoidBlock _Nonnull)finishAutomatically{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    self.finishWithRecordedDuration(MAX(0,self.duration));
    };
}
-(jobsByTimeIntervalBlock _Nonnull)finishWithRecordedDuration{
    @jobs_weakify(self)
    return ^(NSTimeInterval recordedDuration){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.active) return;
        BOOL tooShort = recordedDuration < MAX(0,self.minimumValidDuration);
        self.byActive(NO);
        self.resetVisuals();
        if (tooShort) {
            if (self.onCancel) self.onCancel();
            if (self.onTooShort) self.onTooShort();
        } else if (self.onFinish) self.onFinish();
    };
}
-(jobsByVoidBlock _Nonnull)resetVisuals{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    if (self.timer) self.timer.jobsStop();self.timer = nil;self.recordingStartedAt = 0;self.progressLayer.strokeEnd = 0;self.accessibilityLabel = @"按住录音";[UIView animateWithDuration:0.24 animations:^{self.transform = CGAffineTransformIdentity;}];
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCAudioRecordButton
-(JobsRetJobsOCAudioRecordButtonByBOOLBlock _Nonnull)byActive{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecordButton * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setActive:data];
        return self;
    };
}

-(JobsRetJobsOCAudioRecordButtonByCFTimeIntervalBlock _Nonnull)byRecordingStartedAt{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecordButton * _Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setRecordingStartedAt:data];
        return self;
    };
}
-(JobsRetJobsOCAudioRecordButtonByNSStringBlock _Nonnull)byAccessibilityLabel{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecordButton * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityLabel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCAudioRecordButton
@end
