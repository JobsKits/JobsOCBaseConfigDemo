//
//  JobsOCVideoRecorderVC.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderVC.h"

@interface JobsOCVideoRecorderVC ()<
JobsOCVideoRecorderCaptureManagerDelegate,
JobsOCVideoRecorderRecordButtonDelegate
>{
    CMFormatDescriptionRef _latestVideoFormatDescription;
    CMFormatDescriptionRef _latestAudioFormatDescription;
}

Prop_strong() JobsOCVideoRecorderConfig *config;
Prop_strong() JobsOCVideoRecorderCaptureManager *captureManager;
Prop_strong(nullable) JobsOCVideoRecorderAssetWriter *assetWriter;
Prop_strong() UIButton *backBtn;
Prop_strong() UILabel *titleLabel;
Prop_strong() UIButton *switchCameraBtn;
Prop_strong() UIButton *filterBtn;
Prop_strong() JobsOCVideoRecorderRecordButton *recordBtn;
Prop_strong() UILabel *recordDurationLabel;
Prop_strong(nullable) JobsOCVideoRecorderPreviewView *previewView;
Prop_strong(nullable) id<JobsOCVideoRecorderFilterProtocol> originFilterProcessor;
Prop_strong() JobsOCVideoRecorderCIFilterProcessor *builtInFilterProcessor;
Prop_strong(nullable) JobsOCVideoRecorderResult *currentResult;
Prop_strong(nullable) NSURL *currentOutputURL;
Prop_strong(nullable) NSTimer *recordTimer;
Prop_strong(nullable) NSDate *recordStartDate;
Prop_assign() UIDeviceOrientation recordingOrientation;
Prop_assign() BOOL permissionReady;
Prop_assign() BOOL recording;
Prop_assign() BOOL writerStarted;
Prop_assign() BOOL finishingRecord;
Prop_assign() BOOL captureSuspended;
Prop_assign() BOOL navigationStateCaptured;
Prop_assign() BOOL originNavigationBarHidden;
Prop_assign() BOOL originHidesBackButton;
Prop_assign() BOOL originSetupNavigationBarHidden;
Prop_assign() BOOL originGKNavigationBarHidden;
Prop_assign() CGFloat originGKNavigationBarAlpha;
Prop_assign() NSUInteger filterIndex;
Prop_weak(nullable) UIView *originGKNavigationBar;

-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byCaptureSuspended;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byPermissionReady;
-(JobsRetJobsOCVideoRecorderVCByNSUIntegerBlock _Nonnull)byFilterIndex;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byRecording;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byFinishingRecord;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byWriterStarted;
-(JobsRetJobsOCVideoRecorderVCByDateBlock _Nonnull)byRecordStartDate;
-(JobsRetJobsOCVideoRecorderVCByUIDeviceOrientationBlock _Nonnull)byRecordingOrientation;
-(JobsRetJobsOCVideoRecorderVCByURLBlock _Nonnull)byCurrentOutputURL;
-(JobsRetJobsOCVideoRecorderVCByJobsOCVideoRecorderAssetWriterBlock _Nonnull)byAssetWriter;
-(JobsRetJobsOCVideoRecorderVCByTimerBlock _Nonnull)byRecordTimer;
-(JobsRetJobsOCVideoRecorderVCByJobsOCVideoRecorderResultBlock _Nonnull)byCurrentResult;
-(JobsRetJobsOCVideoRecorderVCByJobsOCVideoRecorderPreviewViewBlock _Nonnull)byPreviewView;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byOriginNavigationBarHidden;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byOriginHidesBackButton;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byOriginSetupNavigationBarHidden;
-(JobsRetJobsOCVideoRecorderVCByViewBlock _Nonnull)byOriginGKNavigationBar;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byOriginGKNavigationBarHidden;
-(JobsRetJobsOCVideoRecorderVCByCGFloatBlock _Nonnull)byOriginGKNavigationBarAlpha;
-(JobsRetJobsOCVideoRecorderVCByBOOLBlock _Nonnull)byNavigationStateCaptured;

@end

@implementation JobsOCVideoRecorderVC
#define JobsOCVideoRecorderVCPropertyDSL(BLOCK_TYPE, ARG_TYPE, SELECTOR, PROPERTY) \
-(BLOCK_TYPE _Nonnull)SELECTOR{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCVideoRecorderVC *_Nullable(ARG_TYPE data){ \
        @jobs_strongify(self) \
        if (!self) return nil; \
        self.PROPERTY = data; \
        return self; \
    }; \
}

JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byCaptureSuspended, captureSuspended)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byPermissionReady, permissionReady)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByNSUIntegerBlock, NSUInteger, byFilterIndex, filterIndex)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byRecording, recording)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byFinishingRecord, finishingRecord)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byWriterStarted, writerStarted)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByDateBlock, NSDate *, byRecordStartDate, recordStartDate)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByUIDeviceOrientationBlock, UIDeviceOrientation, byRecordingOrientation, recordingOrientation)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByURLBlock, NSURL *, byCurrentOutputURL, currentOutputURL)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByJobsOCVideoRecorderAssetWriterBlock, JobsOCVideoRecorderAssetWriter *, byAssetWriter, assetWriter)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByTimerBlock, NSTimer *, byRecordTimer, recordTimer)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByJobsOCVideoRecorderResultBlock, JobsOCVideoRecorderResult *, byCurrentResult, currentResult)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByJobsOCVideoRecorderPreviewViewBlock, JobsOCVideoRecorderPreviewView *, byPreviewView, previewView)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byOriginNavigationBarHidden, originNavigationBarHidden)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byOriginHidesBackButton, originHidesBackButton)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byOriginSetupNavigationBarHidden, originSetupNavigationBarHidden)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByViewBlock, UIView *, byOriginGKNavigationBar, originGKNavigationBar)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byOriginGKNavigationBarHidden, originGKNavigationBarHidden)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByCGFloatBlock, CGFloat, byOriginGKNavigationBarAlpha, originGKNavigationBarAlpha)
JobsOCVideoRecorderVCPropertyDSL(JobsRetJobsOCVideoRecorderVCByBOOLBlock, BOOL, byNavigationStateCaptured, navigationStateCaptured)

#undef JobsOCVideoRecorderVCPropertyDSL

-(instancetype)init{
    return [self initWithConfig:JobsOCVideoRecorderConfig.defaultConfig()];
}

-(instancetype)initWithConfig:(JobsOCVideoRecorderConfig *)config{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _config = config ?: JobsOCVideoRecorderConfig.defaultConfig();
        _originFilterProcessor = _config.filterProcessor;
    };return self;
}

-(void)dealloc{
    JobsRemoveNotification(self);
    [self.recordTimer invalidate];
    [UIDevice.currentDevice endGeneratingDeviceOrientationNotifications];
    [self.captureManager stopRunning];
    [self.assetWriter cancelWriting];
    if (self.previewView) self.previewView.jobsStop();
    self.clearFormatDescriptions();
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            self.jobs_installApplicationStateObservers();
            [UIDevice.currentDevice beginGeneratingDeviceOrientationNotifications];
            self.view.byBgColor(JobsSystemBackgroundColor);
            [self.view.layer insertSublayer:self.captureManager.previewLayer atIndex:0];
            self.backBtn.byAlpha(1);
            self.titleLabel.byAlpha(1);
            if (self.canSwitchCamera()) self.switchCameraBtn.alpha = 1;
            self.filterBtn.byAlpha(1);
            self.recordBtn.byAlpha(1);
            self.recordDurationLabel.byAlpha(0);
        #if TARGET_OS_SIMULATOR
            if (self.filterBtn) self.filterBtn.byEnabled(NO);
            self.filterBtn.byAlpha(0.35);
            self.recordBtn.byUserInteractionEnabled(NO);
            self.recordBtn.byAlpha(0.35);
            @"iOS 模拟器不支持摄像头录制，请使用真机".jobsTr().toast();
        #else
            self.requestPermissions();
        #endif
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        self.captureManager.previewLayer.byFrame(self.view.bounds);
        self.captureManager.updatePreviewOrientation(UIDevice.currentDevice.orientation);
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        [self becomeFirstResponder];
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.byCaptureSuspended(NO);
        if (self.permissionReady) [self.captureManager startRunning];
        self.hideHostNavigationBarIfNeeded(animated);
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.restoreHostNavigationBarIfNeeded(animated);
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
        self.byCaptureSuspended(YES);
        [self.captureManager stopRunning];
        self.jobs_discardActiveRecording();
    };
}

-(BOOL)canBecomeFirstResponder{
    JobsRetBOOLByVoidBlock action = ((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsCanBecomeFirstResponder)))(self, @selector(jobsCanBecomeFirstResponder));
    return action ? action() : (BOOL){0};
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanBecomeFirstResponder{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return YES;
    };
}

-(void)motionEnded:(UIEventSubtype)motion
         withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake && self.previewView) {
        self.promptCancelCurrentVideoAndClosePage(NO);
    }
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    JobsRetUIInterfaceOrientationMaskByVoidBlock action = ((JobsRetUIInterfaceOrientationMaskByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsSupportedInterfaceOrientations)))(self, @selector(jobsSupportedInterfaceOrientations));
    return action ? action() : (UIInterfaceOrientationMask){0};
}

