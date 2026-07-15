//
//  JobsOCVideoRecorderCaptureManager.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderCaptureManager_h
#define JobsOCVideoRecorderCaptureManager_h

#import <AVFoundation/AVFoundation.h>
#import <TargetConditionals.h>
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class JobsOCVideoRecorderCaptureManager;

@protocol JobsOCVideoRecorderCaptureManagerDelegate <NSObject>

-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
didOutputVideoSampleBuffer:(CMSampleBufferRef)sampleBuffer;
-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
didOutputAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer;
-(void)captureManager:(JobsOCVideoRecorderCaptureManager *)captureManager
         didFailWithError:(NSError *)error;

@end

@interface JobsOCVideoRecorderCaptureManager : NSObject

Prop_weak(nullable) id<JobsOCVideoRecorderCaptureManagerDelegate> delegate;
Prop_strong(readonly) AVCaptureVideoPreviewLayer *previewLayer;
Prop_assign(readonly) AVCaptureDevicePosition currentPosition;

+(BOOL)isCameraSwitchAvailable;
-(instancetype)initWithPosition:(AVCaptureDevicePosition)position
             mirrorFrontPreview:(BOOL)mirrorFrontPreview;
-(void)startRunning;
-(void)stopRunning;
-(void)switchCameraWithCompletion:(void(^_Nullable)(BOOL success, NSError *_Nullable error))completion;
-(void)updatePreviewOrientation:(UIDeviceOrientation)deviceOrientation;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderCaptureManager_h */
