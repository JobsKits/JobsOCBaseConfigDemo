//
//  JobsOCVideoRecorderCIFilterProcessor.h
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsOCVideoRecorderCIFilterProcessor_h
#define JobsOCVideoRecorderCIFilterProcessor_h

#import <CoreImage/CoreImage.h>
#import <JobsOCVideoRecorder/JobsOCVideoRecorderFilterProtocol.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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

+(NSArray<NSNumber *> *)allFilterTypes;
+(NSString *)titleForFilterType:(JobsOCVideoRecorderCIFilterType)filterType;
-(instancetype)initWithFilterType:(JobsOCVideoRecorderCIFilterType)filterType;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsOCVideoRecorderCIFilterProcessor_h */