-(JobsRetUIInterfaceOrientationMaskByVoidBlock _Nonnull)jobsSupportedInterfaceOrientations{
    @jobs_weakify(self)
    return ^UIInterfaceOrientationMask{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientationMask){0};
        return UIInterfaceOrientationMaskAllButUpsideDown;
    };
}

-(jobsByVoidBlock _Nonnull)requestPermissions{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        [TKPermissionCamera authWithAlert:YES completion:^(BOOL cameraAuth) {
            @jobs_strongify(self)
            if (!cameraAuth) {
                @"相机权限未开启".jobsTr().toast();
                return;
            }
            [TKPermissionMicrophone authWithAlert:YES completion:^(BOOL microphoneAuth) {
                @jobs_strongify(self)
                if (!microphoneAuth) {
                    @"麦克风权限未开启".jobsTr().toast();
                    return;
                }
                [TKPermissionPhoto authWithAlert:YES level:TKPhotoAccessLevelReadWrite completion:^(BOOL photoAuth) {
                    @jobs_strongify(self)
                    if (!photoAuth) {
                        @"相册权限未开启".jobsTr().toast();
                        return;
                    }
                    self.byPermissionReady(YES);
                    [self.captureManager startRunning];
                }];
            }];
        }];
    };
}

-(void)backAction:(UIButton *)sender{
    jobsByBtnBlock action = ((jobsByBtnBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsBackAction)))(self, @selector(jobsBackAction));
    if (action) action(sender);
}

-(jobsByBtnBlock _Nonnull)jobsBackAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (self.recording) return;
        if (self.previewView) {
            self.promptCancelCurrentVideoAndClosePage(YES);
            return;
        }
        self.closePage();
    };
}

-(void)switchCameraAction:(UIButton *)sender{
    jobsByBtnBlock action = ((jobsByBtnBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsSwitchCameraAction)))(self, @selector(jobsSwitchCameraAction));
    if (action) action(sender);
}

-(jobsByBtnBlock _Nonnull)jobsSwitchCameraAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.canSwitchCamera()) return;
        if (!self.permissionReady) {
            @"权限校验中，请稍后".jobsTr().toast();
            return;
        }
        if (self.recording) return;
        sender.byEnabled(NO);
        @jobs_weakify(self)
        self.captureManager.switchCameraWithCompletion(^(BOOL success, NSError * _Nullable error) {
            @jobs_strongify(self)
            sender.byEnabled(YES);
            if (!success) (error.localizedDescription ?: @"切换摄像头失败".jobsTr()).toast();
            self.captureManager.updatePreviewOrientation(UIDevice.currentDevice.orientation);
        });
    };
}

-(void)filterAction:(UIButton *)sender{
    jobsByBtnBlock action = ((jobsByBtnBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsFilterAction)))(self, @selector(jobsFilterAction));
    if (action) action(sender);
}

-(jobsByBtnBlock _Nonnull)jobsFilterAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (self.recording) {
            @"录制中不能切换滤镜".jobsTr().toast();
            return;
        }
        if (self.previewView) {
            @"请先保存或取消当前视频".jobsTr().toast();
            return;
        }
        NSArray<NSNumber *> *filterTypes = JobsOCVideoRecorderCIFilterProcessor.allFilterTypes();
        if (!filterTypes.count) return;
        self.byFilterIndex((self.filterIndex + 1) % filterTypes.count);
        self.applyCurrentFilterAndToast(YES);
    };
}

-(void)recordButtonDidBeginLongPress:(JobsOCVideoRecorderRecordButton *)recordButton{
    jobsByJobsOCVideoRecorderRecordButtonBlock action = ((jobsByJobsOCVideoRecorderRecordButtonBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsRecordButtonDidBeginLongPress)))(self, @selector(jobsRecordButtonDidBeginLongPress));
    if (action) action(recordButton);
}

-(jobsByJobsOCVideoRecorderRecordButtonBlock _Nonnull)jobsRecordButtonDidBeginLongPress{
    @jobs_weakify(self)
    return ^(JobsOCVideoRecorderRecordButton * recordButton){
        @jobs_strongify(self)
        if (!self) return;
        self.startRecord();
    };
}

-(void)recordButtonDidEndLongPress:(JobsOCVideoRecorderRecordButton *)recordButton{
    jobsByJobsOCVideoRecorderRecordButtonBlock action = ((jobsByJobsOCVideoRecorderRecordButtonBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsRecordButtonDidEndLongPress)))(self, @selector(jobsRecordButtonDidEndLongPress));
    if (action) action(recordButton);
}

-(jobsByJobsOCVideoRecorderRecordButtonBlock _Nonnull)jobsRecordButtonDidEndLongPress{
    @jobs_weakify(self)
    return ^(JobsOCVideoRecorderRecordButton * recordButton){
        @jobs_strongify(self)
        if (!self) return;
        self.stopRecordByUser(YES);
    };
}

