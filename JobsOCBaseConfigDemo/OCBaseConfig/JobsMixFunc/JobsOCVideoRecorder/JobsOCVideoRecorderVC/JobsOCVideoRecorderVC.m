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

@end

@implementation JobsOCVideoRecorderVC
-(instancetype)init{
    return [self initWithConfig:JobsOCVideoRecorderConfig.defaultConfig];
}

-(instancetype)initWithConfig:(JobsOCVideoRecorderConfig *)config{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _config = config ?: JobsOCVideoRecorderConfig.defaultConfig;
        _originFilterProcessor = _config.filterProcessor;
    };return self;
}

-(void)dealloc{
    JobsRemoveNotification(self);
    [self.recordTimer invalidate];
    [UIDevice.currentDevice endGeneratingDeviceOrientationNotifications];
    [self.captureManager stopRunning];
    [self.assetWriter cancelWriting];
    [self.previewView stop];
    [self clearFormatDescriptions];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self jobs_installApplicationStateObservers];
    [UIDevice.currentDevice beginGeneratingDeviceOrientationNotifications];
    self.view.byBgColor(JobsSystemBackgroundColor);
    [self.view.layer insertSublayer:self.captureManager.previewLayer atIndex:0];
    self.backBtn.alpha = 1;
    self.titleLabel.alpha = 1;
    if (self.canSwitchCamera) self.switchCameraBtn.alpha = 1;
    self.filterBtn.alpha = 1;
    self.recordBtn.alpha = 1;
    self.recordDurationLabel.byAlpha(0);
#if TARGET_OS_SIMULATOR
    self.filterBtn.enabled = NO;
    self.filterBtn.alpha = 0.35;
    self.recordBtn.userInteractionEnabled = NO;
    self.recordBtn.alpha = 0.35;
    @"iOS 模拟器不支持摄像头录制，请使用真机".tr.toast();
#else
    [self requestPermissions];
#endif
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.captureManager.previewLayer.frame = self.view.bounds;
    [self.captureManager updatePreviewOrientation:UIDevice.currentDevice.orientation];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.captureSuspended = NO;
    if (self.permissionReady) [self.captureManager startRunning];
    [self hideHostNavigationBarIfNeeded:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self restoreHostNavigationBarIfNeeded:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.captureSuspended = YES;
    [self.captureManager stopRunning];
    [self jobs_discardActiveRecording];
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion
         withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake && self.previewView) {
        [self promptCancelCurrentVideoAndClosePage:NO];
    }
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

-(void)requestPermissions{
    @jobs_weakify(self)
    [TKPermissionCamera authWithAlert:YES completion:^(BOOL cameraAuth) {
        @jobs_strongify(self)
        if (!cameraAuth) {
            @"相机权限未开启".tr.toast();
            return;
        }
        [TKPermissionMicrophone authWithAlert:YES completion:^(BOOL microphoneAuth) {
            @jobs_strongify(self)
            if (!microphoneAuth) {
                @"麦克风权限未开启".tr.toast();
                return;
            }
            [TKPermissionPhoto authWithAlert:YES level:TKPhotoAccessLevelReadWrite completion:^(BOOL photoAuth) {
                @jobs_strongify(self)
                if (!photoAuth) {
                    @"相册权限未开启".tr.toast();
                    return;
                }
                self.permissionReady = YES;
                [self.captureManager startRunning];
            }];
        }];
    }];
}

-(void)backAction:(UIButton *)sender{
    if (self.recording) return;
    if (self.previewView) {
        [self promptCancelCurrentVideoAndClosePage:YES];
        return;
    }
    [self closePage];
}

-(void)switchCameraAction:(UIButton *)sender{
    if (!self.canSwitchCamera) return;
    if (!self.permissionReady) {
        @"权限校验中，请稍后".tr.toast();
        return;
    }
    if (self.recording) return;
    sender.enabled = NO;
    @jobs_weakify(self)
    [self.captureManager switchCameraWithCompletion:^(BOOL success, NSError * _Nullable error) {
        @jobs_strongify(self)
        sender.enabled = YES;
        if (!success) (error.localizedDescription ?: @"切换摄像头失败".tr).toast();
        [self.captureManager updatePreviewOrientation:UIDevice.currentDevice.orientation];
    }];
}

