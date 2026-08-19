//
//  GTCaptcha4ResultModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_GTCAPTCHA4RESULTMODEL_DSL_30AE9936F503F5A8
#define JOBS_HEADER_GUARD_GTCAPTCHA4RESULTMODEL_DSL_30AE9936F503F5A8

#import "JobsModel.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GTCaptcha4ResultModel (DSL)

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byPass_token;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byGen_time;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptcha_output;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptcha_id;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byLot_number;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byChallenge;
-(JobsRetGTCaptcha4ResultModelByNSIntegerBlock _Nonnull)byFailCount;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byLotNumber;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptchaType;
-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptchaId;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_GTCAPTCHA4RESULTMODEL_DSL_30AE9936F503F5A8 */
