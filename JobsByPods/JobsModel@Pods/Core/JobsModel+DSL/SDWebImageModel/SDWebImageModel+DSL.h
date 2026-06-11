//
//  SDWebImageModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_EE4FAFA8DC0A3B0F
#define JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_EE4FAFA8DC0A3B0F

#if __has_include(<JobsModel/SDWebImageModel.h>)
#import <JobsModel/SDWebImageModel.h>
#else
#import "SDWebImageModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SDWebImageModel (DSL)

#pragma mark —— 来自 SDWebImageModel
-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl;
-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(UIImage * data))byPlaceholder;
-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(SDWebImageOptions data))byOptions;
-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(SDExternalCompletionBlock data))byCompletion;
-(__kindof SDWebImageModel *_Nonnull (^ _Nonnull)(SDImageLoaderProgressBlock data))byProgress;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SDWEBIMAGEMODEL_DSL_EE4FAFA8DC0A3B0F */
