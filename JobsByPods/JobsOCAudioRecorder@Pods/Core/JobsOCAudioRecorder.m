//
//  JobsOCAudioRecorder.m
//  JobsOCAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import "JobsOCAudioRecorder.h"
#import <JobsOCTimer/JobsTimer.h>

@implementation JobsOCAudioRecording
@end

@interface JobsOCAudioRecordingStore ()
@property(nonatomic,strong,readwrite)NSURL *directoryURL;
@end

@implementation JobsOCAudioRecordingStore

+(instancetype)shared{
    static JobsOCAudioRecordingStore *store;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ store = JobsOCAudioRecordingStore.new; });return store;
}

-(instancetype)init{
    if (self = [super init]) {
        NSURL *root = [NSFileManager.defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask].firstObject;
        _directoryURL = [root URLByAppendingPathComponent:@"JobsAudioRecordings" isDirectory:YES];
        [NSFileManager.defaultManager createDirectoryAtURL:_directoryURL withIntermediateDirectories:YES attributes:nil error:nil];
    };return self;
}

-(NSURL *)makeURLWithMode:(JobsOCAudioRecordingMode)mode{
    NSDateFormatter *formatter = NSDateFormatter.new;
    formatter.dateFormat = @"yyyyMMdd_HHmmss_SSS";
    NSString *name = [NSString stringWithFormat:@"%@_%@.m4a",mode == JobsOCAudioRecordingModeLong ? @"long" : @"short",[formatter stringFromDate:NSDate.date]];
    return [self.directoryURL URLByAppendingPathComponent:name];
}

