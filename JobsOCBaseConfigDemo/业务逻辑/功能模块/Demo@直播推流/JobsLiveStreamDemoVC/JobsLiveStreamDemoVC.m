//
//  JobsLiveStreamDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsLiveStreamDemoVC.h"

static NSString *const JobsLiveStreamDemoRTMPURI = @"rtmp://192.168.65.91:1935/live";
static NSString *const JobsLiveStreamDemoStreamName = @"jobs_test";

@interface JobsLiveStreamDemoVC ()

Prop_strong()AVCaptureSession *captureSession;
Prop_strong()AVCaptureVideoPreviewLayer *previewLayer;
Prop_strong()AVCaptureDeviceInput *videoInput;
Prop_strong()UIView *previewContainerView;
Prop_strong()UILabel *statusLabel;
Prop_strong()UIButton *streamButton;
Prop_strong()UIButton *switchCameraButton;
Prop_assign()BOOL streaming;
Prop_assign()AVCaptureDevicePosition currentPosition;

-(jobsByVoidBlock _Nonnull)setupCaptureIfNeeded;
-(jobsByVoidBlock _Nonnull)requestMediaAuthorization;
-(jobsByVoidBlock _Nonnull)startCaptureSessionIfNeeded;
-(jobsByVoidBlock _Nonnull)stopCaptureSessionIfNeeded;
-(jobsByVoidBlock _Nonnull)toggleStreaming;
-(jobsByVoidBlock _Nonnull)switchCamera;
-(JobsRetAVCaptureDeviceByAVCaptureDevicePositionBlock _Nonnull)cameraDeviceByPosition;
-(jobsByStrBlock _Nonnull)updateStatusText;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsLiveStreamDemoVC
@interface JobsLiveStreamDemoVC (JobsPropertyDSLSetterAutogen_1869edee82)
-(void)setCurrentPosition:(AVCaptureDevicePosition)data;
-(void)setStreaming:(BOOL)data;
-(void)setVideoInput:(AVCaptureDeviceInput * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsLiveStreamDemoVC

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN AVCaptureSession
@interface AVCaptureSession (JobsLocalPropertyDSLAutogen_1869edee82)
-(JobsRetAVCaptureSessionByNSStringBlock _Nonnull)bySessionPreset;
-(void)setSessionPreset:(NSString * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END AVCaptureSession

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN AVCaptureVideoPreviewLayer
@interface AVCaptureVideoPreviewLayer (JobsLocalPropertyDSLAutogen_1869edee82)
-(JobsRetAVCaptureVideoPreviewLayerByAVLayerVideoGravityBlock _Nonnull)byVideoGravity;
-(void)setVideoGravity:(AVLayerVideoGravity)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END AVCaptureVideoPreviewLayer

@implementation JobsLiveStreamDemoVC
-(void)dealloc{
    JobsRemoveNotification(self);
    self.stopCaptureSessionIfNeeded();
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveStreamDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"直播推流".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(UIColor.blackColor)
            .byNavBgCor(UIColor.blackColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveStreamDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        JobsAddNotification(self,
                            @selector(jobs_applicationDidEnterBackground:),
                            UIApplicationDidEnterBackgroundNotification,
                            nil);
        JobsAddNotification(self,
                            @selector(jobs_applicationDidBecomeActive:),
                            UIApplicationDidBecomeActiveNotification,
                            nil);
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.byCurrentPosition(AVCaptureDevicePositionBack);
        self.previewContainerView.byAlpha(1);
        self.statusLabel.byAlpha(1);
        self.streamButton.byAlpha(1);
        self.switchCameraButton.byAlpha(1);
        self.requestMediaAuthorization();
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveStreamDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        self.previewLayer.byFrame(self.previewContainerView.bounds);
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveStreamDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.byStreaming(NO);
        self.streamButton.bySelected(NO);
        self.stopCaptureSessionIfNeeded();
    };
}

-(void)jobs_applicationDidEnterBackground:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveStreamDemoVC.class, @selector(jobsJobs_applicationDidEnterBackground)))(self, @selector(jobsJobs_applicationDidEnterBackground));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_applicationDidEnterBackground{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        (void)notification;
        self.byStreaming(NO);
        self.streamButton.bySelected(NO);
        self.stopCaptureSessionIfNeeded();
        self.updateStatusText(@"已进入后台，采集已停止。".jobsTr());
    };
}