-(jobsByVoidBlock _Nonnull)startRecord{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.permissionReady) {
            @"权限校验中，请稍后".jobsTr().toast();
            return;
        }
        if (self.previewView) {
            @"请先保存或取消当前视频".jobsTr().toast();
            return;
        }
        if (self.recording) return;
        self.byRecording(YES);
        self.byFinishingRecord(NO);
        self.byWriterStarted(NO);
        self.byRecordStartDate(NSDate.date);
        self.byRecordingOrientation(self.effectiveDeviceOrientation());
        self.byCurrentOutputURL(self.makeTemporaryVideoURL());
        self.byAssetWriter([JobsOCVideoRecorderAssetWriter.alloc initWithConfig:self.config]);
        self.clearFormatDescriptions();
        if (self.backBtn) self.backBtn.byEnabled(NO);
        self.backBtn.byAlpha(0.35);
        if (self.filterBtn) self.filterBtn.byEnabled(NO);
        self.filterBtn.byAlpha(0.35);
        if (self.canSwitchCamera()) {
            if (self.switchCameraBtn) self.switchCameraBtn.byEnabled(NO);
            self.switchCameraBtn.byAlpha(0.35);
        }
        self.showRecordDurationLabel();
        self.recordBtn.startProgressWithDuration(self.config.maxDuration);
        self.startRecordTimer();
    };
}

-(jobsByBOOLBlock _Nonnull)stopRecordByUser{
    @jobs_weakify(self)
    return ^(BOOL userAction){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.recording || self.finishingRecord) return;
        self.byRecording(NO);
        self.byFinishingRecord(YES);
        [self.recordTimer invalidate];
        self.byRecordTimer(nil);
        self.recordBtn.stopProgress();
        if (self.backBtn) self.backBtn.byEnabled(YES);
        self.backBtn.byAlpha(1);
        if (self.filterBtn) self.filterBtn.byEnabled(YES);
        self.filterBtn.byAlpha(1);
        if (self.canSwitchCamera()) {
            if (self.switchCameraBtn) self.switchCameraBtn.byEnabled(YES);
            self.switchCameraBtn.byAlpha(1);
        }
        NSTimeInterval elapsed = [NSDate.date timeIntervalSinceDate:self.recordStartDate ?: NSDate.date];
        self.hideRecordDurationLabel();
        if (elapsed < self.config.minDuration) {
            [self.assetWriter cancelWriting];
            self.removeCurrentOutputFile();
            self.recordBtn.resetProgress();
            self.byFinishingRecord(NO);
            @"录制时间不能少于 3 秒".jobsTr().toast();
            return;
        }
        if (!self.writerStarted) {
            [self.assetWriter cancelWriting];
            self.removeCurrentOutputFile();
            self.recordBtn.resetProgress();
            self.byFinishingRecord(NO);
            @"录制失败，请重试".jobsTr().toast();
            return;
        }
        @jobs_weakify(self)
        self.assetWriter.finishWritingWithCompletion(^(NSURL * _Nullable fileURL, CMTime duration, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                self.byFinishingRecord(NO);
                self.recordBtn.resetProgress();
                if (self.captureSuspended) {
                    if (fileURL) [NSFileManager.defaultManager removeItemAtURL:fileURL error:nil];
                    return;
                }
                if (error || !fileURL) {
                    (error.localizedDescription ?: @"录制失败，请重试".jobsTr()).toast();
                    self.removeCurrentOutputFile();
                    return;
                }
                self.byCurrentResult([JobsOCVideoRecorderResult resultWithFileURL:fileURL duration:duration]);
                self.showPreviewWithURL(fileURL);
            });
        });
    };
}

-(jobsByVoidBlock _Nonnull)jobs_installApplicationStateObservers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsAddNotification(self,
                            @selector(jobs_applicationDidEnterBackground:),
                            UIApplicationDidEnterBackgroundNotification,
                            nil);
        JobsAddNotification(self,
                            @selector(jobs_applicationDidBecomeActive:),
                            UIApplicationDidBecomeActiveNotification,
                            nil);
    };
}

-(void)jobs_applicationDidEnterBackground:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsJobs_applicationDidEnterBackground)))(self, @selector(jobsJobs_applicationDidEnterBackground));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_applicationDidEnterBackground{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        (void)notification;
        self.byCaptureSuspended(YES);
        [self.captureManager stopRunning];
        if (self.previewView) self.previewView.jobsStop();
        self.jobs_discardActiveRecording();
    };
}

