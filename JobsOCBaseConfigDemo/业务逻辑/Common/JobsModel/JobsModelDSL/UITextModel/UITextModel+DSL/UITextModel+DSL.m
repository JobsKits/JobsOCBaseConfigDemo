//
//  UITextModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "UITextModel+DSL.h"

@implementation UITextModel (DSL)
-(JobsRetUITextModelByNSTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(JobsRetUITextModelByNSLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetUITextModelByNSTextAlignmentBlock _Nonnull)bySubTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTextAlignment = data;
        return self;
    };
}

-(JobsRetUITextModelByNSLineBreakModeBlock _Nonnull)bySubLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subLineBreakMode = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byTextLineSpacing{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLineSpacing = data;
        return self;
    };
}

-(JobsRetUITextModelByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetUITextModelByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(JobsRetUITextModelByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byCurWordCount{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.curWordCount = data;
        return self;
    };
}

-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byMaxWordCount{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.maxWordCount = data;
        return self;
    };
}

-(JobsRetUITextModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetUITextModelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetUITextModelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(JobsRetUITextModelByStrBlock _Nonnull)bySubText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subText = data;
        return self;
    };
}

-(JobsRetUITextModelByFontBlock _Nonnull)bySubFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subFont = data;
        return self;
    };
}

-(JobsRetUITextModelByCorBlock _Nonnull)bySubTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTextCor = data;
        return self;
    };
}

-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(JobsRetUITextModelByStrBlock _Nonnull)bySelectedText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedText = data;
        return self;
    };
}

-(JobsRetUITextModelByFontBlock _Nonnull)bySelectedFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedFont = data;
        return self;
    };
}

-(JobsRetUITextModelByCorBlock _Nonnull)bySelectedTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTextCor = data;
        return self;
    };
}

-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedText = data;
        return self;
    };
}

-(JobsRetUITextModelByStrBlock _Nonnull)bySelectedSubText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubText = data;
        return self;
    };
}

-(JobsRetUITextModelByFontBlock _Nonnull)bySelectedSubFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubFont = data;
        return self;
    };
}

-(JobsRetUITextModelByCorBlock _Nonnull)bySelectedSubTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTextCor = data;
        return self;
    };
}

-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubText = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsX{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsY{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsTop{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsRight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(JobsRetUITextModelByNSUIntegerBlock _Nonnull)byLocation{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(JobsRetUITextModelByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(JobsRetUITextModelByCGSizeBlock _Nonnull)byJobsSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(JobsRetUITextModelByFrameBlock _Nonnull)byJobsRect{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(JobsRetUITextModelByCGPointBlock _Nonnull)byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(JobsRetUITextModelByUIRectCornerBlock _Nonnull)byRectCorner{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(JobsRetUITextModelByCGSizeBlock _Nonnull)byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(JobsRetUITextModelByUILayoutConstraintAxisBlock _Nonnull)byAxis{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(JobsRetUITextModelByUIStackViewDistributionBlock _Nonnull)byDistribution{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(JobsRetUITextModelByUIStackViewAlignmentBlock _Nonnull)byAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(JobsRetUITextModelByNSIntegerBlock _Nonnull)bySection{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byItem{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byRow{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(JobsRetUITextModelByNSDirectionalRectEdgeBlock _Nonnull)byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.HeightForHeaderInSection = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byCellWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellWidth = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byCellHeight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellHeight = data;
        return self;
    };
}

-(JobsRetUITextModelByCGSizeBlock _Nonnull)byCellSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.CellSize = data;
        return self;
    };
}

-(JobsRetUITextModelByCGSizeBlock _Nonnull)byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(JobsRetUITextModelByCGSizeBlock _Nonnull)byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.Alpha = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetUITextModelByCorBlock _Nonnull)byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byLayerBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerBorderWidth = data;
        return self;
    };
}

-(JobsRetUITextModelByCGFloatBlock _Nonnull)byLayerCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerCornerRadius = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsTranslucent{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isTranslucent = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsVisible{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isVisible = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsInvisible{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isInvisible = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsMultiLineShows{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMultiLineShows = data;
        return self;
    };
}

-(JobsRetUITextModelByUILabelShowingTypeBlock _Nonnull)byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.labelShowingType = data;
        return self;
    };
}

-(JobsRetUITextModelByNSUIntegerBlock _Nonnull)byJobsTag{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

-(JobsRetUITextModelByComingStyleBlock _Nonnull)byPushOrPresent{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(ComingStyle data) {
        @jobs_strongify(self)
        self.pushOrPresent = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(JobsRetUITextModelByBOOLBlock _Nonnull)byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(JobsRetUITextModelByUIActionPointerBlock _Nonnull)byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIAction * _Nullable data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(JobsRetUITextModelByJobsRetIDByIDBlockBlock _Nonnull)byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(JobsRetUITextModelByJobsRetIDByIDBlockBlock _Nonnull)byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetUITextModelByJobsByBtnBlockBlock _Nonnull)byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(JobsRetUITextModelByJobsByBtnBlockBlock _Nonnull)byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetUITextModelByUIViewPointerBlock _Nonnull)byVIEW{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.VIEW = data;
        return self;
    };
}

-(JobsRetUITextModelByUIViewControllerPointerBlock _Nonnull)byVC{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.VC = data;
        return self;
    };
}

@end
