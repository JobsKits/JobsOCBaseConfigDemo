//
//  JobsCorModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSCORMODEL_DSL_44F3A5C858E53741
#define JOBS_HEADER_GUARD_JOBSCORMODEL_DSL_44F3A5C858E53741

#if __has_include(<JobsModel/JobsCorModel.h>)
#import <JobsModel/JobsCorModel.h>
#else
#import "JobsCorModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCorModel (DSL)

#pragma mark —— 来自 JobsCorModel
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byRed;
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byGreen;
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byBlue;
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byAlpha;
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byHue;
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))bySaturation;
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(CGFloat data))byBrightness;
-(__kindof JobsCorModel *_Nonnull (^ _Nonnull)(NSString * data))byCorStr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCORMODEL_DSL_44F3A5C858E53741 */