-(NSArray<JobsOCAudioRecording *> *)recordings{
    NSArray<NSURL *> *urls = [NSFileManager.defaultManager contentsOfDirectoryAtURL:self.directoryURL includingPropertiesForKeys:@[NSURLCreationDateKey,NSURLFileSizeKey] options:NSDirectoryEnumerationSkipsHiddenFiles error:nil] ?: @[];
    NSMutableArray *items = NSMutableArray.array;
    for (NSURL *url in urls) {
        if (![url.pathExtension.lowercaseString isEqualToString:@"m4a"]) continue;
        NSDictionary *values = [url resourceValuesForKeys:@[NSURLCreationDateKey,NSURLFileSizeKey] error:nil];
        AVAudioPlayer *player = [AVAudioPlayer.alloc initWithContentsOfURL:url error:nil];
        JobsOCAudioRecording *item = JobsOCAudioRecording.new;
        item.url = url;
        item.mode = [url.lastPathComponent hasPrefix:@"long_"] ? JobsOCAudioRecordingModeLong : JobsOCAudioRecordingModeShort;
        item.createdAt = values[NSURLCreationDateKey] ?: NSDate.distantPast;
        item.fileSize = [values[NSURLFileSizeKey] longLongValue];
        item.duration = player.duration;
        [items addObject:item];
    }
    [items sortUsingComparator:^NSComparisonResult(JobsOCAudioRecording *a, JobsOCAudioRecording *b) { return [b.createdAt compare:a.createdAt]; }];return items;
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

@implementation JobsOCAudioRecorderEngine
+(instancetype)shared{
    static JobsOCAudioRecorderEngine *engine;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ engine = JobsOCAudioRecorderEngine.new; });return engine;
}
-(BOOL)isRecording{return self.recorder.isRecording;}
-(NSTimeInterval)currentTime{return self.recorder.currentTime;}
-(void)requestPermission:(void (^)(BOOL))completion{
    [AVAudioSession.sharedInstance requestRecordPermission:^(BOOL granted) { dispatch_async(dispatch_get_main_queue(), ^{ if (completion) completion(granted); }); }];
}
-(BOOL)startWithMode:(JobsOCAudioRecordingMode)mode maximumDuration:(NSTimeInterval)duration error:(NSError **)error{
    if (self.isRecording) {
        if (error) *error = [NSError errorWithDomain:@"JobsOCAudioRecorder" code:1 userInfo:@{NSLocalizedDescriptionKey:@"已有录音正在进行"}];
        return NO;
    }
    AVAudioSession *session = AVAudioSession.sharedInstance;
    if (![session setCategory:AVAudioSessionCategoryPlayAndRecord mode:AVAudioSessionModeDefault options:AVAudioSessionCategoryOptionDefaultToSpeaker | AVAudioSessionCategoryOptionAllowBluetooth error:error]) return NO;
    if (![session setActive:YES error:error]) return NO;
    NSURL *url = [JobsOCAudioRecordingStore.shared makeURLWithMode:mode];
    NSDictionary *settings = @{AVFormatIDKey:@(kAudioFormatMPEG4AAC),AVSampleRateKey:@44100,AVNumberOfChannelsKey:@1,AVEncoderAudioQualityKey:@(AVAudioQualityHigh)};
    AVAudioRecorder *recorder = [AVAudioRecorder.alloc initWithURL:url settings:settings error:error];
    if (!recorder || ![recorder prepareToRecord]) return NO;
    self.mode = mode;
    self.keepFile = YES;
    self.currentURL = url;
    self.recorder = recorder;
    recorder.delegate = self;
    duration > 0 ? [recorder recordForDuration:duration] : [recorder record];
    if ([self.delegate respondsToSelector:@selector(audioRecorderEngineDidStart:)]) [self.delegate audioRecorderEngineDidStart:self];
    return YES;
}
-(void)stopAndSave{self.keepFile = YES;[self.recorder stop];}
-(void)cancel{self.keepFile = NO;[self.recorder stop];}
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    NSURL *url = self.currentURL;
    if (!self.keepFile || !flag) [NSFileManager.defaultManager removeItemAtURL:url error:nil];
    self.recorder = nil;
    self.currentURL = nil;
    [AVAudioSession.sharedInstance setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
    NSError *error = flag ? nil : [NSError errorWithDomain:@"JobsOCAudioRecorder" code:2 userInfo:@{NSLocalizedDescriptionKey:@"录音未正常完成"}];
    if ([self.delegate respondsToSelector:@selector(audioRecorderEngine:didFinishAtURL:error:)]) [self.delegate audioRecorderEngine:self didFinishAtURL:self.keepFile && flag ? url : nil error:error];
}
@end

@interface JobsOCAudioPlayerEngine ()<AVAudioPlayerDelegate>
@property(nonatomic,strong)AVAudioPlayer *player;
@property(nonatomic,strong,readwrite)NSURL *playingURL;
@end

