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
        NSString *name = [NSString stringWithFormat:@"%@_%@.m4a",mode == JobsOCAudioRecordingModeLong ? @"long" : @"short",[formatter stringFromDate:NSDate.date]];
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
+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static JobsOCAudioRecorderEngine *engine;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{ engine = JobsOCAudioRecorderEngine.new; });return engine;
    };
}
-(BOOL)isRecording{return self.recorder.isRecording;}
-(NSTimeInterval)currentTime{return self.recorder.currentTime;}
-(jobsByvoidBOOLBlock _Nonnull)requestPermission{
    @jobs_weakify(self)
    return ^(void (^completion)(BOOL)){
        @jobs_strongify(self)
        if (!self) return;
        [AVAudioSession.sharedInstance requestRecordPermission:^(BOOL granted) { dispatch_async(dispatch_get_main_queue(), ^{ if (completion) completion(granted); }); }];
    };
}
-(BOOL)startWithMode:(JobsOCAudioRecordingMode)mode maximumDuration:(NSTimeInterval)duration error:(NSError **)error{
    if (self.isRecording) {
        if (error) *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:1 userInfo:@{NSLocalizedDescriptionKey:@"已有录音正在进行"}];
        return NO;
    }
    AVAudioSession *session = AVAudioSession.sharedInstance;
    if (![session setCategory:AVAudioSessionCategoryPlayAndRecord mode:AVAudioSessionModeDefault options:AVAudioSessionCategoryOptionDefaultToSpeaker | AVAudioSessionCategoryOptionAllowBluetooth error:error]) return NO;
    if (![session setActive:YES error:error]) return NO;
    NSURL *url = (((JobsOCAudioRecordingStore *)JobsOCAudioRecordingStore.shared())).makeURLWithMode(mode);
    NSDictionary *settings = @{AVFormatIDKey:@(kAudioFormatMPEG4AAC),AVSampleRateKey:@44100,AVNumberOfChannelsKey:@1,AVEncoderAudioQualityKey:@(AVAudioQualityHigh)};
    AVAudioRecorder *recorder = [AVAudioRecorder.alloc initWithURL:url settings:settings error:error];
    if (!recorder || ![recorder prepareToRecord]) return NO;
    self.byMode(mode);
    self.byKeepFile(YES);
    self.byCurrentURL(url);
    self.byRecorder(recorder);
    recorder.byDelegate(self);
    duration > 0 ? [recorder recordForDuration:duration] : [recorder record];
    if ([self.delegate respondsToSelector:@selector(audioRecorderEngineDidStart:)]) [self.delegate audioRecorderEngineDidStart:self];
    return YES;
}
-(jobsByVoidBlock _Nonnull)stopAndSave{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byKeepFile(YES);
        self.recorder.stop;
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
        self.byKeepFile(NO);
        self.recorder.stop;
    };
}
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    NSURL *url = self.currentURL;
    if (!self.keepFile || !flag) [NSFileManager.defaultManager removeItemAtURL:url error:nil];
    self.byRecorder(nil);
    self.byCurrentURL(nil);
    [AVAudioSession.sharedInstance setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    NSError *error = flag ? nil : [NSError errorWithDomain:@"JobsOCAudioRecorder" code:2 userInfo:@{NSLocalizedDescriptionKey:@"录音未正常完成"}];
    if ([self.delegate respondsToSelector:@selector(audioRecorderEngine:didFinishAtURL:error:)]) [self.delegate audioRecorderEngine:self didFinishAtURL:self.keepFile && flag ? url : nil error:error];
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
    if ([self.playingURL isEqual:url] && self.player.isPlaying) {self.jobsStop();return NO;}
    [AVAudioSession.sharedInstance setCategory:AVAudioSessionCategoryPlayback error:error];
    if (![AVAudioSession.sharedInstance setActive:YES error:error]) return NO;
    self.byPlayer([AVAudioPlayer.alloc initWithContentsOfURL:url error:error]);
    self.player.byDelegate(self);
    self.byPlayingURL(url);
    return [self.player play];
}
-(jobsByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    self.player.stop;self.player = nil;self.playingURL = nil;[AVAudioSession.sharedInstance setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    };
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{(((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioPlayerEngine.class, @selector(jobsStop)))(self, @selector(jobsStop)))();}
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
