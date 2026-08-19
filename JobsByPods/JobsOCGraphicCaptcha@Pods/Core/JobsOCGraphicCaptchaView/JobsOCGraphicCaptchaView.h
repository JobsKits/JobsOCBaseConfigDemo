//
//  JobsOCGraphicCaptchaView.h
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAVIEW_F277935969
#define JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAVIEW_F277935969

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsOCGraphicCaptcha/JobsOCGraphicCaptchaGenerator.h>

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCGraphicCaptchaView : UIView

Prop_strong()JobsOCGraphicCaptchaConfig *config;
Prop_copy()NSString *captchaText;
Prop_strong()UIFont *font;
Prop_strong()UIColor *textColor;
Prop_strong()UIColor *captchaBackgroundColor;
Prop_assign()NSUInteger interferenceLineCount;
Prop_assign()NSUInteger noisePointCount;
Prop_assign()BOOL shouldRefreshWhenTapped;
Prop_copy(nullable)void (^refreshBlock)(NSString *captchaText);

-(JobsRetJobsOCGraphicCaptchaViewByConfigBlock _Nonnull)byConfig;
-(JobsRetJobsOCGraphicCaptchaViewByStrBlock _Nonnull)byCaptchaText;
-(JobsRetJobsOCGraphicCaptchaViewByFontBlock _Nonnull)byFont;
-(JobsRetJobsOCGraphicCaptchaViewByCorBlock _Nonnull)byTextColor;
-(JobsRetJobsOCGraphicCaptchaViewByCorBlock _Nonnull)byCaptchaBackgroundColor;
-(JobsRetJobsOCGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byInterferenceLineCount;
-(JobsRetJobsOCGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byNoisePointCount;
-(JobsRetJobsOCGraphicCaptchaViewByBOOLBlock _Nonnull)byShouldRefreshWhenTapped;
-(JobsRetJobsOCGraphicCaptchaViewByRefreshBlock _Nonnull)byRefreshBlock;
-(JobsRetJobsOCGraphicCaptchaViewByBOOLBlock _Nonnull)byOpaque;
-(JobsRetJobsOCGraphicCaptchaViewByBOOLBlock _Nonnull)byUserInteractionEnabled;
-(jobsByVoidBlock _Nonnull)refreshCaptcha;
-(JobsRetBOOLByStrBlock _Nonnull)validateInput;

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAVIEW_F277935969 */
