//
//  JobsOCVideoRecorderCaptureManager.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderCaptureManager.h"

@interface JobsOCVideoRecorderCaptureManager ()<
AVCaptureVideoDataOutputSampleBufferDelegate,
AVCaptureAudioDataOutputSampleBufferDelegate
>

Prop_strong() AVCaptureSession *session;
Prop_strong(nullable) AVCaptureDeviceInput *videoInput;
Prop_strong(nullable) AVCaptureDeviceInput *audioInput;
Prop_strong() AVCaptureVideoDataOutput *videoOutput;
Prop_strong() AVCaptureAudioDataOutput *audioOutput;
Prop_strong() AVCaptureVideoPreviewLayer *previewLayer;
Prop_strong() dispatch_queue_t sessionQueue;
Prop_strong() dispatch_queue_t sampleBufferQueue;
Prop_assign() AVCaptureDevicePosition currentPosition;
Prop_assign() BOOL mirrorFrontPreview;

@end

@implementation JobsOCVideoRecorderCaptureManager

+(BOOL)isCameraSwitchAvailable{
#if TARGET_OS_SIMULATOR
    return NO;
#else
    return YES;
#endif
}

-(instancetype)initWithPosition:(AVCaptureDevicePosition)position
             mirrorFrontPreview:(BOOL)mirrorFrontPreview{
    if (self = [super init]) {
#if TARGET_OS_SIMULATOR
        _currentPosition = position == AVCaptureDevicePositionUnspecified ? AVCaptureDevicePositionFront : position;
#else
        _currentPosition = position == AVCaptureDevicePositionUnspecified ? AVCaptureDevicePositionFront : position;
#endif
        _mirrorFrontPreview = mirrorFrontPreview;
        _sessionQueue = dispatch_queue_create("com.jobs.oc.video.recorder.session", DISPATCH_QUEUE_SERIAL);
        _sampleBufferQueue = dispatch_queue_create("com.jobs.oc.video.recorder.sampleBuffer", DISPATCH_QUEUE_SERIAL);
        _session = AVCaptureSession.new;
#if TARGET_OS_SIMULATOR
        _session.sessionPreset = [_session canSetSessionPreset:AVCaptureSessionPresetInputPriority] ? AVCaptureSessionPresetInputPriority : AVCaptureSessionPresetHigh;
#else
        _session.sessionPreset = AVCaptureSessionPresetHigh;
#endif
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    };return self;
}

-(void)startRunning{
    dispatch_async(self.sessionQueue, ^{
        if (!self.videoInput && ![self configureSessionWithPosition:self.currentPosition]) return;
        if (!self.session.isRunning) [self.session startRunning];
        if (!self.session.isRunning) [self notifyError:[self errorWithCode:-12 description:[self cameraUnavailableDescription]]];
    });
}

-(void)stopRunning{
    dispatch_async(self.sessionQueue, ^{
        if (self.session.isRunning) [self.session stopRunning];
    });
}

-(void)switchCameraWithCompletion:(void(^)(BOOL success, NSError *error))completion{
    if (![JobsOCVideoRecorderCaptureManager isCameraSwitchAvailable]) {
        NSError *error = [self errorWithCode:-21 description:@"当前环境不支持切换摄像头"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(NO, error);
        });
        return;
    }
    AVCaptureDevicePosition targetPosition = self.currentPosition == AVCaptureDevicePositionFront ? AVCaptureDevicePositionBack : AVCaptureDevicePositionFront;
    dispatch_async(self.sessionQueue, ^{
        BOOL success = [self configureSessionWithPosition:targetPosition];
        NSError *error = success ? nil : [self errorWithCode:-20 description:@"切换摄像头失败"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) completion(success, error);
        });
    });
}

-(void)updatePreviewOrientation:(UIDeviceOrientation)deviceOrientation{
    AVCaptureConnection *connection = self.previewLayer.connection;
    if (!connection) return;
    if (connection.isVideoOrientationSupported) {
        connection.videoOrientation = [self captureVideoOrientationByDeviceOrientation:deviceOrientation];
    }
    if (connection.isVideoMirroringSupported) {
        connection.videoMirrored = self.mirrorFrontPreview && self.currentPosition == AVCaptureDevicePositionFront;
    }
}