@implementation JobsOCAudioPlayerEngine
+(instancetype)shared{
    static JobsOCAudioPlayerEngine *engine;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ engine = JobsOCAudioPlayerEngine.new; });return engine;
}
-(BOOL)toggleURL:(NSURL *)url error:(NSError **)error{
    if ([self.playingURL isEqual:url] && self.player.isPlaying) {[self stop];return NO;}
    [AVAudioSession.sharedInstance setCategory:AVAudioSessionCategoryPlayback error:error];
    if (![AVAudioSession.sharedInstance setActive:YES error:error]) return NO;
    self.player = [AVAudioPlayer.alloc initWithContentsOfURL:url error:error];
    self.player.delegate = self;
    self.playingURL = url;
    return [self.player play];
}
-(void)stop{[self.player stop];self.player = nil;self.playingURL = nil;[AVAudioSession.sharedInstance setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{[self stop];}
@end

@interface JobsOCAudioRecordButton ()
@property(nonatomic,strong)CAShapeLayer *trackLayer;
@property(nonatomic,strong)CAShapeLayer *progressLayer;
@property(nonatomic,strong)CAShapeLayer *innerLayer;
@property(nonatomic,strong)JobsTimer *timer;
@property(nonatomic,assign)BOOL active;
@property(nonatomic,assign)CFTimeInterval recordingStartedAt;
@end

@implementation JobsOCAudioRecordButton
+(instancetype)button{return [self buttonWithType:UIButtonTypeCustom];}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _duration = 60;
        _minimumValidDuration = 3;
        self.backgroundColor = UIColor.clearColor;
        self.tintColor = UIColor.whiteColor;
        [self setImage:[UIImage systemImageNamed:@"mic.fill"] forState:UIControlStateNormal];
        self.accessibilityLabel = @"按住录音";
        _trackLayer = CAShapeLayer.layer;
        _progressLayer = CAShapeLayer.layer;
        _innerLayer = CAShapeLayer.layer;
        _trackLayer.fillColor = _progressLayer.fillColor = UIColor.clearColor.CGColor;
        _trackLayer.strokeColor = UIColor.systemGray4Color.CGColor;
        _progressLayer.strokeColor = UIColor.systemRedColor.CGColor;
        _trackLayer.lineWidth = _progressLayer.lineWidth = 6;
        _progressLayer.lineCap = kCALineCapRound;
        _innerLayer.fillColor = UIColor.systemBlueColor.CGColor;
        [self.layer insertSublayer:_innerLayer atIndex:0];
        [self.layer addSublayer:_trackLayer];[self.layer addSublayer:_progressLayer];
        [self addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(touchUp) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(touchCancel) forControlEvents:UIControlEventTouchDragExit | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
    };return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGPathRef path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds,4,4)].CGPath;
    self.trackLayer.path = self.progressLayer.path = path;
    self.innerLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds,13,13)].CGPath;
}
-(void)touchDown{
    if (self.onBegin && !self.onBegin()) return;
    self.active = YES;
    self.recordingStartedAt = CACurrentMediaTime();
    self.accessibilityLabel = @"松开保存";
    self.innerLayer.fillColor = UIColor.systemRedColor.CGColor;
    [UIView animateWithDuration:0.15 animations:^{self.transform = CGAffineTransformMakeScale(1.08,1.08);}];
    __weak typeof(self) weakSelf = self;
    self.timer = jobsMakeTimer(^(__kindof JobsTimer *timer) {
        timer.byTimerType(JobsTimerTypeDisplayLink).byTimerStyle(TimerStyle_anticlockwise).byStartTime(MAX(1,weakSelf.duration)).byTimeInterval(1.0/60.0).byOnTick(^(CGFloat time) {
            weakSelf.progressLayer.strokeEnd = 1 - time / MAX(1,weakSelf.duration);
        }).byOnFinish(^(JobsTimer *timer) {[weakSelf finishAutomatically];});
    });
    [self.timer start];
}
-(void)touchUp{[self finishWithRecordedDuration:MAX(0,CACurrentMediaTime() - self.recordingStartedAt)];}
-(void)touchCancel{if (!self.active) return;self.active = NO;[self resetVisuals];if (self.onCancel) self.onCancel();}
-(void)finishAutomatically{[self finishWithRecordedDuration:MAX(0,self.duration)];}
-(void)finishWithRecordedDuration:(NSTimeInterval)recordedDuration{
    if (!self.active) return;
    BOOL tooShort = recordedDuration < MAX(0,self.minimumValidDuration);
    self.active = NO;
    [self resetVisuals];
    if (tooShort) {
        if (self.onCancel) self.onCancel();
        if (self.onTooShort) self.onTooShort();
    } else if (self.onFinish) self.onFinish();
}
-(void)resetVisuals{[self.timer stop];self.timer = nil;self.recordingStartedAt = 0;self.progressLayer.strokeEnd = 0;self.accessibilityLabel = @"按住录音";self.innerLayer.fillColor = UIColor.systemBlueColor.CGColor;[UIView animateWithDuration:0.24 animations:^{self.transform = CGAffineTransformIdentity;}];}
@end
