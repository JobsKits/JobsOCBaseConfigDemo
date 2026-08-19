//
//  JobsOCMarkdownConfiguration.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsOCMarkdownAppearance) {
    JobsOCMarkdownAppearanceAutomatic,
    JobsOCMarkdownAppearanceLight,
    JobsOCMarkdownAppearanceDark
};

@interface JobsOCMarkdownConfiguration : NSObject <NSCopying>

Prop_assign()JobsOCMarkdownAppearance appearance;
Prop_assign()CGFloat fontScale;
Prop_assign()BOOL showsTableOfContents;
Prop_assign()BOOL showsCodeCopyButton;
Prop_assign()BOOL rendersMermaid;
Prop_assign()BOOL rendersMath;
Prop_assign()BOOL sanitizesHTML;
Prop_assign()BOOL allowsRemoteContent;
Prop_copy()NSString *customCSS;

+(JobsRetIDByVoidBlock _Nonnull)defaultConfiguration;
-(JobsRetStrByVoidBlock _Nonnull)appearanceName;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCMarkdownConfiguration
-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byAllowsRemoteContent;
-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byRendersMath;
-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byRendersMermaid;
-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)bySanitizesHTML;
-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byShowsCodeCopyButton;
-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byShowsTableOfContents;
-(JobsRetJobsOCMarkdownConfigurationByCGFloatBlock _Nonnull)byFontScale;
-(JobsRetJobsOCMarkdownConfigurationByJobsOCMarkdownAppearanceBlock _Nonnull)byAppearance;
-(JobsRetJobsOCMarkdownConfigurationByNSStringBlock _Nonnull)byCustomCSS;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCMarkdownConfiguration
@end

NS_ASSUME_NONNULL_END
