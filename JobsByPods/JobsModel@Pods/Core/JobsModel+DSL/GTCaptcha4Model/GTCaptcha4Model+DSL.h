//
//  GTCaptcha4Model+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_GTCAPTCHA4MODEL_DSL_1C7FC7F187A1C352
#define JOBS_HEADER_GUARD_GTCAPTCHA4MODEL_DSL_1C7FC7F187A1C352

#if __has_include(<JobsModel/GTCaptcha4Model.h>)
#import <JobsModel/GTCaptcha4Model.h>
#else
#import "GTCaptcha4Model.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GTCaptcha4Model (DSL)

#pragma mark —— 来自 GTCaptcha4Model
-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(GTCaptcha4Session * data))byCaptcha4Session;
-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(GTCaptcha4ResultModel * data))byResult;
-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(NSString * data))byStatus;
-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(GTC4Error * data))byError;
-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(__kindof UIView * data))byTargetView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_GTCAPTCHA4MODEL_DSL_1C7FC7F187A1C352 */
