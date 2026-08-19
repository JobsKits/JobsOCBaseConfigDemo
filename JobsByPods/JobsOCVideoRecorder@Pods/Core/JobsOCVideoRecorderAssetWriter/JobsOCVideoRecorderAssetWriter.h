//
//  JobsOCVideoRecorderAssetWriter.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderAssetWriter_h
#define JobsOCVideoRecorderAssetWriter_h

#import <AVFoundation/AVFoundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <AudioToolbox/AudioToolbox.h>
#import <JobsOCVideoRecorder/JobsOCVideoRecorderConfig.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef void(^JobsOCVideoRecorderWriterFinishBlock)(NSURL *_Nullable fileURL,
                                                    CMTime duration,
                                                    NSError *_Nullable error);

@interface JobsOCVideoRecorderAssetWriter : NSObject

Prop_strong(readonly, nullable) NSURL *outputURL;
Prop_assign(readonly) CMTime duration;
Prop_assign(readonly, getter=isWriting) BOOL writing;

-(instancetype)initWithConfig:(JobsOCVideoRecorderConfig *)config;
-(BOOL)startWritingToURL:(NSURL *)outputURL
  videoFormatDescription:(CMFormatDescriptionRef)videoFormatDescription
  audioFormatDescription:(CMFormatDescriptionRef _Nullable)audioFormatDescription
       deviceOrientation:(UIDeviceOrientation)deviceOrientation
             frontCamera:(BOOL)frontCamera
                   error:(NSError **)error;
-(jobsByCMSampleBufferRefBlock _Nonnull)appendVideoSampleBuffer;
-(void)appendAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer;
-(jobsByCMSampleBufferRefBlock _Nonnull)appendAudioSampleBuffer;
-(jobsByJobsOCVideoRecorderWriterFinishBlockBlock _Nonnull)finishWritingWithCompletion;
-(jobsByVoidBlock _Nonnull)cancelWriting;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderAssetWriter
-(JobsRetJobsOCVideoRecorderAssetWriterByBOOLBlock _Nonnull)byAudioSamplePending;
-(JobsRetJobsOCVideoRecorderAssetWriterByBOOLBlock _Nonnull)bySessionStarted;
-(JobsRetJobsOCVideoRecorderAssetWriterByBOOLBlock _Nonnull)byVideoSamplePending;
-(JobsRetJobsOCVideoRecorderAssetWriterByBOOLBlock _Nonnull)byWriting;
-(JobsRetJobsOCVideoRecorderAssetWriterByCMTimeBlock _Nonnull)byFirstPresentationTime;
-(JobsRetJobsOCVideoRecorderAssetWriterByCMTimeBlock _Nonnull)byLastPresentationTime;
-(JobsRetJobsOCVideoRecorderAssetWriterByNSURLBlock _Nonnull)byOutputURL;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCVideoRecorderAssetWriter
@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderAssetWriter_h */
