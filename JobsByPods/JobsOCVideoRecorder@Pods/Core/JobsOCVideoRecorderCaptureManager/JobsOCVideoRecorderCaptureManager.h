//
//  JobsOCVideoRecorderCaptureManager.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderCaptureManager_h
#define JobsOCVideoRecorderCaptureManager_h

#import <AVFoundation/AVFoundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <TargetConditionals.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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

+(JobsRetBOOLByVoidBlock _Nonnull)isCameraSwitchAvailable;
-(instancetype)initWithPosition:(AVCaptureDevicePosition)position
             mirrorFrontPreview:(BOOL)mirrorFrontPreview;
-(jobsByVoidBlock _Nonnull)startRunning;
-(jobsByVoidBlock _Nonnull)stopRunning;
-(jobsByvoidBOOLNSErrorBlock _Nonnull)switchCameraWithCompletion;
-(jobsByUIDeviceOrientationBlock _Nonnull)updatePreviewOrientation;
-(JobsRetJobsOCVideoRecorderCaptureManagerByDelegateBlock _Nonnull)byDelegate;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderCaptureManager
-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureAudioDataOutputBlock _Nonnull)byAudioOutput;
-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureDeviceInputBlock _Nonnull)byAudioInput;
-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureDeviceInputBlock _Nonnull)byVideoInput;
-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureDevicePositionBlock _Nonnull)byCurrentPosition;
-(JobsRetJobsOCVideoRecorderCaptureManagerByAVCaptureVideoDataOutputBlock _Nonnull)byVideoOutput;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCVideoRecorderCaptureManager
@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderCaptureManager_h */
