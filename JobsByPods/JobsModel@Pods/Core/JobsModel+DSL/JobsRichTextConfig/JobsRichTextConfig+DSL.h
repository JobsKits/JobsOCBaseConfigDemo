//
//  JobsRichTextConfig+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_0A11977AA6A941F7
#define JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_0A11977AA6A941F7

#if __has_include(<JobsModel/JobsRichTextConfig.h>)
#import <JobsModel/JobsRichTextConfig.h>
#else
#import "JobsRichTextConfig.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsRichTextConfig (DSL)

#pragma mark —— 来自 JobsRichTextConfig
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSString * data))byTargetString;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIFont * data))byFont;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIColor * data))byTextCor;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIColor * data))byTextBgCor;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSUnderlineStyle data))byUnderlineStyle;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(UIColor * data))byUnderlineCor;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSMutableParagraphStyle * data))byParagraphStyle;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSString * data))byUrlStr;
-(__kindof JobsRichTextConfig *_Nonnull (^ _Nonnull)(NSRange data))byRange;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_0A11977AA6A941F7 */
