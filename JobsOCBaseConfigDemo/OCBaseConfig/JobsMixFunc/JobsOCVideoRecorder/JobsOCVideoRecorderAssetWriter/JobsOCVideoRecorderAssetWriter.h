//
//  JobsOCVideoRecorderAssetWriter.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderAssetWriter_h
#define JobsOCVideoRecorderAssetWriter_h

#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "JobsOCVideoRecorderConfig.h"

#import "JobsDefines.h"

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
-(void)appendVideoSampleBuffer:(CMSampleBufferRef)sampleBuffer;
-(void)appendAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer;
-(void)finishWritingWithCompletion:(JobsOCVideoRecorderWriterFinishBlock)completion;
-(void)cancelWriting;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderAssetWriter_h */
