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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderCaptureManager
@interface JobsOCVideoRecorderCaptureManager (JobsPropertyDSLSetterAutogen_70b822955c)
-(void)setAudioInput:(AVCaptureDeviceInput * _Nullable)data;
-(void)setAudioOutput:(AVCaptureAudioDataOutput * _Nullable)data;
-(void)setCurrentPosition:(AVCaptureDevicePosition)data;
-(void)setVideoInput:(AVCaptureDeviceInput * _Nullable)data;
-(void)setVideoOutput:(AVCaptureVideoDataOutput * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCVideoRecorderCaptureManager

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN AVCaptureConnection
@interface AVCaptureConnection (JobsLocalPropertyDSLAutogen_70b822955c)
-(JobsRetAVCaptureConnectionByAVCaptureVideoOrientationBlock _Nonnull)byVideoOrientation;
-(JobsRetAVCaptureConnectionByBOOLBlock _Nonnull)byVideoMirrored;
-(void)setVideoMirrored:(BOOL)data;
-(void)setVideoOrientation:(AVCaptureVideoOrientation)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END AVCaptureConnection

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN AVCaptureVideoDataOutput
@interface AVCaptureVideoDataOutput (JobsLocalPropertyDSLAutogen_70b822955c)
-(JobsRetAVCaptureVideoDataOutputByBOOLBlock _Nonnull)byAlwaysDiscardsLateVideoFrames;
-(void)setAlwaysDiscardsLateVideoFrames:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END AVCaptureVideoDataOutput

@implementation JobsOCVideoRecorderCaptureManager
-(JobsRetJobsOCVideoRecorderCaptureManagerByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderCaptureManager *_Nullable(id<JobsOCVideoRecorderCaptureManagerDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
+(JobsRetBOOLByVoidBlock _Nonnull)isCameraSwitchAvailable{
    return ^BOOL{
    #if TARGET_OS_SIMULATOR
        return NO;
    #else
        AVCaptureDeviceDiscoverySession *frontSession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[
            AVCaptureDeviceTypeBuiltInWideAngleCamera
        ]
                                                                                                                   mediaType:AVMediaTypeVideo
                                                                                                                    position:AVCaptureDevicePositionFront];
        AVCaptureDeviceDiscoverySession *backSession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[
            AVCaptureDeviceTypeBuiltInWideAngleCamera
        ]
                                                                                                                  mediaType:AVMediaTypeVideo
                                                                                                                   position:AVCaptureDevicePositionBack];
        return frontSession.devices.count && backSession.devices.count;
    #endif
    };
}

-(instancetype)initWithPosition:(AVCaptureDevicePosition)position
             mirrorFrontPreview:(BOOL)mirrorFrontPreview{
    if (self = [super init]) {
        _currentPosition = position == AVCaptureDevicePositionUnspecified ? AVCaptureDevicePositionFront : position;
        _mirrorFrontPreview = mirrorFrontPreview;
        _sessionQueue = dispatch_queue_create("com.jobs.oc.video.recorder.session", DISPATCH_QUEUE_SERIAL);
        _sampleBufferQueue = dispatch_queue_create("com.jobs.oc.video.recorder.sampleBuffer", DISPATCH_QUEUE_SERIAL);
        _session = AVCaptureSession.new;
        if ([_session canSetSessionPreset:AVCaptureSessionPresetHigh]) {
            _session.sessionPreset = AVCaptureSessionPresetHigh;
        }
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    };return self;
}

-(jobsByVoidBlock _Nonnull)startRunning{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    #if TARGET_OS_SIMULATOR
        self.notifyError([self errorWithCode:-10 description:self.cameraUnavailableDescription()]);
    #else
        dispatch_async(self.sessionQueue, ^{
            if (!self.videoInput && !self.configureSessionWithPosition(self.currentPosition)) return;
            if (!self.session.isRunning) [self.session startRunning];
            if (!self.session.isRunning) self.notifyError([self errorWithCode:-12 description:self.cameraUnavailableDescription()]);
        });
    #endif
    };
}

-(jobsByVoidBlock _Nonnull)stopRunning{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        dispatch_async(self.sessionQueue, ^{
            if (self.session.isRunning) self.session.stopRunning;
        });
    };
}

-(jobsByvoidBOOLNSErrorBlock _Nonnull)switchCameraWithCompletion{
    @jobs_weakify(self)
    return ^(void(^completion)(BOOL success, NSError *error)){
        @jobs_strongify(self)
        if (!self) return;
        if (!JobsOCVideoRecorderCaptureManager.isCameraSwitchAvailable()) {
            NSError *error = [self errorWithCode:-21 description:@"当前环境不支持切换摄像头"];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) completion(NO, error);
            });
            return;
        }
        AVCaptureDevicePosition targetPosition = self.currentPosition == AVCaptureDevicePositionFront ? AVCaptureDevicePositionBack : AVCaptureDevicePositionFront;
        dispatch_async(self.sessionQueue, ^{
            BOOL success = self.configureSessionWithPosition(targetPosition);
            NSError *error = success ? nil : [self errorWithCode:-20 description:@"切换摄像头失败"];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) completion(success, error);
            });
        });
    };
}

