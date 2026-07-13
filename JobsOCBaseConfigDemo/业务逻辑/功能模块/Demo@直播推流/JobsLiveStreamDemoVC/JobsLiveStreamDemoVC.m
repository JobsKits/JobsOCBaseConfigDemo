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
    self.makeNavByAlpha(1);
    self.view.byBgColor(UIColor.blackColor);
    self.currentPosition = AVCaptureDevicePositionBack;
    self.previewContainerView.byAlpha(1);
    self.statusLabel.byAlpha(1);
    self.streamButton.byAlpha(1);
    self.switchCameraButton.byAlpha(1);
    [self requestMediaAuthorization];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.previewLayer.byFrame(self.previewContainerView.bounds);
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.streaming = NO;
    [self stopCaptureSessionIfNeeded];
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
    self.streamButton.bySelected(self.streaming);
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
    self.statusLabel.byText(text);
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
                .byText(@"准备就绪".tr)
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
        _streamButton = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn
                .jobsResetBtnTitle(@"开始推流".tr)
                .selectedStateTitleBy(@"停止推流".tr)
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(16))
                .jobsResetBtnBgCor(UIColor.systemRedColor)
                .byAddTarget(self, @selector(toggleStreaming), UIControlEventTouchUpInside)
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
        _switchCameraButton = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn
                .jobsResetBtnTitle(@"↻")
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(24))
                .jobsResetBtnBgCor([UIColor.blackColor colorWithAlphaComponent:0.45])
                .byAddTarget(self, @selector(switchCamera), UIControlEventTouchUpInside)
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
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    };return _previewLayer;
}

@end
