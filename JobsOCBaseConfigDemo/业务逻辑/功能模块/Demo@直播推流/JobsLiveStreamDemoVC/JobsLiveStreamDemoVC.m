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

-(void)setupCaptureIfNeeded;
-(void)requestMediaAuthorization;
-(void)startCaptureSessionIfNeeded;
-(void)stopCaptureSessionIfNeeded;
-(void)toggleStreaming;
-(void)switchCamera;
-(AVCaptureDevice *)cameraDeviceByPosition:(AVCaptureDevicePosition)position;
-(void)updateStatusText:(NSString *)text;

@end

@implementation JobsLiveStreamDemoVC
-(void)dealloc{
    JobsRemoveNotification(self);
    [self stopCaptureSessionIfNeeded];
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"直播推流".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(UIColor.blackColor)
        .byNavBgCor(UIColor.blackColor);
}

-(void)viewDidLoad{
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
    self.view.backgroundColor = UIColor.blackColor;
    self.currentPosition = AVCaptureDevicePositionBack;
    self.previewContainerView.alpha = 1;
    self.statusLabel.alpha = 1;
    self.streamButton.alpha = 1;
    self.switchCameraButton.alpha = 1;
    [self requestMediaAuthorization];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.previewLayer.frame = self.previewContainerView.bounds;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.streaming = NO;
    self.streamButton.selected = NO;
    [self stopCaptureSessionIfNeeded];
}

-(void)jobs_applicationDidEnterBackground:(NSNotification *)notification{
    (void)notification;
    self.streaming = NO;
    self.streamButton.selected = NO;
    [self stopCaptureSessionIfNeeded];
    [self updateStatusText:@"已进入后台，采集已停止。".tr];
}

-(void)jobs_applicationDidBecomeActive:(NSNotification *)notification{
    (void)notification;
    if (!self.viewIfLoaded.window || !self.captureSession.inputs.count) return;
    [self startCaptureSessionIfNeeded];
    [self updateStatusText:@"采集已恢复，点击开始推流。".tr];
}
#pragma mark —— Capture
-(void)requestMediaAuthorization{
    AVAuthorizationStatus videoStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    AVAuthorizationStatus audioStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (videoStatus == AVAuthorizationStatusDenied || audioStatus == AVAuthorizationStatusDenied) {
        [self updateStatusText:@"摄像头或麦克风权限被拒绝，请到系统设置开启。".tr];
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
        [self setupCaptureIfNeeded];
        [self startCaptureSessionIfNeeded];
    });
}

-(void)setupCaptureIfNeeded{
    if (self.captureSession.inputs.count) return;
    self.captureSession.sessionPreset = AVCaptureSessionPresetHigh;
    NSError *videoError = nil;
    AVCaptureDevice *videoDevice = [self cameraDeviceByPosition:self.currentPosition];
    if (!videoDevice) {
        [self updateStatusText:@"未检测到可用摄像头，模拟器请切到真机查看采集预览。".tr];
        return;
    }
    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice
                                                                             error:&videoError];
    if (!videoInput || videoError) {
        [self updateStatusText:[NSString stringWithFormat:@"摄像头初始化失败：%@", videoError.localizedDescription ?: @"未知错误"]];
        return;
    }
    if ([self.captureSession canAddInput:videoInput]) {
        [self.captureSession addInput:videoInput];
        self.videoInput = videoInput;
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
    [self updateStatusText:@"采集已就绪，点击开始推流。".tr];
}

-(void)startCaptureSessionIfNeeded{
    if (self.captureSession.isRunning) return;
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self.captureSession startRunning];
    });
}

-(void)stopCaptureSessionIfNeeded{
    if (!self.captureSession.isRunning) return;
    [self.captureSession stopRunning];
}