-(jobsByUIDeviceOrientationBlock _Nonnull)updatePreviewOrientation{
    @jobs_weakify(self)
    return ^(UIDeviceOrientation deviceOrientation){
        @jobs_strongify(self)
        if (!self) return;
        AVCaptureConnection *connection = self.previewLayer.connection;
        if (!connection) return;
        if (connection.isVideoOrientationSupported) {
            connection.byVideoOrientation(self.captureVideoOrientationByDeviceOrientation(deviceOrientation));
        }
        if (connection.isVideoMirroringSupported) {
            connection.byVideoMirrored(self.mirrorFrontPreview && self.currentPosition == AVCaptureDevicePositionFront);
        }
    };
}

-(JobsRetBOOLByAVCaptureDevicePositionBlock _Nonnull)configureSessionWithPosition{
    @jobs_weakify(self)
    return ^BOOL(AVCaptureDevicePosition position){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSArray<AVCaptureDevice *> *videoDevices = self.camerasWithPosition(position);
        if (!videoDevices.count) {
            self.notifyError([self errorWithCode:-10 description:self.cameraUnavailableDescription()]);
            return NO;
        }
        [self.session beginConfiguration];
        AVCaptureDeviceInput *oldVideoInput = self.videoInput;
        if (oldVideoInput) {
            [self.session removeInput:oldVideoInput];
            self.byVideoInput(nil);
        }
        NSError *videoError = nil;
        AVCaptureDeviceInput *newVideoInput = nil;
        for (AVCaptureDevice *videoDevice in videoDevices) {
            NSError *inputError = nil;
            AVCaptureDeviceInput *candidateInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&inputError];
            if (!candidateInput || inputError) {
                videoError = inputError ?: videoError;
                continue;
            }
            if ([self.session canAddInput:candidateInput]) {
                newVideoInput = candidateInput;
                break;
            }
            videoError = [self errorWithCode:-13 description:@"已找到摄像头，但无法加入采集会话"];
        }
        if (newVideoInput) {
            NSError *addVideoError = nil;
            if ([self addVideoInput:newVideoInput error:&addVideoError]) {
                self.byVideoInput(newVideoInput);
                self.byCurrentPosition(position);
            }else{
                videoError = addVideoError ?: videoError;
                if (oldVideoInput && [self.session canAddInput:oldVideoInput]) {
                    NSError *restoreError = nil;
                    if ([self addVideoInput:oldVideoInput error:&restoreError]) {
                        self.byVideoInput(oldVideoInput);
                    }else{
                        videoError = videoError ?: restoreError;
                    }
                }
                [self.session commitConfiguration];
                self.notifyError(videoError ?: [self errorWithCode:-13 description:self.cameraUnavailableDescription()]);
                return NO;
            }
        }else{
            if (oldVideoInput && [self.session canAddInput:oldVideoInput]) {
                NSError *restoreError = nil;
                if ([self addVideoInput:oldVideoInput error:&restoreError]) {
                    self.byVideoInput(oldVideoInput);
                }else{
                    videoError = videoError ?: restoreError;
                }
            }
            [self.session commitConfiguration];
            self.notifyError(videoError ?: [self errorWithCode:-13 description:self.cameraUnavailableDescription()]);
            return NO;
        }
        if (!self.audioInput) {
            NSError *audioError = nil;
            AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
            AVCaptureDeviceInput *newAudioInput = audioDevice ? [AVCaptureDeviceInput deviceInputWithDevice:audioDevice error:&audioError] : nil;
            if (newAudioInput && [self.session canAddInput:newAudioInput]) {
                NSError *addAudioError = nil;
                if ([self addSessionInput:newAudioInput error:&addAudioError]) {
                    self.byAudioInput(newAudioInput);
                }else{
                    self.notifyError(addAudioError ?: [self errorWithCode:-11 description:@"麦克风不可用"]);
                }
            }else{
                self.notifyError(audioError ?: [self errorWithCode:-11 description:@"麦克风不可用"]);
            }
        }
        if (!self.videoOutput) {
            self.byVideoOutput(AVCaptureVideoDataOutput.new);
            self.videoOutput.byAlwaysDiscardsLateVideoFrames(YES);
            self.videoOutput.videoSettings = @{
                (NSString *)kCVPixelBufferPixelFormatTypeKey: @(kCVPixelFormatType_32BGRA)
            };
            [self.videoOutput setSampleBufferDelegate:self queue:self.sampleBufferQueue];
            if ([self.session canAddOutput:self.videoOutput]) [self.session addOutput:self.videoOutput];
        }
        if (!self.audioOutput) {
            self.byAudioOutput(AVCaptureAudioDataOutput.new);
            [self.audioOutput setSampleBufferDelegate:self queue:self.sampleBufferQueue];
            if ([self.session canAddOutput:self.audioOutput]) [self.session addOutput:self.audioOutput];
        }
        [self.session commitConfiguration];
        self.updatePreviewOrientation(UIDevice.currentDevice.orientation);
        return YES;
    };
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

