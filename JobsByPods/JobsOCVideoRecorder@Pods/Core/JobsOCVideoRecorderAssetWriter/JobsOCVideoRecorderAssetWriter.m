//
//  JobsOCVideoRecorderAssetWriter.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderAssetWriter.h"

@interface JobsOCVideoRecorderAssetWriter ()

Prop_strong() JobsOCVideoRecorderConfig *config;
Prop_strong(nullable) AVAssetWriter *assetWriter;
Prop_strong(nullable) AVAssetWriterInput *videoInput;
Prop_strong(nullable) AVAssetWriterInputPixelBufferAdaptor *pixelBufferAdaptor;
Prop_strong(nullable) AVAssetWriterInput *audioInput;
Prop_strong() dispatch_queue_t writerQueue;
Prop_strong(nullable) NSURL *outputURL;
Prop_assign(getter=isWriting) BOOL writing;
Prop_assign() BOOL sessionStarted;
Prop_assign() BOOL videoSamplePending;
Prop_assign() BOOL audioSamplePending;
Prop_assign() CMTime firstPresentationTime;
Prop_assign() CMTime lastPresentationTime;

@end

@implementation JobsOCVideoRecorderAssetWriter
-(instancetype)initWithConfig:(JobsOCVideoRecorderConfig *)config{
    if (self = [super init]) {
        _config = config ?: JobsOCVideoRecorderConfig.defaultConfig;
        _writerQueue = dispatch_queue_create("com.jobs.oc.video.recorder.writer", DISPATCH_QUEUE_SERIAL);
        _firstPresentationTime = kCMTimeInvalid;
        _lastPresentationTime = kCMTimeInvalid;
    };return self;
}

-(BOOL)startWritingToURL:(NSURL *)outputURL
  videoFormatDescription:(CMFormatDescriptionRef)videoFormatDescription
  audioFormatDescription:(CMFormatDescriptionRef)audioFormatDescription
       deviceOrientation:(UIDeviceOrientation)deviceOrientation
             frontCamera:(BOOL)frontCamera
                   error:(NSError **)error{
    if (!outputURL || !videoFormatDescription) return NO;
    self.outputURL = outputURL;
    [NSFileManager.defaultManager removeItemAtURL:outputURL error:nil];
    self.assetWriter = [AVAssetWriter assetWriterWithURL:outputURL
                                                fileType:self.config.outputFileType
                                                   error:error];
    if (!self.assetWriter) return NO;
    CMVideoDimensions dimensions = CMVideoFormatDescriptionGetDimensions(videoFormatDescription);
    NSDictionary *compression = @{
        AVVideoAverageBitRateKey: @(self.config.videoBitrate),
        AVVideoProfileLevelKey: AVVideoProfileLevelH264HighAutoLevel
    };
    NSDictionary *videoSettings = @{
        AVVideoCodecKey: AVVideoCodecTypeH264,
        AVVideoWidthKey: @(ABS(dimensions.width)),
        AVVideoHeightKey: @(ABS(dimensions.height)),
        AVVideoCompressionPropertiesKey: compression
    };
    self.videoInput = [AVAssetWriterInput assetWriterInputWithMediaType:AVMediaTypeVideo
                                                          outputSettings:videoSettings];
    self.videoInput.expectsMediaDataInRealTime = YES;
    self.videoInput.transform = [self transformByDeviceOrientation:deviceOrientation
                                                       frontCamera:frontCamera];
    NSDictionary *pixelAttributes = @{
        (NSString *)kCVPixelBufferPixelFormatTypeKey: @(kCVPixelFormatType_32BGRA),
        (NSString *)kCVPixelBufferWidthKey: @(ABS(dimensions.width)),
        (NSString *)kCVPixelBufferHeightKey: @(ABS(dimensions.height))
    };
    self.pixelBufferAdaptor = [AVAssetWriterInputPixelBufferAdaptor assetWriterInputPixelBufferAdaptorWithAssetWriterInput:self.videoInput
                                                                                               sourcePixelBufferAttributes:pixelAttributes];
    if ([self.assetWriter canAddInput:self.videoInput]) [self.assetWriter addInput:self.videoInput];
    if (audioFormatDescription) {
        AudioStreamBasicDescription const *audioDescription = CMAudioFormatDescriptionGetStreamBasicDescription(audioFormatDescription);
        Float64 sampleRate = audioDescription ? audioDescription->mSampleRate : self.config.audioSampleRate;
        UInt32 channelCount = audioDescription ? audioDescription->mChannelsPerFrame : (UInt32)self.config.audioChannels;
        NSDictionary *audioSettings = @{
            AVFormatIDKey: @(kAudioFormatMPEG4AAC),
            AVSampleRateKey: @(sampleRate > 0 ? sampleRate : self.config.audioSampleRate),
            AVNumberOfChannelsKey: @(MAX(1, channelCount)),
            AVEncoderBitRateKey: @(self.config.audioBitrate)
        };
        self.audioInput = [AVAssetWriterInput assetWriterInputWithMediaType:AVMediaTypeAudio
                                                              outputSettings:audioSettings];
        self.audioInput.expectsMediaDataInRealTime = YES;
        if ([self.assetWriter canAddInput:self.audioInput]) [self.assetWriter addInput:self.audioInput];
    }
    self.sessionStarted = NO;
    self.firstPresentationTime = kCMTimeInvalid;
    self.lastPresentationTime = kCMTimeInvalid;
    self.writing = [self.assetWriter startWriting];
    if (!self.writing && error) *error = self.assetWriter.error;
    return self.writing;
}

