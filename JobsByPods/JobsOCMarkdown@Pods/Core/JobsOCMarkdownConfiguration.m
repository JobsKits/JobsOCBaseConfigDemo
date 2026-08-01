//
//  JobsOCMarkdownConfiguration.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownConfiguration.h"

@implementation JobsOCMarkdownConfiguration

+(instancetype)defaultConfiguration{
    return JobsOCMarkdownConfiguration.new;
}

-(instancetype)init{
    if (self = [super init]) {
        self.appearance = JobsOCMarkdownAppearanceAutomatic;
        self.fontScale = 1;
        self.showsTableOfContents = YES;
        self.showsCodeCopyButton = YES;
        self.rendersMermaid = YES;
        self.rendersMath = YES;
        self.sanitizesHTML = YES;
        self.allowsRemoteContent = YES;
        self.customCSS = @"";
    };return self;
}

-(void)setFontScale:(CGFloat)fontScale{
    _fontScale = MIN(MAX(fontScale, .75f), 2);
}

-(NSString *)appearanceName{
    switch (self.appearance) {
        case JobsOCMarkdownAppearanceLight: return @"light";
        case JobsOCMarkdownAppearanceDark: return @"dark";
        default: return @"automatic";
    }
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCMarkdownConfiguration *configuration = JobsOCMarkdownConfiguration.new;
    configuration.appearance = self.appearance;
    configuration.fontScale = self.fontScale;
    configuration.showsTableOfContents = self.showsTableOfContents;
    configuration.showsCodeCopyButton = self.showsCodeCopyButton;
    configuration.rendersMermaid = self.rendersMermaid;
    configuration.rendersMath = self.rendersMath;
    configuration.sanitizesHTML = self.sanitizesHTML;
    configuration.allowsRemoteContent = self.allowsRemoteContent;
    configuration.customCSS = self.customCSS;
    return configuration;
}

@end