-(void)jobs_applicationDidBecomeActive:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveStreamDemoVC.class, @selector(jobsJobs_applicationDidBecomeActive)))(self, @selector(jobsJobs_applicationDidBecomeActive));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_applicationDidBecomeActive{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        (void)notification;
        if (!self.viewIfLoaded.window || !self.captureSession.inputs.count) return;
        self.startCaptureSessionIfNeeded();
        self.updateStatusText(@"采集已恢复，点击开始推流。".jobsTr());
    };
}
#pragma mark —— Capture
-(jobsByVoidBlock _Nonnull)requestMediaAuthorization{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        AVAuthorizationStatus videoStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        AVAuthorizationStatus audioStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
        if (videoStatus == AVAuthorizationStatusDenied || audioStatus == AVAuthorizationStatusDenied) {
            self.updateStatusText(@"摄像头或麦克风权限被拒绝，请到系统设置开启。".jobsTr());
            return;
        }
        dispatch_group_t group = dispatch_group_create();
        if (videoStatus == AVAuthorizationStatusNotDetermined) {
            dispatch_group_enter(group);
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(__unused BOOL granted) {
                dispatch_group_leave(group);
            }];
        }
        if (audioStatus == AVAuthorizationStatusNotDetermined) {
            dispatch_group_enter(group);
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(__unused BOOL granted) {
                dispatch_group_leave(group);
            }];
        }
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            self.setupCaptureIfNeeded();
            self.startCaptureSessionIfNeeded();
        });
    };
}

-(jobsByVoidBlock _Nonnull)setupCaptureIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.captureSession.inputs.count) return;
        self.captureSession.bySessionPreset(AVCaptureSessionPresetHigh);
        NSError *videoError = nil;
        AVCaptureDevice *videoDevice = self.cameraDeviceByPosition(self.currentPosition);
        if (!videoDevice) {
            self.updateStatusText(@"未检测到可用摄像头，模拟器请切到真机查看采集预览。".jobsTr());
            return;
        }
        AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice
                                                                                 error:&videoError];
        if (!videoInput || videoError) {
            self.updateStatusText([NSString stringWithFormat:@"摄像头初始化失败：%@", videoError.localizedDescription ?: @"未知错误"]);
            return;
        }
        if ([self.captureSession canAddInput:videoInput]) {
            [self.captureSession addInput:videoInput];
            self.byVideoInput(videoInput);
        }
        NSError *audioError = nil;
        AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
        if (audioDevice) {
            AVCaptureDeviceInput *audioInput = [AVCaptureDeviceInput deviceInputWithDevice:audioDevice
                                                                                     error:&audioError];
            if (audioInput && [self.captureSession canAddInput:audioInput]) {
                [self.captureSession addInput:audioInput];
            }
        }
        if (!self.previewLayer.superlayer) {
            [self.previewContainerView.layer insertSublayer:self.previewLayer
                                                    atIndex:0];
        }
        self.updateStatusText(@"采集已就绪，点击开始推流。".jobsTr());
    };
}

-(jobsByVoidBlock _Nonnull)startCaptureSessionIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.captureSession.isRunning) return;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            [self.captureSession startRunning];
        });
    };
}

-(jobsByVoidBlock _Nonnull)stopCaptureSessionIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.captureSession.isRunning) return;
        [self.captureSession stopRunning];
    };
}

-(JobsRetAVCaptureDeviceByAVCaptureDevicePositionBlock _Nonnull)cameraDeviceByPosition{
    @jobs_weakify(self)
    return ^AVCaptureDevice *(AVCaptureDevicePosition position){
        @jobs_strongify(self)
        if (!self) return nil;
        NSArray <AVCaptureDevice *>*devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
        for (AVCaptureDevice *device in devices) {
            if (device.position == position) return device;
        };return [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    };
}
#pragma mark —— Action
-(jobsByVoidBlock _Nonnull)toggleStreaming{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byStreaming(!self.streaming);
        self.streamButton.bySelected(self.streaming);
        if (self.streaming) {
            self.startCaptureSessionIfNeeded();
            NSString *url = [NSString stringWithFormat:@"%@/%@", JobsLiveStreamDemoRTMPURI, JobsLiveStreamDemoStreamName];
            self.updateStatusText([NSString stringWithFormat:@"推流采集中：%@\nRTMP publish 由服务端 SDK 接入。", url]);
        }else{
            self.updateStatusText(@"已停止推流采集。".jobsTr());
        }
    };
}