-(void)jobs_applicationDidBecomeActive:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderVC.class, @selector(jobsJobs_applicationDidBecomeActive)))(self, @selector(jobsJobs_applicationDidBecomeActive));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_applicationDidBecomeActive{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        (void)notification;
        if (!self.permissionReady || !self.viewIfLoaded.window) return;
        self.byCaptureSuspended(NO);
        [self.captureManager startRunning];
    };
}

-(jobsByVoidBlock _Nonnull)jobs_discardActiveRecording{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.recording && !self.finishingRecord) return;
        self.byRecording(NO);
        self.byFinishingRecord(NO);
        self.byWriterStarted(NO);
        [self.recordTimer invalidate];
        self.byRecordTimer(nil);
        self.recordBtn.stopProgress();
        self.recordBtn.resetProgress();
        self.hideRecordDurationLabel();
        if (self.backBtn) self.backBtn.byEnabled(YES);
        self.backBtn.byAlpha(1);
        if (self.filterBtn) self.filterBtn.byEnabled(YES);
        self.filterBtn.byAlpha(1);
        if (self.canSwitchCamera()) {
            if (self.switchCameraBtn) self.switchCameraBtn.byEnabled(YES);
            self.switchCameraBtn.byAlpha(1);
        }
        [self.assetWriter cancelWriting];
        self.removeCurrentOutputFile();
        self.clearFormatDescriptions();
    };
}

-(jobsByVoidBlock _Nonnull)startRecordTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.recordTimer invalidate];
        @jobs_weakify(self)
        self.recordTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer * _Nonnull timer) {
            @jobs_strongify(self)
            NSTimeInterval elapsed = [NSDate.date timeIntervalSinceDate:self.recordStartDate ?: NSDate.date];
            self.updateRecordDurationLabelWithElapsed(elapsed);
            if (elapsed >= self.config.maxDuration) {
                self.stopRecordByUser(NO);
            }
        }];
    };
}

-(jobsByURLBlock _Nonnull)showPreviewWithURL{
    @jobs_weakify(self)
    return ^(NSURL * URL){
        @jobs_strongify(self)
        if (!self) return;
        if (self.previewView) self.previewView.jobsStop();
        [self.previewView removeFromSuperview];
        self.byPreviewView(nil);
        CGFloat width = JobsWidth(150);
        CGFloat height = JobsWidth(230);
        self.byPreviewView([JobsOCVideoRecorderPreviewView.alloc initWithFrame:CGRectZero]);
        @jobs_weakify(self)
        self.previewView.cancelBlock = ^(JobsOCVideoRecorderPreviewView *data) {
            @jobs_strongify(self)
            self.promptCancelCurrentVideoAndClosePage(NO);
        };
        self.previewView.saveBlock = ^(JobsOCVideoRecorderPreviewView *data) {
            @jobs_strongify(self)
            self.saveCurrentVideo();
        };
        [self.view addSubview:self.previewView];
        [self.previewView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(-JobsWidth(16));
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(72));
            make.size.mas_equalTo(CGSizeMake(width, height));
        }];
        [self.view layoutIfNeeded];
        self.previewView.playWithURL(URL);
        [self.view bringSubviewToFront:self.backBtn];
        [self.view bringSubviewToFront:self.titleLabel];
        if (self.canSwitchCamera()) [self.view bringSubviewToFront:self.switchCameraBtn];
        [self.view bringSubviewToFront:self.filterBtn];
    };
}

-(jobsByVoidBlock _Nonnull)saveCurrentVideo{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.currentResult.fileURL) {
            @"没有可保存的视频".jobsTr().toast();
            return;
        }
        self.previewView.byUserInteractionEnabled(NO);
        @jobs_weakify(self)
        [JobsOCVideoRecorderAlbumSaver saveVideoAtURL:self.currentResult.fileURL
                                            albumName:self.config.effectiveAlbumName()
                                           completion:^(NSString * _Nullable assetLocalIdentifier, NSError * _Nullable error) {
            @jobs_strongify(self)
            self.previewView.byUserInteractionEnabled(YES);
            if (error) {
                (error.localizedDescription ?: @"保存失败".jobsTr()).toast();
                return;
            }
            self.currentResult.byAssetLocalIdentifier(assetLocalIdentifier);
            @"保存成功".jobsTr().toast();
            if (self.config.completionBlock) self.config.completionBlock(self.currentResult, nil);
            self.cleanupPreviewAndOutputFile();
        }];
    };
}