-(void)filterAction:(UIButton *)sender{
    if (self.recording) {
        @"录制中不能切换滤镜".tr.toast();
        return;
    }
    if (self.previewView) {
        @"请先保存或取消当前视频".tr.toast();
        return;
    }
    NSArray<NSNumber *> *filterTypes = JobsOCVideoRecorderCIFilterProcessor.allFilterTypes;
    if (!filterTypes.count) return;
    self.filterIndex = (self.filterIndex + 1) % filterTypes.count;
    [self applyCurrentFilterAndToast:YES];
}

-(void)recordButtonDidBeginLongPress:(JobsOCVideoRecorderRecordButton *)recordButton{
    [self startRecord];
}

-(void)recordButtonDidEndLongPress:(JobsOCVideoRecorderRecordButton *)recordButton{
    [self stopRecordByUser:YES];
}

-(void)startRecord{
    if (!self.permissionReady) {
        @"权限校验中，请稍后".tr.toast();
        return;
    }
    if (self.previewView) {
        @"请先保存或取消当前视频".tr.toast();
        return;
    }
    if (self.recording) return;
    self.recording = YES;
    self.finishingRecord = NO;
    self.writerStarted = NO;
    self.recordStartDate = NSDate.date;
    self.recordingOrientation = [self effectiveDeviceOrientation];
    self.currentOutputURL = [self makeTemporaryVideoURL];
    self.assetWriter = [JobsOCVideoRecorderAssetWriter.alloc initWithConfig:self.config];
    [self clearFormatDescriptions];
    self.backBtn.enabled = NO;
    self.backBtn.alpha = 0.35;
    self.filterBtn.enabled = NO;
    self.filterBtn.alpha = 0.35;
    if (self.canSwitchCamera) {
        self.switchCameraBtn.enabled = NO;
        self.switchCameraBtn.alpha = 0.35;
    }
    [self showRecordDurationLabel];
    [self.recordBtn startProgressWithDuration:self.config.maxDuration];
    [self startRecordTimer];
}

-(void)stopRecordByUser:(BOOL)userAction{
    if (!self.recording || self.finishingRecord) return;
    self.recording = NO;
    self.finishingRecord = YES;
    [self.recordTimer invalidate];
    self.recordTimer = nil;
    [self.recordBtn stopProgress];
    self.backBtn.enabled = YES;
    self.backBtn.alpha = 1;
    self.filterBtn.enabled = YES;
    self.filterBtn.alpha = 1;
    if (self.canSwitchCamera) {
        self.switchCameraBtn.enabled = YES;
        self.switchCameraBtn.alpha = 1;
    }
    NSTimeInterval elapsed = [NSDate.date timeIntervalSinceDate:self.recordStartDate ?: NSDate.date];
    [self hideRecordDurationLabel];
    if (elapsed < self.config.minDuration) {
        [self.assetWriter cancelWriting];
        [self removeCurrentOutputFile];
        [self.recordBtn resetProgress];
        self.finishingRecord = NO;
        @"录制时间不能少于 3 秒".tr.toast();
        return;
    }
    if (!self.writerStarted) {
        [self.assetWriter cancelWriting];
        [self removeCurrentOutputFile];
        [self.recordBtn resetProgress];
        self.finishingRecord = NO;
        @"录制失败，请重试".tr.toast();
        return;
    }
    @jobs_weakify(self)
    [self.assetWriter finishWritingWithCompletion:^(NSURL * _Nullable fileURL, CMTime duration, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.finishingRecord = NO;
            [self.recordBtn resetProgress];
            if (self.captureSuspended) {
                if (fileURL) [NSFileManager.defaultManager removeItemAtURL:fileURL error:nil];
                return;
            }
            if (error || !fileURL) {
                (error.localizedDescription ?: @"录制失败，请重试".tr).toast();
                [self removeCurrentOutputFile];
                return;
            }
            self.currentResult = [JobsOCVideoRecorderResult resultWithFileURL:fileURL duration:duration];
            [self showPreviewWithURL:fileURL];
        });
    }];
}

-(void)jobs_installApplicationStateObservers{
    JobsAddNotification(self,
                        @selector(jobs_applicationDidEnterBackground:),
                        UIApplicationDidEnterBackgroundNotification,
                        nil);
    JobsAddNotification(self,
                        @selector(jobs_applicationDidBecomeActive:),
                        UIApplicationDidBecomeActiveNotification,
                        nil);
}