-(AVCaptureDevice *)cameraDeviceByPosition:(AVCaptureDevicePosition)position{
    NSArray <AVCaptureDevice *>*devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if (device.position == position) return device;
    };return [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
}
#pragma mark —— Action
-(void)toggleStreaming{
    self.streaming = !self.streaming;
    self.streamButton.selected = self.streaming;
    if (self.streaming) {
        [self startCaptureSessionIfNeeded];
        NSString *url = [NSString stringWithFormat:@"%@/%@", JobsLiveStreamDemoRTMPURI, JobsLiveStreamDemoStreamName];
        [self updateStatusText:[NSString stringWithFormat:@"推流采集中：%@\nRTMP publish 由服务端 SDK 接入。", url]];
    }else{
        [self updateStatusText:@"已停止推流采集。".tr];
    }
}

-(void)switchCamera{
    AVCaptureDevicePosition targetPosition = self.currentPosition == AVCaptureDevicePositionBack ? AVCaptureDevicePositionFront : AVCaptureDevicePositionBack;
    AVCaptureDevice *device = [self cameraDeviceByPosition:targetPosition];
    if (!device) {
        [self updateStatusText:@"未检测到可切换摄像头".tr];
        return;
    }
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                                        error:&error];
    if (!input || error) {
        [self updateStatusText:[NSString stringWithFormat:@"切换摄像头失败：%@", error.localizedDescription ?: @"未知错误"]];
        return;
    }
    [self.captureSession beginConfiguration];
    if (self.videoInput) [self.captureSession removeInput:self.videoInput];
    if ([self.captureSession canAddInput:input]) {
        [self.captureSession addInput:input];
        self.videoInput = input;
        self.currentPosition = targetPosition;
    }
    [self.captureSession commitConfiguration];
    [self updateStatusText:self.currentPosition == AVCaptureDevicePositionBack ? @"已切换到后置摄像头".tr : @"已切换到前置摄像头".tr];
}

-(void)updateStatusText:(NSString *)text{
    self.statusLabel.text = text;
}
#pragma mark —— LazyLoad
-(UIView *)previewContainerView{
    if (!_previewContainerView) {
        _previewContainerView = UIView.new;
        _previewContainerView.backgroundColor = UIColor.blackColor;
        [self.view addSubview:_previewContainerView];
        [_previewContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    };return _previewContainerView;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = UILabel.new;
        _statusLabel.textColor = UIColor.whiteColor;
        _statusLabel.font = UIFontWeightRegularSize(14);
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.numberOfLines = 0;
        _statusLabel.text = @"准备就绪".tr;
        [self.view addSubview:_statusLabel];
        [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.bottom.equalTo(self.streamButton.mas_top).offset(-JobsWidth(12));
        }];
    };return _statusLabel;
}

-(UIButton *)streamButton{
    if (!_streamButton) {
        _streamButton = UIButton.new;
        _streamButton.backgroundColor = UIColor.systemRedColor;
        _streamButton.layer.cornerRadius = JobsWidth(8);
        _streamButton.layer.masksToBounds = YES;
        [_streamButton setTitle:@"开始推流".tr
                       forState:UIControlStateNormal];
        [_streamButton setTitle:@"停止推流".tr
                       forState:UIControlStateSelected];
        [_streamButton setTitleColor:UIColor.whiteColor
                             forState:UIControlStateNormal];
        _streamButton.titleLabel.font = UIFontWeightMediumSize(16);
        [_streamButton addTarget:self
                          action:@selector(toggleStreaming)
                forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_streamButton];
        [_streamButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(24));
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(32));
            make.height.mas_equalTo(JobsWidth(44));
        }];
    };return _streamButton;
}

-(UIButton *)switchCameraButton{
    if (!_switchCameraButton) {
        _switchCameraButton = UIButton.new;
        _switchCameraButton.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.45];
        _switchCameraButton.layer.cornerRadius = JobsWidth(20);
        _switchCameraButton.layer.masksToBounds = YES;
        [_switchCameraButton setTitle:@"↻"
                             forState:UIControlStateNormal];
        [_switchCameraButton setTitleColor:UIColor.whiteColor
                                  forState:UIControlStateNormal];
        _switchCameraButton.titleLabel.font = UIFontWeightMediumSize(24);
        [_switchCameraButton addTarget:self
                                action:@selector(switchCamera)
                      forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_switchCameraButton];
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
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    };return _previewLayer;
}

@end
