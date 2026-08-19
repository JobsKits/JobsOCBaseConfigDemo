//
//  JobsOCMarkdownConfiguration.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownConfiguration.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCMarkdownConfiguration
@interface JobsOCMarkdownConfiguration (JobsPropertyDSLSetterAutogen_20469c7bfd)
-(void)setAllowsRemoteContent:(BOOL)data;
-(void)setAppearance:(JobsOCMarkdownAppearance)data;
-(void)setCustomCSS:(NSString * _Nullable)data;
-(void)setFontScale:(CGFloat)data;
-(void)setRendersMath:(BOOL)data;
-(void)setRendersMermaid:(BOOL)data;
-(void)setSanitizesHTML:(BOOL)data;
-(void)setShowsCodeCopyButton:(BOOL)data;
-(void)setShowsTableOfContents:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCMarkdownConfiguration

@implementation JobsOCMarkdownConfiguration

+(JobsRetIDByVoidBlock _Nonnull)defaultConfiguration{
    return ^id{
        return JobsOCMarkdownConfiguration.new;
    };
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

-(JobsRetStrByVoidBlock _Nonnull)appearanceName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        switch (self.appearance) {
            case JobsOCMarkdownAppearanceLight: return @"light";
            case JobsOCMarkdownAppearanceDark: return @"dark";
            default: return @"automatic";
        }
    };
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCMarkdownConfiguration *configuration = JobsOCMarkdownConfiguration.new;
    configuration.byAppearance(self.appearance);
    configuration.byFontScale(self.fontScale);
    configuration.byShowsTableOfContents(self.showsTableOfContents);
    configuration.byShowsCodeCopyButton(self.showsCodeCopyButton);
    configuration.byRendersMermaid(self.rendersMermaid);
    configuration.byRendersMath(self.rendersMath);
    configuration.bySanitizesHTML(self.sanitizesHTML);
    configuration.byAllowsRemoteContent(self.allowsRemoteContent);
    configuration.byCustomCSS(self.customCSS);
    return configuration;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCMarkdownConfiguration
-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byAllowsRemoteContent{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAllowsRemoteContent:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byRendersMath{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setRendersMath:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byRendersMermaid{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setRendersMermaid:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)bySanitizesHTML{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setSanitizesHTML:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byShowsCodeCopyButton{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShowsCodeCopyButton:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByBOOLBlock _Nonnull)byShowsTableOfContents{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShowsTableOfContents:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByCGFloatBlock _Nonnull)byFontScale{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setFontScale:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByJobsOCMarkdownAppearanceBlock _Nonnull)byAppearance{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(JobsOCMarkdownAppearance data){
        @jobs_strongify(self)
        [self setAppearance:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownConfigurationByNSStringBlock _Nonnull)byCustomCSS{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownConfiguration * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setCustomCSS:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCMarkdownConfiguration
@end