-(jobsByVoidBlock _Nonnull)switchCamera{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        AVCaptureDevicePosition targetPosition = self.currentPosition == AVCaptureDevicePositionBack ? AVCaptureDevicePositionFront : AVCaptureDevicePositionBack;
        AVCaptureDevice *device = self.cameraDeviceByPosition(targetPosition);
        if (!device) {
            self.updateStatusText(@"未检测到可切换摄像头".jobsTr());
            return;
        }
        NSError *error = nil;
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                                            error:&error];
        if (!input || error) {
            self.updateStatusText([NSString stringWithFormat:@"切换摄像头失败：%@", error.localizedDescription ?: @"未知错误"]);
            return;
        }
        [self.captureSession beginConfiguration];
        if (self.videoInput) [self.captureSession removeInput:self.videoInput];
        if ([self.captureSession canAddInput:input]) {
            [self.captureSession addInput:input];
            self.byVideoInput(input);
            self.byCurrentPosition(targetPosition);
        }
        [self.captureSession commitConfiguration];
        self.updateStatusText(self.currentPosition == AVCaptureDevicePositionBack ? @"已切换到后置摄像头".jobsTr() : @"已切换到前置摄像头".jobsTr());
    };
}

-(jobsByStrBlock _Nonnull)updateStatusText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        self.statusLabel.byText(text);
    };
}
#pragma mark —— LazyLoad
-(UIView *)previewContainerView{
    if (!_previewContainerView) {
        _previewContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.blackColor)
                .addOn(self.view);
        });
        [_previewContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    };return _previewContainerView;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"准备就绪".jobsTr())
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightRegularSize(14))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.view);
        });
        [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.bottom.equalTo(self.streamButton.mas_top).offset(-JobsWidth(12));
        }];
    };return _statusLabel;
}

-(UIButton *)streamButton{
    if (!_streamButton) {
        @jobs_weakify(self)
        _streamButton = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn
                .jobsResetBtnTitle(@"开始推流".jobsTr())
                .selectedStateTitleBy(@"停止推流".jobsTr())
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(16))
                .jobsResetBtnBgCor(UIColor.systemRedColor)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.toggleStreaming();
                })
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(8))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view);
        });
        [_streamButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(24));
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(32));
            make.height.mas_equalTo(JobsWidth(44));
        }];
    };return _streamButton;
}

-(UIButton *)switchCameraButton{
    if (!_switchCameraButton) {
        @jobs_weakify(self)
        _switchCameraButton = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn
                .jobsResetBtnTitle(@"↻")
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(24))
                .jobsResetBtnBgCor([UIColor.blackColor colorWithAlphaComponent:0.45])
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.switchCamera();
                })
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(20))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view);
        });
        [_switchCameraButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(16));
            make.right.equalTo(self.view).offset(-JobsWidth(20));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(40), JobsWidth(40)));
        }];
    };return _switchCameraButton;
}

-(AVCaptureSession *)captureSession{
    if (!_captureSession) {
        _captureSession = AVCaptureSession.new;
    };return _captureSession;
}

-(AVCaptureVideoPreviewLayer *)previewLayer{
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
        _previewLayer.byVideoGravity(AVLayerVideoGravityResizeAspectFill);
    };return _previewLayer;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsLiveStreamDemoVC
-(JobsRetJobsLiveStreamDemoVCByAVCaptureDeviceInputBlock _Nonnull)byVideoInput{
    @jobs_weakify(self)
    return ^__kindof JobsLiveStreamDemoVC * _Nullable(AVCaptureDeviceInput * _Nullable data){
        @jobs_strongify(self)
        [self setVideoInput:data];
        return self;
    };
}

-(JobsRetJobsLiveStreamDemoVCByAVCaptureDevicePositionBlock _Nonnull)byCurrentPosition{
    @jobs_weakify(self)
    return ^__kindof JobsLiveStreamDemoVC * _Nullable(AVCaptureDevicePosition data){
        @jobs_strongify(self)
        [self setCurrentPosition:data];
        return self;
    };
}

-(JobsRetJobsLiveStreamDemoVCByBOOLBlock _Nonnull)byStreaming{
    @jobs_weakify(self)
    return ^__kindof JobsLiveStreamDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setStreaming:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsLiveStreamDemoVC
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN AVCaptureSession
@implementation AVCaptureSession (JobsLocalPropertyDSLAutogen_1869edee82)
-(JobsRetAVCaptureSessionByNSStringBlock _Nonnull)bySessionPreset{
    @jobs_weakify(self)
    return ^__kindof AVCaptureSession * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setSessionPreset:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END AVCaptureSession

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN AVCaptureVideoPreviewLayer
@implementation AVCaptureVideoPreviewLayer (JobsLocalPropertyDSLAutogen_1869edee82)
-(JobsRetAVCaptureVideoPreviewLayerByAVLayerVideoGravityBlock _Nonnull)byVideoGravity{
    @jobs_weakify(self)
    return ^__kindof AVCaptureVideoPreviewLayer * _Nullable(AVLayerVideoGravity data){
        @jobs_strongify(self)
        [self setVideoGravity:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END AVCaptureVideoPreviewLayer
