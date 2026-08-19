//
//  JobsOCVideoRecorderCIFilterProcessor.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderCIFilterProcessor_h
#define JobsOCVideoRecorderCIFilterProcessor_h

#import <CoreImage/CoreImage.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsOCVideoRecorderFilterProtocol.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsOCVideoRecorderCIFilterType) {
    JobsOCVideoRecorderCIFilterTypeNormal = 0,
    JobsOCVideoRecorderCIFilterTypeMono,
    JobsOCVideoRecorderCIFilterTypeNoir,
    JobsOCVideoRecorderCIFilterTypeSepia,
    JobsOCVideoRecorderCIFilterTypeChrome,
    JobsOCVideoRecorderCIFilterTypeInstant,
    JobsOCVideoRecorderCIFilterTypeFade
};

@interface JobsOCVideoRecorderCIFilterProcessor : NSObject<JobsOCVideoRecorderFilterProtocol>

Prop_assign() JobsOCVideoRecorderCIFilterType filterType;

+(JobsRetNSArrayNSNumberByVoidBlock _Nonnull)allFilterTypes;
+(JobsRetNSStringByJobsOCVideoRecorderCIFilterTypeBlock _Nonnull)titleForFilterType;
-(instancetype)initWithFilterType:(JobsOCVideoRecorderCIFilterType)filterType;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderCIFilterProcessor
-(JobsRetJobsOCVideoRecorderCIFilterProcessorByJobsOCVideoRecorderCIFilterTypeBlock _Nonnull)byFilterType;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCVideoRecorderCIFilterProcessor
@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderCIFilterProcessor_h */
