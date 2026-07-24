//
//  JobsOCExcelStyle.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelStyle.h"

@implementation JobsOCExcelStyle
-(instancetype)init{
    if (self = [super init]) {
        self.defaultColumnWidth = 112;
        self.headerHeight = 46;
        self.rowHeight = 44;
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
        self.showsHorizontalScrollIndicator = YES;
        self.bouncesHorizontally = YES;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCExcelStyle *style = JobsOCExcelStyle.new;
    style.defaultColumnWidth = self.defaultColumnWidth;
    style.headerHeight = self.headerHeight;
    style.rowHeight = self.rowHeight;
    style.gridLineWidth = self.gridLineWidth;
    style.gridLineColor = self.gridLineColor;
    style.frozenHeaderBackgroundColor = self.frozenHeaderBackgroundColor;
    style.headerBackgroundColor = self.headerBackgroundColor;
    style.frozenColumnBackgroundColor = self.frozenColumnBackgroundColor;
    style.bodyBackgroundColor = self.bodyBackgroundColor;
    style.frozenHeaderTextColor = self.frozenHeaderTextColor;
    style.headerTextColor = self.headerTextColor;
    style.primaryTextColor = self.primaryTextColor;
    style.secondaryTextColor = self.secondaryTextColor;
    style.headerFont = self.headerFont;
    style.bodyFont = self.bodyFont;
    style.showsHorizontalScrollIndicator = self.showsHorizontalScrollIndicator;
    style.bouncesHorizontally = self.bouncesHorizontally;
    return style;
}

@end
