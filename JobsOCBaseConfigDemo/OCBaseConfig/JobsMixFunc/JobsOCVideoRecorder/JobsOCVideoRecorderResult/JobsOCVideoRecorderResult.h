//
//  JobsOCVideoRecorderResult.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderResult_h
#define JobsOCVideoRecorderResult_h

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <CoreMedia/CoreMedia.h>
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCVideoRecorderResult : NSObject

Prop_strong() NSURL *fileURL;
Prop_assign() CMTime duration;
Prop_copy(nullable) NSString *assetLocalIdentifier;
Prop_strong() NSDate *createdAt;

+(instancetype)resultWithFileURL:(NSURL *)fileURL
                         duration:(CMTime)duration;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderResult
-(JobsRetJobsOCVideoRecorderResultByDateBlock _Nonnull)byCreatedAt;
-(JobsRetJobsOCVideoRecorderResultByStrBlock _Nonnull)byAssetLocalIdentifier;
-(JobsRetJobsOCVideoRecorderResultByCMTimeBlock _Nonnull)byDuration;
-(JobsRetJobsOCVideoRecorderResultByURLBlock _Nonnull)byFileURL;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCVideoRecorderResult
@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderResult_h */