-(void)appendVideoSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    if (!sampleBuffer || ![self reserveVideoSampleBuffer]) return;
    CFRetain(sampleBuffer);
    dispatch_async(self.writerQueue, ^{
        @autoreleasepool {
            if ([self canAppendSampleBuffer:sampleBuffer]) {
                CMTime presentationTime = CMSampleBufferGetPresentationTimeStamp(sampleBuffer);
                [self startSessionIfNeeded:presentationTime];
                CVPixelBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
                if (pixelBuffer) {
                    CVPixelBufferRef outputPixelBuffer = pixelBuffer;
                    if (self.config.filterProcessor &&
                        [self.config.filterProcessor respondsToSelector:@selector(processPixelBuffer:presentationTime:)]) {
                        CVPixelBufferRef filteredPixelBuffer = [self.config.filterProcessor processPixelBuffer:pixelBuffer
                                                                                               presentationTime:presentationTime];
                        outputPixelBuffer = filteredPixelBuffer ?: pixelBuffer;
                    }
                    if (self.videoInput.readyForMoreMediaData) {
                        [self.pixelBufferAdaptor appendPixelBuffer:outputPixelBuffer
                                              withPresentationTime:presentationTime];
                        self.lastPresentationTime = presentationTime;
                    }
                    if (outputPixelBuffer != pixelBuffer) CVPixelBufferRelease(outputPixelBuffer);
                }
            }
            CFRelease(sampleBuffer);
            [self releaseVideoSampleBuffer];
        }
    });
}

-(void)appendAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    if (!sampleBuffer || !self.audioInput || ![self reserveAudioSampleBuffer]) return;
    CFRetain(sampleBuffer);
    dispatch_async(self.writerQueue, ^{
        @autoreleasepool {
            if ([self canAppendSampleBuffer:sampleBuffer]) {
                CMTime presentationTime = CMSampleBufferGetPresentationTimeStamp(sampleBuffer);
                [self startSessionIfNeeded:presentationTime];
                if (self.audioInput.readyForMoreMediaData) {
                    [self.audioInput appendSampleBuffer:sampleBuffer];
                    self.lastPresentationTime = presentationTime;
                }
            }
            CFRelease(sampleBuffer);
            [self releaseAudioSampleBuffer];
        }
    });
}

-(void)finishWritingWithCompletion:(JobsOCVideoRecorderWriterFinishBlock)completion{
    dispatch_async(self.writerQueue, ^{
        if (!self.assetWriter || !self.isWriting) {
            if (completion) completion(self.outputURL, self.duration, self.assetWriter.error);
            return;
        }
        self.writing = NO;
        [self.videoInput markAsFinished];
        [self.audioInput markAsFinished];
        [self.assetWriter finishWritingWithCompletionHandler:^{
            NSError *error = self.assetWriter.status == AVAssetWriterStatusCompleted ? nil : self.assetWriter.error;
            if (completion) completion(self.outputURL, self.duration, error);
        }];
    });
}

-(void)cancelWriting{
    dispatch_async(self.writerQueue, ^{
        self.writing = NO;
        [self.assetWriter cancelWriting];
        if (self.outputURL) [NSFileManager.defaultManager removeItemAtURL:self.outputURL error:nil];
    });
}

-(CMTime)duration{
    if (!CMTIME_IS_VALID(self.firstPresentationTime) || !CMTIME_IS_VALID(self.lastPresentationTime)) return kCMTimeZero;
    return CMTimeSubtract(self.lastPresentationTime, self.firstPresentationTime);
}

-(BOOL)canAppendSampleBuffer:(CMSampleBufferRef)sampleBuffer{
    if (!CMSampleBufferDataIsReady(sampleBuffer)) return NO;
    if (self.assetWriter.status == AVAssetWriterStatusFailed ||
        self.assetWriter.status == AVAssetWriterStatusCancelled ||
        self.assetWriter.status == AVAssetWriterStatusCompleted) return NO;
    return YES;
}

-(BOOL)reserveVideoSampleBuffer{
    @synchronized (self) {
        if (!self.isWriting || self.videoSamplePending) return NO;
        self.videoSamplePending = YES;
        return YES;
    }
}

-(void)releaseVideoSampleBuffer{
    @synchronized (self) {
        self.videoSamplePending = NO;
    }
}

-(BOOL)reserveAudioSampleBuffer{
    @synchronized (self) {
        if (!self.isWriting || self.audioSamplePending) return NO;
        self.audioSamplePending = YES;
        return YES;
    }
}

-(void)releaseAudioSampleBuffer{
    @synchronized (self) {
        self.audioSamplePending = NO;
    }
}

-(void)startSessionIfNeeded:(CMTime)presentationTime{
    if (self.sessionStarted) return;
    self.firstPresentationTime = presentationTime;
    self.lastPresentationTime = presentationTime;
    [self.assetWriter startSessionAtSourceTime:presentationTime];
    self.sessionStarted = YES;
}

-(CGAffineTransform)transformByDeviceOrientation:(UIDeviceOrientation)deviceOrientation
                                     frontCamera:(BOOL)frontCamera{
    (void)frontCamera;
    switch (deviceOrientation) {
        /// 处理 UIDeviceOrientationLandscapeLeft 分支
        case UIDeviceOrientationLandscapeLeft:
            return CGAffineTransformMakeRotation(M_PI);
        /// 处理 UIDeviceOrientationLandscapeRight 分支
        case UIDeviceOrientationLandscapeRight:
            return CGAffineTransformIdentity;
        /// 处理 UIDeviceOrientationPortraitUpsideDown 分支
        case UIDeviceOrientationPortraitUpsideDown:
            return CGAffineTransformMakeRotation(-M_PI_2);
        /// 处理 UIDeviceOrientationPortrait 分支
        case UIDeviceOrientationPortrait:
        /// 未匹配已知分支时执行兜底处理
        default:
            return CGAffineTransformMakeRotation(M_PI_2);
    }
}

@end