-(jobsByBOOLBlock _Nonnull)promptCancelCurrentVideoAndClosePage{
    @jobs_weakify(self)
    return ^(BOOL closePage){
        @jobs_strongify(self)
        if (!self) return;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否取消录制？".jobsTr()
                                                                       message:@"取消后本次录制的视频不会保存".jobsTr()
                                                                preferredStyle:UIAlertControllerStyleAlert];
        @jobs_weakify(self)
        [alert addAction:[UIAlertAction actionWithTitle:@"继续编辑".jobsTr()
                                                  style:UIAlertActionStyleCancel
                                                handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消录制".jobsTr()
                                                  style:UIAlertActionStyleDestructive
                                                handler:^(UIAlertAction * _Nonnull action) {
            @jobs_strongify(self)
            self.cleanupPreviewAndOutputFile();
            if (closePage) self.closePage();
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    };
}

-(jobsByVoidBlock _Nonnull)closePage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.navigationController && self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    };
}

-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
didOutputVideoSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    if (!self.recording || self.finishingRecord) return;
    self.updateVideoFormatDescription(CMSampleBufferGetFormatDescription(sampleBuffer));
    self.startWriterIfNeeded();
    if (self.writerStarted) self.assetWriter.appendVideoSampleBuffer(sampleBuffer);
}

-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
didOutputAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    if (!self.recording || self.finishingRecord) return;
    self.updateAudioFormatDescription(CMSampleBufferGetFormatDescription(sampleBuffer));
    self.startWriterIfNeeded();
    if (self.writerStarted) self.assetWriter.appendAudioSampleBuffer(sampleBuffer);
}

-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
     didFailWithError:(NSError *)error{
    (error.localizedDescription ?: @"采集异常".jobsTr()).toast();
}

-(jobsByVoidBlock _Nonnull)startWriterIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.writerStarted || !_latestVideoFormatDescription || !_latestAudioFormatDescription || !self.currentOutputURL) return;
        NSError *error = nil;
        BOOL success = [self.assetWriter startWritingToURL:self.currentOutputURL
                                    videoFormatDescription:_latestVideoFormatDescription
                                    audioFormatDescription:_latestAudioFormatDescription
                                         deviceOrientation:self.recordingOrientation
                                               frontCamera:self.captureManager.currentPosition == AVCaptureDevicePositionFront
                                                     error:&error];
        if (!success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                (error.localizedDescription ?: @"录制启动失败".jobsTr()).toast();
                self.stopRecordByUser(NO);
            });
            return;
        }
        self.byWriterStarted(YES);
    };
}

-(JobsRetUIDeviceOrientationByVoidBlock _Nonnull)effectiveDeviceOrientation{
    @jobs_weakify(self)
    return ^UIDeviceOrientation{
        @jobs_strongify(self)
        if (!self) return (UIDeviceOrientation){0};
        UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
        if (orientation == UIDeviceOrientationUnknown ||
            orientation == UIDeviceOrientationFaceUp ||
            orientation == UIDeviceOrientationFaceDown) {
            orientation = UIDeviceOrientationPortrait;
        };return orientation;
    };
}

-(JobsRetURLByVoidBlock _Nonnull)makeTemporaryVideoURL{
    @jobs_weakify(self)
    return ^NSURL *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *fileName = [NSString stringWithFormat:@"JobsOCVideoRecorder_%@.mp4", NSUUID.UUID.UUIDString];
        NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
        return [NSURL fileURLWithPath:path];
    };
}

-(jobsByVoidBlock _Nonnull)cleanupPreviewAndOutputFile{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.previewView) self.previewView.jobsStop();
        [self.previewView removeFromSuperview];
        self.byPreviewView(nil);
        self.removeCurrentOutputFile();
        self.byCurrentResult(nil);
    };
}

-(jobsByVoidBlock _Nonnull)removeCurrentOutputFile{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.currentOutputURL) [NSFileManager.defaultManager removeItemAtURL:self.currentOutputURL error:nil];
        self.byCurrentOutputURL(nil);
        self.byAssetWriter(nil);
    };
}

-(jobsByCMFormatDescriptionRefBlock _Nonnull)updateVideoFormatDescription{
    @jobs_weakify(self)
    return ^(CMFormatDescriptionRef formatDescription){
        @jobs_strongify(self)
        if (!self) return;
        if (!formatDescription || _latestVideoFormatDescription == formatDescription) return;
        if (_latestVideoFormatDescription) CFRelease(_latestVideoFormatDescription);
        _latestVideoFormatDescription = (CMFormatDescriptionRef)CFRetain(formatDescription);
    };
}

-(jobsByCMFormatDescriptionRefBlock _Nonnull)updateAudioFormatDescription{
    @jobs_weakify(self)
    return ^(CMFormatDescriptionRef formatDescription){
        @jobs_strongify(self)
        if (!self) return;
        if (!formatDescription || _latestAudioFormatDescription == formatDescription) return;
        if (_latestAudioFormatDescription) CFRelease(_latestAudioFormatDescription);
        _latestAudioFormatDescription = (CMFormatDescriptionRef)CFRetain(formatDescription);
    };
}

