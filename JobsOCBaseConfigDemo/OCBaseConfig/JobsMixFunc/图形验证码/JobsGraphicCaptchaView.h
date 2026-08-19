//
//  JobsGraphicCaptchaView.h
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAVIEW_F277935969
#define JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAVIEW_F277935969

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsGraphicCaptchaGenerator.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsGraphicCaptchaView : UIView

Prop_strong()JobsGraphicCaptchaConfig *config;
Prop_copy()NSString *captchaText;
Prop_strong()UIFont *font;
Prop_strong()UIColor *textColor;
Prop_strong()UIColor *captchaBackgroundColor;
Prop_assign()NSUInteger interferenceLineCount;
Prop_assign()NSUInteger noisePointCount;
Prop_assign()BOOL shouldRefreshWhenTapped;
Prop_copy(nullable)void (^refreshBlock)(NSString *captchaText);

-(jobsByVoidBlock _Nonnull)refreshCaptcha;
-(JobsRetBOOLByStrBlock _Nonnull)validateInput;

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsGraphicCaptchaView
-(JobsRetJobsGraphicCaptchaViewByJobsGraphicCaptchaConfigBlock _Nonnull)byConfig;
-(JobsRetJobsGraphicCaptchaViewByUIFontBlock _Nonnull)byFont;
-(JobsRetJobsGraphicCaptchaViewByUIColorBlock _Nonnull)byTextColor;
-(JobsRetJobsGraphicCaptchaViewByjobsByStrBlockBlock _Nonnull)byRefreshBlock;
-(JobsRetJobsGraphicCaptchaViewByBOOLBlock _Nonnull)byShouldRefreshWhenTapped;
-(JobsRetJobsGraphicCaptchaViewByNSStringBlock _Nonnull)byCaptchaText;
-(JobsRetJobsGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byInterferenceLineCount;
-(JobsRetJobsGraphicCaptchaViewByNSUIntegerBlock _Nonnull)byNoisePointCount;
-(JobsRetJobsGraphicCaptchaViewByUIColorBlock _Nonnull)byCaptchaBackgroundColor;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsGraphicCaptchaView
@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAVIEW_F277935969 */
