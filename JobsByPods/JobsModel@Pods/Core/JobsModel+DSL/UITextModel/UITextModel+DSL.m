//
//  UITextModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UITextModel+DSL.h"

@implementation UITextModel (DSL)

#pragma mark —— 来自 UITextModelProtocol
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySubTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTextAlignment = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySubLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subLineBreakMode = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLineSpacing{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLineSpacing = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurWordCount{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.curWordCount = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byMaxWordCount{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.maxWordCount = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))byText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))byFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))byTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))bySubText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.subText = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))bySubFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.subFont = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))bySubTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.subTextCor = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.selectedText = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.selectedFont = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.selectedTextCor = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.selectedAttributedText = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedSubText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.selectedSubText = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedSubFont{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.selectedSubFont = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedSubTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.selectedSubTextCor = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedSubText{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.selectedAttributedSubText = data;
        return self;
    };
}

#pragma mark —— 来自 UILocationProtocol
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsX{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsY{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsTop{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsRight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLocation{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLength{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byJobsSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGRect data))byJobsRect{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGPoint data))byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRectCorner{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UILayoutConstraintAxis data))byAxis{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIStackViewDistribution data))byDistribution{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIStackViewAlignment data))byAlignment{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))bySection{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byItem{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byRow{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSDirectionalRectEdge data))byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.heightForHeaderInSection = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cellWidth = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellHeight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cellHeight = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byCellSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.cellSize = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

#pragma mark —— 来自 UIViewModelOthersProtocol
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byAlpha{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.Alpha = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byOpaque{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byLayerBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.layerBorderWidth = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byLayerCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.layerCornerRadius = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsTranslucent{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isTranslucent = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsVisible{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isVisible = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsInvisible{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isInvisible = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsMultiLineShows{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isMultiLineShows = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UILabelShowingType data))byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UILabelShowingType data) {
        @jobs_strongify(self)
        self.labelShowingType = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSUInteger data))byJobsTag{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(ComingStyle data))byPushOrPresent{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(ComingStyle data) {
        @jobs_strongify(self)
        self.pushOrPresent = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIAction * data))byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIAction * data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIView * data))byVIEW{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.VIEW = data;
        return self;
    };
}

-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIViewController * data))byVC{
    @jobs_weakify(self)
    return ^__kindof UITextModel *_Nonnull(UIViewController * data) {
        @jobs_strongify(self)
        self.VC = data;
        return self;
    };
}

@end