-(jobsByVoidBlock _Nonnull)clearFormatDescriptions{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (_latestVideoFormatDescription) {
            CFRelease(_latestVideoFormatDescription);
            _latestVideoFormatDescription = nil;
        }
        if (_latestAudioFormatDescription) {
            CFRelease(_latestAudioFormatDescription);
            _latestAudioFormatDescription = nil;
        }
    };
}

-(jobsByVoidBlock _Nonnull)showRecordDurationLabel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.updateRecordDurationLabelWithElapsed(0);
        self.recordDurationLabel.byAlpha(1);
        [self.view bringSubviewToFront:self.recordDurationLabel];
    };
}

-(jobsByVoidBlock _Nonnull)hideRecordDurationLabel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.recordDurationLabel.byAlpha(0);
    };
}

-(jobsByTimeIntervalBlock _Nonnull)updateRecordDurationLabelWithElapsed{
    @jobs_weakify(self)
    return ^(NSTimeInterval elapsed){
        @jobs_strongify(self)
        if (!self) return;
        self.recordDurationLabel.byText([NSString stringWithFormat:@"%.1f秒".jobsTr(), MAX(0, elapsed)]);
    };
}

-(jobsByBOOLBlock _Nonnull)applyCurrentFilterAndToast{
    @jobs_weakify(self)
    return ^(BOOL toast){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCVideoRecorderCIFilterType filterType = self.currentFilterType();
        NSString *filterTitle = JobsOCVideoRecorderCIFilterProcessor.titleForFilterType(filterType);
        if (filterType == JobsOCVideoRecorderCIFilterTypeNormal) {
            self.config.byFilterProcessor(self.originFilterProcessor);
            self.filterBtn.jobsResetBtnTitle(@"滤镜".jobsTr());
        }else{
            self.builtInFilterProcessor.byFilterType(filterType);
            self.config.byFilterProcessor(self.builtInFilterProcessor);
            self.filterBtn.jobsResetBtnTitle(filterTitle);
        }
        if (toast) [NSString stringWithFormat:@"滤镜：%@".jobsTr(), filterTitle].toast();
    };
}

-(JobsRetJobsOCVideoRecorderCIFilterTypeByVoidBlock _Nonnull)currentFilterType{
    @jobs_weakify(self)
    return ^JobsOCVideoRecorderCIFilterType{
        @jobs_strongify(self)
        if (!self) return (JobsOCVideoRecorderCIFilterType){0};
        NSArray<NSNumber *> *filterTypes = JobsOCVideoRecorderCIFilterProcessor.allFilterTypes();
        if (!filterTypes.count) return JobsOCVideoRecorderCIFilterTypeNormal;
        NSUInteger index = self.filterIndex % filterTypes.count;
        return (JobsOCVideoRecorderCIFilterType)filterTypes[index].unsignedIntegerValue;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)canSwitchCamera{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return JobsOCVideoRecorderCaptureManager.isCameraSwitchAvailable();
    };
}

-(jobsByBOOLBlock _Nonnull)hideHostNavigationBarIfNeeded{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.navigationStateCaptured) {
            self.byOriginNavigationBarHidden(self.navigationController.navigationBarHidden);
            self.byOriginHidesBackButton(self.navigationItem.hidesBackButton);
            self.byOriginSetupNavigationBarHidden([self boolValueForRecorderKey:@"setupNavigationBarHidden" fallback:self.originNavigationBarHidden]);
            UIView *gkNavigationBar = self.recorderGKNavigationBar();
            self.byOriginGKNavigationBar(gkNavigationBar);
            self.byOriginGKNavigationBarHidden(gkNavigationBar.hidden);
            self.byOriginGKNavigationBarAlpha(gkNavigationBar.alpha);
            self.byNavigationStateCaptured(YES);
        }
        self.navigationItem.byHidesBackButton(YES);
        [self.navigationController setNavigationBarHidden:YES animated:animated];
        [self setBoolValue:YES forRecorderKey:@"setupNavigationBarHidden"];
        UIView *gkNavigationBar = self.originGKNavigationBar ?: self.recorderGKNavigationBar();
        gkNavigationBar.byHidden(YES);
        gkNavigationBar.byAlpha(0);
    };
}

-(jobsByBOOLBlock _Nonnull)restoreHostNavigationBarIfNeeded{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.navigationStateCaptured) return;
        self.navigationItem.byHidesBackButton(self.originHidesBackButton);
        [self.navigationController setNavigationBarHidden:self.originNavigationBarHidden animated:animated];
        [self setBoolValue:self.originSetupNavigationBarHidden forRecorderKey:@"setupNavigationBarHidden"];
        self.originGKNavigationBar.byHidden(self.originGKNavigationBarHidden);
        self.originGKNavigationBar.byAlpha(self.originGKNavigationBarAlpha);
        self.byNavigationStateCaptured(NO);
    };
}