-(void)jobs_applicationDidEnterBackground:(NSNotification *)notification{
    (void)notification;
    self.captureSuspended = YES;
    [self.captureManager stopRunning];
    [self.previewView stop];
    [self jobs_discardActiveRecording];
}

-(void)jobs_applicationDidBecomeActive:(NSNotification *)notification{
    (void)notification;
    if (!self.permissionReady || !self.viewIfLoaded.window) return;
    self.captureSuspended = NO;
    [self.captureManager startRunning];
}

-(void)jobs_discardActiveRecording{
    if (!self.recording && !self.finishingRecord) return;
    self.recording = NO;
    self.finishingRecord = NO;
    self.writerStarted = NO;
    [self.recordTimer invalidate];
    self.recordTimer = nil;
    [self.recordBtn stopProgress];
    [self.recordBtn resetProgress];
    [self hideRecordDurationLabel];
    self.backBtn.enabled = YES;
    self.backBtn.alpha = 1;
    self.filterBtn.enabled = YES;
    self.filterBtn.alpha = 1;
    if (self.canSwitchCamera) {
        self.switchCameraBtn.enabled = YES;
        self.switchCameraBtn.alpha = 1;
    }
    [self.assetWriter cancelWriting];
    [self removeCurrentOutputFile];
    [self clearFormatDescriptions];
}

-(void)startRecordTimer{
    [self.recordTimer invalidate];
    @jobs_weakify(self)
    self.recordTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer * _Nonnull timer) {
        @jobs_strongify(self)
        NSTimeInterval elapsed = [NSDate.date timeIntervalSinceDate:self.recordStartDate ?: NSDate.date];
        [self updateRecordDurationLabelWithElapsed:elapsed];
        if (elapsed >= self.config.maxDuration) {
            [self stopRecordByUser:NO];
        }
    }];
}

-(void)showPreviewWithURL:(NSURL *)URL{
    [self.previewView stop];
    [self.previewView removeFromSuperview];
    self.previewView = nil;
    CGFloat width = JobsWidth(150);
    CGFloat height = JobsWidth(230);
    self.previewView = [JobsOCVideoRecorderPreviewView.alloc initWithFrame:CGRectZero];
    @jobs_weakify(self)
    self.previewView.cancelBlock = ^(JobsOCVideoRecorderPreviewView *data) {
        @jobs_strongify(self)
        [self promptCancelCurrentVideoAndClosePage:NO];
    };
    self.previewView.saveBlock = ^(JobsOCVideoRecorderPreviewView *data) {
        @jobs_strongify(self)
        [self saveCurrentVideo];
    };
    [self.view addSubview:self.previewView];
    [self.previewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-JobsWidth(16));
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(72));
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];
    [self.view layoutIfNeeded];
    [self.previewView playWithURL:URL];
    [self.view bringSubviewToFront:self.backBtn];
    [self.view bringSubviewToFront:self.titleLabel];
    if (self.canSwitchCamera) [self.view bringSubviewToFront:self.switchCameraBtn];
    [self.view bringSubviewToFront:self.filterBtn];
}

-(void)saveCurrentVideo{
    if (!self.currentResult.fileURL) {
        @"没有可保存的视频".tr.toast();
        return;
    }
    self.previewView.userInteractionEnabled = NO;
    @jobs_weakify(self)
    [JobsOCVideoRecorderAlbumSaver saveVideoAtURL:self.currentResult.fileURL
                                        albumName:self.config.effectiveAlbumName
                                       completion:^(NSString * _Nullable assetLocalIdentifier, NSError * _Nullable error) {
        @jobs_strongify(self)
        self.previewView.userInteractionEnabled = YES;
        if (error) {
            (error.localizedDescription ?: @"保存失败".tr).toast();
            return;
        }
        self.currentResult.assetLocalIdentifier = assetLocalIdentifier;
        @"保存成功".tr.toast();
        if (self.config.completionBlock) self.config.completionBlock(self.currentResult, nil);
        [self cleanupPreviewAndOutputFile];
    }];
}

