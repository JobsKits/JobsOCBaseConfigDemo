//
//  JobsOCMarkdownConfiguration.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

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

+(instancetype)defaultConfiguration;
-(NSString *)appearanceName;

@end

NS_ASSUME_NONNULL_END
