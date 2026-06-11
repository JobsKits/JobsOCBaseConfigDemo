//
//  GTCaptcha4ResultModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_GTCAPTCHA4RESULTMODEL_DSL_123D4C0CFCDAA479
#define JOBS_HEADER_GUARD_GTCAPTCHA4RESULTMODEL_DSL_123D4C0CFCDAA479

#if __has_include(<JobsModel/GTCaptcha4ResultModel.h>)
#import <JobsModel/GTCaptcha4ResultModel.h>
#else
#import "GTCaptcha4ResultModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GTCaptcha4ResultModel (DSL)

#pragma mark —— 来自 GTCaptcha4ResultModel
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byPass_token;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byGen_time;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_output;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_id;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byLot_number;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byChallenge;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSInteger data))byFailCount;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byLotNumber;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptchaType;
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptchaId;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_GTCAPTCHA4RESULTMODEL_DSL_123D4C0CFCDAA479 */
