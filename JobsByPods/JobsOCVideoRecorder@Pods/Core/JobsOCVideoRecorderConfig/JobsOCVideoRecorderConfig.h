//
//  JobsOCVideoRecorderConfig.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderConfig_h
#define JobsOCVideoRecorderConfig_h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <JobsOCVideoRecorder/JobsOCVideoRecorderFilterProtocol.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@class JobsOCVideoRecorderResult;

NS_ASSUME_NONNULL_BEGIN

typedef void(^JobsOCVideoRecorderCompletionBlock)(JobsOCVideoRecorderResult *_Nullable result,
                                                  NSError *_Nullable error);

@interface JobsOCVideoRecorderConfig : NSObject

Prop_assign() NSTimeInterval maxDuration;
Prop_assign() NSTimeInterval minDuration;
Prop_copy(nullable) NSString *albumName;
Prop_assign() AVCaptureDevicePosition preferredCameraPosition;
Prop_assign() BOOL mirrorsFrontCameraPreview;
Prop_assign() NSInteger videoBitrate;
Prop_assign() NSInteger audioBitrate;
Prop_assign() Float64 audioSampleRate;
Prop_assign() NSInteger audioChannels;
Prop_copy() AVFileType outputFileType;
Prop_strong(nullable) id<JobsOCVideoRecorderFilterProtocol> filterProcessor;
Prop_copy(nullable) JobsOCVideoRecorderCompletionBlock completionBlock;

+(instancetype)defaultConfig;
-(NSString *)effectiveAlbumName;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderConfig_h */