-(JobsRetNSArrayAVCaptureDeviceByAVCaptureDevicePositionBlock _Nonnull)camerasWithPosition{
    @jobs_weakify(self)
    return ^NSArray<AVCaptureDevice *> *(AVCaptureDevicePosition position){
        @jobs_strongify(self)
        if (!self) return nil;
        AVCaptureDeviceDiscoverySession *discoverySession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[
            AVCaptureDeviceTypeBuiltInWideAngleCamera
        ]
                                                                                                                  mediaType:AVMediaTypeVideo
                                                                                                                   position:position];
        return discoverySession.devices;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)cameraUnavailableDescription{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
    #if TARGET_OS_SIMULATOR
        return @"iOS 模拟器不支持摄像头录制，请使用真机";
    #else
        return @"摄像头不可用";
    #endif
    };
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

-(JobsRetAVCaptureVideoOrientationByUIDeviceOrientationBlock _Nonnull)captureVideoOrientationByDeviceOrientation{
    @jobs_weakify(self)
    return ^AVCaptureVideoOrientation(UIDeviceOrientation deviceOrientation){
        @jobs_strongify(self)
        if (!self) return (AVCaptureVideoOrientation){0};
        switch (deviceOrientation) {
            /// 处理 UIDeviceOrientationLandscapeLeft 分支
            case UIDeviceOrientationLandscapeLeft:
                return AVCaptureVideoOrientationLandscapeRight;
            /// 处理 UIDeviceOrientationLandscapeRight 分支
            case UIDeviceOrientationLandscapeRight:
                return AVCaptureVideoOrientationLandscapeLeft;
            /// 处理 UIDeviceOrientationPortraitUpsideDown 分支
            case UIDeviceOrientationPortraitUpsideDown:
                return AVCaptureVideoOrientationPortraitUpsideDown;
            /// 处理 UIDeviceOrientationPortrait 分支
            case UIDeviceOrientationPortrait:
            /// 未匹配已知分支时执行兜底处理
            default:
                return AVCaptureVideoOrientationPortrait;
        }
    };
}

-(jobsByErrBlock _Nonnull)notifyError{
    @jobs_weakify(self)
    return ^(NSError * error){
        @jobs_strongify(self)
        if (!self) return;
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(captureManager:didFailWithError:)]) {
                [self.delegate captureManager:self didFailWithError:error];
            }
        });
    };
}

-(NSError *)errorWithCode:(NSInteger)code
              description:(NSString *)description{
    return [NSError errorWithDomain:@"com.jobs.oc.video.recorder.capture"
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey: description ?: @"采集异常"}];
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCVideoRecorderCaptureManager
-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureAudioDataOutputBlock _Nonnull)byAudioOutput{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderCaptureManager * _Nullable(AVCaptureAudioDataOutput * _Nullable data){
        @jobs_strongify(self)
        [self setAudioOutput:data];
        return self;
    };
}

-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureDeviceInputBlock _Nonnull)byAudioInput{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderCaptureManager * _Nullable(AVCaptureDeviceInput * _Nullable data){
        @jobs_strongify(self)
        [self setAudioInput:data];
        return self;
    };
}

-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureDeviceInputBlock _Nonnull)byVideoInput{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderCaptureManager * _Nullable(AVCaptureDeviceInput * _Nullable data){
        @jobs_strongify(self)
        [self setVideoInput:data];
        return self;
    };
}

-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureDevicePositionBlock _Nonnull)byCurrentPosition{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderCaptureManager * _Nullable(AVCaptureDevicePosition data){
        @jobs_strongify(self)
        [self setCurrentPosition:data];
        return self;
    };
}

-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureVideoDataOutputBlock _Nonnull)byVideoOutput{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderCaptureManager * _Nullable(AVCaptureVideoDataOutput * _Nullable data){
        @jobs_strongify(self)
        [self setVideoOutput:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCVideoRecorderCaptureManager
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN AVCaptureConnection
@implementation AVCaptureConnection (JobsLocalPropertyDSLAutogen_70b822955c)
-(JobsRetAVCaptureConnectionByAVCaptureVideoOrientationBlock _Nonnull)byVideoOrientation{
    @jobs_weakify(self)
    return ^__kindof AVCaptureConnection * _Nullable(AVCaptureVideoOrientation data){
        @jobs_strongify(self)
        [self setVideoOrientation:data];
        return self;
    };
}

-(JobsRetAVCaptureConnectionByBOOLBlock _Nonnull)byVideoMirrored{
    @jobs_weakify(self)
    return ^__kindof AVCaptureConnection * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setVideoMirrored:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END AVCaptureConnection

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN AVCaptureVideoDataOutput
@implementation AVCaptureVideoDataOutput (JobsLocalPropertyDSLAutogen_70b822955c)
-(JobsRetAVCaptureVideoDataOutputByBOOLBlock _Nonnull)byAlwaysDiscardsLateVideoFrames{
    @jobs_weakify(self)
    return ^__kindof AVCaptureVideoDataOutput * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAlwaysDiscardsLateVideoFrames:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END AVCaptureVideoDataOutput