-(void)promptCancelCurrentVideoAndClosePage:(BOOL)closePage{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否取消录制？".tr
                                                                   message:@"取消后本次录制的视频不会保存".tr
                                                            preferredStyle:UIAlertControllerStyleAlert];
    @jobs_weakify(self)
    [alert addAction:[UIAlertAction actionWithTitle:@"继续编辑".tr
                                              style:UIAlertActionStyleCancel
                                            handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消录制".tr
                                              style:UIAlertActionStyleDestructive
                                            handler:^(UIAlertAction * _Nonnull action) {
        @jobs_strongify(self)
        [self cleanupPreviewAndOutputFile];
        if (closePage) [self closePage];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)closePage{
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
didOutputVideoSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    if (!self.recording || self.finishingRecord) return;
    [self updateVideoFormatDescription:CMSampleBufferGetFormatDescription(sampleBuffer)];
    [self startWriterIfNeeded];
    if (self.writerStarted) [self.assetWriter appendVideoSampleBuffer:sampleBuffer];
}

-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
didOutputAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    if (!self.recording || self.finishingRecord) return;
    [self updateAudioFormatDescription:CMSampleBufferGetFormatDescription(sampleBuffer)];
    [self startWriterIfNeeded];
    if (self.writerStarted) [self.assetWriter appendAudioSampleBuffer:sampleBuffer];
}

-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
     didFailWithError:(NSError *)error{
    (error.localizedDescription ?: @"采集异常".tr).toast();
}

-(void)startWriterIfNeeded{
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
            (error.localizedDescription ?: @"录制启动失败".tr).toast();
            [self stopRecordByUser:NO];
        });
        return;
    }
    self.writerStarted = YES;
}

-(UIDeviceOrientation)effectiveDeviceOrientation{
    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
    if (orientation == UIDeviceOrientationUnknown ||
        orientation == UIDeviceOrientationFaceUp ||
        orientation == UIDeviceOrientationFaceDown) {
        orientation = UIDeviceOrientationPortrait;
    };return orientation;
}

-(NSURL *)makeTemporaryVideoURL{
    NSString *fileName = [NSString stringWithFormat:@"JobsOCVideoRecorder_%@.mp4", NSUUID.UUID.UUIDString];
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    return [NSURL fileURLWithPath:path];
}

-(void)cleanupPreviewAndOutputFile{
    [self.previewView stop];
    [self.previewView removeFromSuperview];
    self.previewView = nil;
    [self removeCurrentOutputFile];
    self.currentResult = nil;
}

-(void)removeCurrentOutputFile{
    if (self.currentOutputURL) [NSFileManager.defaultManager removeItemAtURL:self.currentOutputURL error:nil];
    self.currentOutputURL = nil;
    self.assetWriter = nil;
}

-(void)updateVideoFormatDescription:(CMFormatDescriptionRef)formatDescription{
    if (!formatDescription || _latestVideoFormatDescription == formatDescription) return;
    if (_latestVideoFormatDescription) CFRelease(_latestVideoFormatDescription);
    _latestVideoFormatDescription = (CMFormatDescriptionRef)CFRetain(formatDescription);
}

-(void)updateAudioFormatDescription:(CMFormatDescriptionRef)formatDescription{
    if (!formatDescription || _latestAudioFormatDescription == formatDescription) return;
    if (_latestAudioFormatDescription) CFRelease(_latestAudioFormatDescription);
    _latestAudioFormatDescription = (CMFormatDescriptionRef)CFRetain(formatDescription);
}

-(void)clearFormatDescriptions{
    if (_latestVideoFormatDescription) {
        CFRelease(_latestVideoFormatDescription);
        _latestVideoFormatDescription = nil;
    }
    if (_latestAudioFormatDescription) {
        CFRelease(_latestAudioFormatDescription);
        _latestAudioFormatDescription = nil;
    }
}

-(void)showRecordDurationLabel{
    [self updateRecordDurationLabelWithElapsed:0];
    self.recordDurationLabel.byAlpha(1);
    [self.view bringSubviewToFront:self.recordDurationLabel];
}

-(void)hideRecordDurationLabel{
    self.recordDurationLabel.byAlpha(0);
}

-(void)updateRecordDurationLabelWithElapsed:(NSTimeInterval)elapsed{
    self.recordDurationLabel.byText([NSString stringWithFormat:@"%.1f秒".tr, MAX(0, elapsed)]);
}

-(void)applyCurrentFilterAndToast:(BOOL)toast{
    JobsOCVideoRecorderCIFilterType filterType = [self currentFilterType];
    NSString *filterTitle = [JobsOCVideoRecorderCIFilterProcessor titleForFilterType:filterType];
    if (filterType == JobsOCVideoRecorderCIFilterTypeNormal) {
        self.config.filterProcessor = self.originFilterProcessor;
        self.filterBtn.jobsResetBtnTitle(@"滤镜".tr);
    }else{
        self.builtInFilterProcessor.filterType = filterType;
        self.config.filterProcessor = self.builtInFilterProcessor;
        self.filterBtn.jobsResetBtnTitle(filterTitle);
    }
    if (toast) [NSString stringWithFormat:@"滤镜：%@".tr, filterTitle].toast();
}