-(JobsRetViewByVoidBlock _Nonnull)recorderGKNavigationBar{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        @try {
            id navigationBar = [self valueForKey:@"gk_navigationBar"];
            if ([navigationBar isKindOfClass:UIView.class]) return navigationBar;
        } @catch (__unused NSException *exception) {
        };return nil;
    };
}

-(BOOL)boolValueForRecorderKey:(NSString *)key
                      fallback:(BOOL)fallback{
    @try {
        id value = [self valueForKey:key];
        return value ? [value boolValue] : fallback;
    } @catch (__unused NSException *exception) {
    };return fallback;
}

-(void)setBoolValue:(BOOL)value
     forRecorderKey:(NSString *)key{
    @try {
        NSString *setterName = [NSString stringWithFormat:@"set%@%@:",
                                [key substringToIndex:1].uppercaseString,
                                [key substringFromIndex:1]];
        if ([self respondsToSelector:NSSelectorFromString(setterName)]) [self setValue:@(value) forKey:key];
    } @catch (__unused NSException *exception) {
    }
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn.jobsResetBtnTitle(@"‹")
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(34))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.25));
            btn.layer.byCornerRadius(JobsWidth(18));
            [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        });
        _backBtn.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(16));
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(12));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(48), JobsWidth(36)));
        });
    };return _backBtn;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"长按录制视频".jobsTr())
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightMediumSize(17))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1);
        });
        UIView *rightControl = self.canSwitchCamera() ? self.switchCameraBtn : self.filterBtn;
        _titleLabel.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo(self.backBtn.mas_right).offset(JobsWidth(8));
            make.right.lessThanOrEqualTo(rightControl.mas_left).offset(-JobsWidth(8));
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.backBtn);
        });
    };return _titleLabel;
}

-(UIButton *)switchCameraBtn{
    if (!_switchCameraBtn) {
        _switchCameraBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn.jobsResetBtnTitle(@"切换".jobsTr())
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.25));
            btn.layer.byCornerRadius(JobsWidth(18));
            [btn addTarget:self action:@selector(switchCameraAction:) forControlEvents:UIControlEventTouchUpInside];
        });
        _switchCameraBtn.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.right.equalTo(self.filterBtn.mas_left).offset(-JobsWidth(8));
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(12));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(36)));
        });
    };return _switchCameraBtn;
}

-(UIButton *)filterBtn{
    if (!_filterBtn) {
        _filterBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn.jobsResetBtnTitle(@"滤镜".jobsTr())
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.25));
            btn.layer.byCornerRadius(JobsWidth(18));
            [btn addTarget:self action:@selector(filterAction:) forControlEvents:UIControlEventTouchUpInside];
        });
        _filterBtn.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(-JobsWidth(16));
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(12));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(36)));
        });
    };return _filterBtn;
}

-(JobsOCVideoRecorderRecordButton *)recordBtn{
    if (!_recordBtn) {
        _recordBtn = JobsOCVideoRecorderRecordButton.new.byDelegate(self);
        _recordBtn.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(36));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(88)));
        });
    };return _recordBtn;
}

-(UILabel *)recordDurationLabel{
    if (!_recordDurationLabel) {
        _recordDurationLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"0.0秒".jobsTr())
                 .byFont(UIFontWeightSemiboldSize(16))
                 .byTextCor(UIColor.whiteColor)
                 .byTextAlignment(NSTextAlignmentCenter)
                 .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.35));
            label.layer.byCornerRadius(JobsWidth(14));
            label.layer.byMasksToBounds(YES);
        });
        _recordDurationLabel.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.recordBtn);
            make.bottom.equalTo(self.recordBtn.mas_top).offset(-JobsWidth(14));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(28)));
        });
    };return _recordDurationLabel;
}

-(JobsOCVideoRecorderCIFilterProcessor *)builtInFilterProcessor{
    if (!_builtInFilterProcessor) {
        _builtInFilterProcessor = [JobsOCVideoRecorderCIFilterProcessor.alloc initWithFilterType:JobsOCVideoRecorderCIFilterTypeNormal];
    };return _builtInFilterProcessor;
}

-(JobsOCVideoRecorderCaptureManager *)captureManager{
    if (!_captureManager) {
        _captureManager = [JobsOCVideoRecorderCaptureManager.alloc initWithPosition:self.config.preferredCameraPosition
                                                                 mirrorFrontPreview:self.config.mirrorsFrontCameraPreview]
            .byDelegate(self);
    };return _captureManager;
}

@end