-(BOOL)configureSessionWithPosition:(AVCaptureDevicePosition)position{
    NSArray<AVCaptureDevice *> *videoDevices = [self camerasWithPosition:position];
    if (!videoDevices.count) {
        [self notifyError:[self errorWithCode:-10 description:[self cameraUnavailableDescription]]];
        return NO;
    }
    [self.session beginConfiguration];
    AVCaptureDeviceInput *oldVideoInput = self.videoInput;
    if (oldVideoInput) {
        [self.session removeInput:oldVideoInput];
        self.videoInput = nil;
    }
    NSError *videoError = nil;
    AVCaptureDeviceInput *newVideoInput = nil;
    AVCaptureDevice *selectedVideoDevice = nil;
    for (AVCaptureDevice *videoDevice in videoDevices) {
        NSError *inputError = nil;
        AVCaptureDeviceInput *candidateInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&inputError];
        if (!candidateInput || inputError) {
            videoError = inputError ?: videoError;
            continue;
        }
        if ([self.session canAddInput:candidateInput]) {
            newVideoInput = candidateInput;
            selectedVideoDevice = videoDevice;
            break;
        }
        videoError = [self errorWithCode:-13 description:@"已找到摄像头，但无法加入采集会话"];
    }
    if (newVideoInput) {
        NSError *addVideoError = nil;
        if ([self addVideoInput:newVideoInput error:&addVideoError]) {
            self.videoInput = newVideoInput;
#if TARGET_OS_SIMULATOR
            self.currentPosition = selectedVideoDevice.position == AVCaptureDevicePositionUnspecified ? AVCaptureDevicePositionFront : selectedVideoDevice.position;
#else
            self.currentPosition = position;
#endif
        }else{
            videoError = addVideoError ?: videoError;
            if (oldVideoInput && [self.session canAddInput:oldVideoInput]) {
                NSError *restoreError = nil;
                if ([self addVideoInput:oldVideoInput error:&restoreError]) {
                    self.videoInput = oldVideoInput;
                }else{
                    videoError = videoError ?: restoreError;
                }
            }
            [self.session commitConfiguration];
            [self notifyError:videoError ?: [self errorWithCode:-13 description:[self cameraUnavailableDescription]]];
            return NO;
        }
    }else{
        if (oldVideoInput && [self.session canAddInput:oldVideoInput]) {
            NSError *restoreError = nil;
            if ([self addVideoInput:oldVideoInput error:&restoreError]) {
                self.videoInput = oldVideoInput;
            }else{
                videoError = videoError ?: restoreError;
            }
        }
        [self.session commitConfiguration];
        [self notifyError:videoError ?: [self errorWithCode:-13 description:[self cameraUnavailableDescription]]];
        return NO;
    }

    if (!self.audioInput) {
        NSError *audioError = nil;
        AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
        AVCaptureDeviceInput *newAudioInput = audioDevice ? [AVCaptureDeviceInput deviceInputWithDevice:audioDevice error:&audioError] : nil;
        if (newAudioInput && [self.session canAddInput:newAudioInput]) {
            NSError *addAudioError = nil;
            if ([self addSessionInput:newAudioInput error:&addAudioError]) {
                self.audioInput = newAudioInput;
            }else{
                [self notifyError:addAudioError ?: [self errorWithCode:-11 description:@"麦克风不可用"]];
            }
        }else{
            [self notifyError:audioError ?: [self errorWithCode:-11 description:@"麦克风不可用"]];
        }
    }

    if (!self.videoOutput) {
        self.videoOutput = AVCaptureVideoDataOutput.new;
        self.videoOutput.alwaysDiscardsLateVideoFrames = NO;
        self.videoOutput.videoSettings = @{
            (NSString *)kCVPixelBufferPixelFormatTypeKey: @(kCVPixelFormatType_32BGRA)
        };
        [self.videoOutput setSampleBufferDelegate:self queue:self.sampleBufferQueue];
        if ([self.session canAddOutput:self.videoOutput]) [self.session addOutput:self.videoOutput];
    }

    if (!self.audioOutput) {
        self.audioOutput = AVCaptureAudioDataOutput.new;
        [self.audioOutput setSampleBufferDelegate:self queue:self.sampleBufferQueue];
        if ([self.session canAddOutput:self.audioOutput]) [self.session addOutput:self.audioOutput];
    }
    [self.session commitConfiguration];
    [self updatePreviewOrientation:UIDevice.currentDevice.orientation];
    return YES;
}

-(BOOL)addVideoInput:(AVCaptureDeviceInput *)input
               error:(NSError **)error{
    AVCaptureDevice *device = input.device;
    if (!device) {
        if (error) *error = [self errorWithCode:-14 description:@"摄像头设备无效"];
        return NO;
    }
    NSError *lockError = nil;
    if (![device lockForConfiguration:&lockError]) {
        if (error) *error = lockError ?: [self errorWithCode:-14 description:@"摄像头配置锁定失败"];
        return NO;
    }
    BOOL success = [self addSessionInput:input error:error];
    [device unlockForConfiguration];
    return success;
}

-(BOOL)addSessionInput:(AVCaptureInput *)input
                 error:(NSError **)error{
    @try {
        [self.session addInput:input];
        return YES;
    } @catch (NSException *exception) {
        if (error) *error = [self errorWithCode:-14 description:exception.reason ?: @"采集输入加入会话失败"];
        return NO;
    }
}