-(JobsOCVideoRecorderCIFilterType)currentFilterType{
    NSArray<NSNumber *> *filterTypes = JobsOCVideoRecorderCIFilterProcessor.allFilterTypes;
    if (!filterTypes.count) return JobsOCVideoRecorderCIFilterTypeNormal;
    NSUInteger index = self.filterIndex % filterTypes.count;
    return (JobsOCVideoRecorderCIFilterType)filterTypes[index].unsignedIntegerValue;
}

-(BOOL)canSwitchCamera{
    return [JobsOCVideoRecorderCaptureManager isCameraSwitchAvailable];
}

-(void)hideHostNavigationBarIfNeeded:(BOOL)animated{
    if (!self.navigationStateCaptured) {
        self.originNavigationBarHidden = self.navigationController.navigationBarHidden;
        self.originHidesBackButton = self.navigationItem.hidesBackButton;
        self.originSetupNavigationBarHidden = [self boolValueForRecorderKey:@"setupNavigationBarHidden" fallback:self.originNavigationBarHidden];
        UIView *gkNavigationBar = [self recorderGKNavigationBar];
        self.originGKNavigationBar = gkNavigationBar;
        self.originGKNavigationBarHidden = gkNavigationBar.hidden;
        self.originGKNavigationBarAlpha = gkNavigationBar.alpha;
        self.navigationStateCaptured = YES;
    }
    self.navigationItem.hidesBackButton = YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setBoolValue:YES forRecorderKey:@"setupNavigationBarHidden"];
    UIView *gkNavigationBar = self.originGKNavigationBar ?: [self recorderGKNavigationBar];
    gkNavigationBar.hidden = YES;
    gkNavigationBar.alpha = 0;
}

-(void)restoreHostNavigationBarIfNeeded:(BOOL)animated{
    if (!self.navigationStateCaptured) return;
    self.navigationItem.hidesBackButton = self.originHidesBackButton;
    [self.navigationController setNavigationBarHidden:self.originNavigationBarHidden animated:animated];
    [self setBoolValue:self.originSetupNavigationBarHidden forRecorderKey:@"setupNavigationBarHidden"];
    self.originGKNavigationBar.hidden = self.originGKNavigationBarHidden;
    self.originGKNavigationBar.alpha = self.originGKNavigationBarAlpha;
    self.navigationStateCaptured = NO;
}

-(UIView *)recorderGKNavigationBar{
    @try {
        id navigationBar = [self valueForKey:@"gk_navigationBar"];
        if ([navigationBar isKindOfClass:UIView.class]) return navigationBar;
    } @catch (__unused NSException *exception) {
    };return nil;
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
            btn.layer.cornerRadius = JobsWidth(18);
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
                .byText(@"长按录制视频".tr)
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightMediumSize(17))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1);
        });
        UIView *rightControl = self.canSwitchCamera ? self.switchCameraBtn : self.filterBtn;
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
            btn.jobsResetBtnTitle(@"切换".tr)
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.25));
            btn.layer.cornerRadius = JobsWidth(18);
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
            btn.jobsResetBtnTitle(@"滤镜".tr)
               .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
               .jobsResetBtnTitleCor(UIColor.whiteColor)
               .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.25));
            btn.layer.cornerRadius = JobsWidth(18);
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
        _recordBtn = JobsOCVideoRecorderRecordButton.new;
        _recordBtn.delegate = self;
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
            label.byText(@"0.0秒".tr)
                 .byFont(UIFontWeightSemiboldSize(16))
                 .byTextCor(UIColor.whiteColor)
                 .byTextAlignment(NSTextAlignmentCenter)
                 .byBgColor(UIColor.blackColor.colorWithAlphaComponentBy(0.35));
            label.layer.cornerRadius = JobsWidth(14);
            label.layer.masksToBounds = YES;
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
                                                                 mirrorFrontPreview:self.config.mirrorsFrontCameraPreview];
        _captureManager.delegate = self;
    };return _captureManager;
}

@end
