//
//  JobsOCExcelStyle.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelStyle.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCExcelStyle
@interface JobsOCExcelStyle (JobsPropertyDSLSetterAutogen_2049c9f723)
-(void)setBodyBackgroundColor:(UIColor * _Nullable)data;
-(void)setBodyFont:(UIFont * _Nullable)data;
-(void)setDefaultColumnWidth:(CGFloat)data;
-(void)setFrozenColumnBackgroundColor:(UIColor * _Nullable)data;
-(void)setFrozenHeaderBackgroundColor:(UIColor * _Nullable)data;
-(void)setFrozenHeaderTextColor:(UIColor * _Nullable)data;
-(void)setGridLineColor:(UIColor * _Nullable)data;
-(void)setGridLineWidth:(CGFloat)data;
-(void)setHeaderBackgroundColor:(UIColor * _Nullable)data;
-(void)setHeaderFont:(UIFont * _Nullable)data;
-(void)setHeaderHeight:(CGFloat)data;
-(void)setHeaderTextColor:(UIColor * _Nullable)data;
-(void)setPrimaryTextColor:(UIColor * _Nullable)data;
-(void)setSecondaryTextColor:(UIColor * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCExcelStyle

@implementation JobsOCExcelStyle
-(JobsRetIDByCGFloatBlock _Nonnull)byRowHeight{
    @jobs_weakify(self)
    return ^id(CGFloat rowHeight){
        @jobs_strongify(self)
        self.rowHeight = rowHeight;
        return self;
    };
}

-(JobsRetIDByBOOLBlock _Nonnull)byShowsHorizontalScrollIndicator{
    @jobs_weakify(self)
    return ^id(BOOL shows){
        @jobs_strongify(self)
        self.showsHorizontalScrollIndicator = shows;
        return self;
    };
}

-(JobsRetIDByBOOLBlock _Nonnull)byBouncesHorizontally{
    @jobs_weakify(self)
    return ^id(BOOL bounces){
        @jobs_strongify(self)
        self.bouncesHorizontally = bounces;
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.defaultColumnWidth = 112;
        self.headerHeight = 46;
        self.byRowHeight(44);
        self.gridLineWidth = .5f;
        if (@available(iOS 13.0, *)) {
            self.gridLineColor = UIColor.separatorColor;
            self.frozenHeaderBackgroundColor = UIColor.systemIndigoColor;
            self.headerBackgroundColor = UIColor.secondarySystemBackgroundColor;
            self.frozenColumnBackgroundColor = UIColor.tertiarySystemBackgroundColor;
            self.bodyBackgroundColor = UIColor.systemBackgroundColor;
            self.frozenHeaderTextColor = JobsWhiteColor;
            self.headerTextColor = UIColor.labelColor;
            self.primaryTextColor = UIColor.labelColor;
            self.secondaryTextColor = UIColor.secondaryLabelColor;
        }else{
            self.gridLineColor = HEXCOLOR(0xC7C7CC);
            self.frozenHeaderBackgroundColor = HEXCOLOR(0x5856D6);
            self.headerBackgroundColor = HEXCOLOR(0xF2F2F7);
            self.frozenColumnBackgroundColor = HEXCOLOR(0xFAFAFA);
            self.bodyBackgroundColor = JobsWhiteColor;
            self.frozenHeaderTextColor = JobsWhiteColor;
            self.headerTextColor = JobsBlackColor;
            self.primaryTextColor = JobsBlackColor;
            self.secondaryTextColor = HEXCOLOR(0x666666);
        }
        self.headerFont = UIFontWeightSemiboldSize(14);
        self.bodyFont = UIFontWeightRegularSize(14);
        self.byShowsHorizontalScrollIndicator(YES);
        self.byBouncesHorizontally(YES);
    };return self;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCExcelStyle *style = JobsOCExcelStyle.new;
    style.byDefaultColumnWidth(self.defaultColumnWidth);
    style.byHeaderHeight(self.headerHeight);
    style.byRowHeight(self.rowHeight);
    style.byGridLineWidth(self.gridLineWidth);
    style.byGridLineColor(self.gridLineColor);
    style.byFrozenHeaderBackgroundColor(self.frozenHeaderBackgroundColor);
    style.byHeaderBackgroundColor(self.headerBackgroundColor);
    style.byFrozenColumnBackgroundColor(self.frozenColumnBackgroundColor);
    style.byBodyBackgroundColor(self.bodyBackgroundColor);
    style.byFrozenHeaderTextColor(self.frozenHeaderTextColor);
    style.byHeaderTextColor(self.headerTextColor);
    style.byPrimaryTextColor(self.primaryTextColor);
    style.bySecondaryTextColor(self.secondaryTextColor);
    style.byHeaderFont(self.headerFont);
    style.byBodyFont(self.bodyFont);
    style.byShowsHorizontalScrollIndicator(self.showsHorizontalScrollIndicator);
    style.byBouncesHorizontally(self.bouncesHorizontally);
    return style;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCExcelStyle
-(JobsRetJobsOCExcelStyleByCGFloatBlock _Nonnull)byDefaultColumnWidth{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setDefaultColumnWidth:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByCGFloatBlock _Nonnull)byGridLineWidth{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setGridLineWidth:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByCGFloatBlock _Nonnull)byHeaderHeight{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setHeaderHeight:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byBodyBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setBodyBackgroundColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byFrozenColumnBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setFrozenColumnBackgroundColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byFrozenHeaderBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setFrozenHeaderBackgroundColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byFrozenHeaderTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setFrozenHeaderTextColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byGridLineColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setGridLineColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byHeaderBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setHeaderBackgroundColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byHeaderTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setHeaderTextColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)byPrimaryTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setPrimaryTextColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIColorBlock _Nonnull)bySecondaryTextColor{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setSecondaryTextColor:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIFontBlock _Nonnull)byBodyFont{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setBodyFont:data];
        return self;
    };
}

-(JobsRetJobsOCExcelStyleByUIFontBlock _Nonnull)byHeaderFont{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelStyle * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setHeaderFont:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCExcelStyle
@end
