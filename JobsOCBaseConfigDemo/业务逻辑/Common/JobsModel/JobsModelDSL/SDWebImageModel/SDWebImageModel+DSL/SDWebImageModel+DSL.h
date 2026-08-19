//
//  SDWebImageModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_F2AC39C0220E72E
#define JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_F2AC39C0220E72E

#import "JobsModel.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SDWebImageModel (DSL)

-(JobsRetSDWebImageModelByURLBlock _Nonnull)byUrl;
-(JobsRetSDWebImageModelByImageBlock _Nonnull)byPlaceholder;
-(JobsRetSDWebImageModelByUIntegerBlock _Nonnull)byOptions;
-(JobsRetSDWebImageModelByCompletionBlock _Nonnull)byCompletion;
-(JobsRetSDWebImageModelByProgressBlock _Nonnull)byProgress;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_F2AC39C0220E72E */