-(NSArray<AVCaptureDevice *> *)camerasWithPosition:(AVCaptureDevicePosition)position{
#if TARGET_OS_SIMULATOR
    return [self simulatorVideoDevicesWithPosition:position];
#else
    AVCaptureDeviceDiscoverySession *discoverySession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[
        AVCaptureDeviceTypeBuiltInWideAngleCamera
    ]
                                                                                                              mediaType:AVMediaTypeVideo
                                                                                                               position:position];
    return discoverySession.devices;
#endif
}

#if TARGET_OS_SIMULATOR
-(NSArray<AVCaptureDevice *> *)simulatorVideoDevicesWithPosition:(AVCaptureDevicePosition)position{
    NSMutableArray<AVCaptureDevice *> *videoDevices = NSMutableArray.array;
    NSMutableSet<NSString *> *deviceUniqueIDs = NSMutableSet.set;
    void (^addDevice)(AVCaptureDevice *) = ^(AVCaptureDevice *device) {
        if (![self isUsableVideoDevice:device]) return;
        NSString *uniqueID = device.uniqueID.length ? device.uniqueID : device.localizedName;
        if (!uniqueID.length) uniqueID = [NSString stringWithFormat:@"%p", device];
        if ([deviceUniqueIDs containsObject:uniqueID]) return;
        [deviceUniqueIDs addObject:uniqueID];
        [videoDevices addObject:device];
    };
    if (@available(iOS 17.0, *)) {
        addDevice(AVCaptureDevice.systemPreferredCamera);
    }
    NSMutableArray<AVCaptureDeviceType> *deviceTypes = NSMutableArray.array;
    if (@available(iOS 17.0, *)) {
        [deviceTypes addObject:AVCaptureDeviceTypeExternal];
        [deviceTypes addObject:AVCaptureDeviceTypeContinuityCamera];
    }
    [deviceTypes addObject:AVCaptureDeviceTypeBuiltInWideAngleCamera];
    NSMutableArray<NSNumber *> *positions = NSMutableArray.array;
    void (^addPosition)(AVCaptureDevicePosition) = ^(AVCaptureDevicePosition value) {
        if (![positions containsObject:@(value)]) [positions addObject:@(value)];
    };
    addPosition(position);
    addPosition(AVCaptureDevicePositionFront);
    addPosition(AVCaptureDevicePositionUnspecified);
    for (NSNumber *positionValue in positions) {
        AVCaptureDeviceDiscoverySession *discoverySession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:deviceTypes
                                                                                                                    mediaType:AVMediaTypeVideo
                                                                                                                     position:positionValue.integerValue];
        for (AVCaptureDevice *device in discoverySession.devices) {
            addDevice(device);
        }
    }
    addDevice([AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo]);
    return videoDevices;
}

-(BOOL)isUsableVideoDevice:(AVCaptureDevice *)device{
    return device && [device hasMediaType:AVMediaTypeVideo];
}
#endif

-(NSString *)cameraUnavailableDescription{
#if TARGET_OS_SIMULATOR
    return @"模拟器没有拿到 Mac 摄像头，请在 Simulator 的相机菜单选择 Mac 摄像头，并检查 macOS 相机权限";
#else
    return @"摄像头不可用";
#endif
}

-(void)captureOutput:(AVCaptureOutput *)output
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
      fromConnection:(AVCaptureConnection *)connection{
    if (output == self.videoOutput) {
        if ([self.delegate respondsToSelector:@selector(captureManager:didOutputVideoSampleBuffer:)]) {
            [self.delegate captureManager:self didOutputVideoSampleBuffer:sampleBuffer];
        }
    }else if (output == self.audioOutput){
        if ([self.delegate respondsToSelector:@selector(captureManager:didOutputAudioSampleBuffer:)]) {
            [self.delegate captureManager:self didOutputAudioSampleBuffer:sampleBuffer];
        }
    }
}

-(AVCaptureVideoOrientation)captureVideoOrientationByDeviceOrientation:(UIDeviceOrientation)deviceOrientation{
    switch (deviceOrientation) {
        case UIDeviceOrientationLandscapeLeft:
            return AVCaptureVideoOrientationLandscapeRight;
        case UIDeviceOrientationLandscapeRight:
            return AVCaptureVideoOrientationLandscapeLeft;
        case UIDeviceOrientationPortraitUpsideDown:
            return AVCaptureVideoOrientationPortraitUpsideDown;
        case UIDeviceOrientationPortrait:
        default:
            return AVCaptureVideoOrientationPortrait;
    }
}

-(void)notifyError:(NSError *)error{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(captureManager:didFailWithError:)]) {
            [self.delegate captureManager:self didFailWithError:error];
        }
    });
}

-(NSError *)errorWithCode:(NSInteger)code
              description:(NSString *)description{
    return [NSError errorWithDomain:@"com.jobs.oc.video.recorder.capture"
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey: description ?: @"采集异常"}];
}

@end
