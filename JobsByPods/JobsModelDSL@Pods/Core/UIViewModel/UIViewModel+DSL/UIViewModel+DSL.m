//
//  UIViewModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "UIViewModel+DSL.h"

@implementation UIViewModel (DSL)

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIRectCornerBlock _Nonnull)byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsTop{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsRight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSUIntegerBlock _Nonnull)byLocation{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byJobsSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byJobsRect{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGPointBlock _Nonnull)byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIRectCornerBlock _Nonnull)byRectCorner{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(JobsRetUIViewModelByUILayoutConstraintAxisBlock _Nonnull)byAxis{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIStackViewDistributionBlock _Nonnull)byDistribution{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIStackViewAlignmentBlock _Nonnull)byAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIntegerBlock _Nonnull)bySection{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIntegerBlock _Nonnull)byItem{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIntegerBlock _Nonnull)byRow{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSDirectionalRectEdgeBlock _Nonnull)byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.HeightForHeaderInSection = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byCellWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byCellHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byCellSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.CellSize = data;
        return self;
    };
}





-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIndexPathPointerBlock _Nonnull)byIndexPath{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSIndexPath * _Nullable data) {
        @jobs_strongify(self)
        self.indexPath = data;
        return self;
    };
}

-(JobsRetUIViewModelByNumberBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetUIViewModelByNumberBlock _Nonnull)byPageSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByNumberBlock _Nonnull)byPageNum{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageNum = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGPointBlock _Nonnull)byLastPoint{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastPoint = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIntegerBlock _Nonnull)byIndex{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsMark{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMark = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byPresentUpHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.presentUpHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byNavBgImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.navBgImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byNavBgCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.navBgCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byBgImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.imageURLString = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageURLString = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byBgCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byBackBtnIMG{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnIMG = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgConfig{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgConfig = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)bySelectedImage_{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImage_ = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byBgSelectedImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)bySelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImageURLString = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byBgSelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImageURLString = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byBgSelectedCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byBackBtnSelectedIMG{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnSelectedIMG = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgSelectedConfig{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedConfig = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIImageViewPointerBlock _Nonnull)byBgImageView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageView = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTextAlignmentBlock _Nonnull)bySubTextAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTextAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSLineBreakModeBlock _Nonnull)bySubLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subLineBreakMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLineSpacing{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLineSpacing = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIntegerBlock _Nonnull)byCurWordCount{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.curWordCount = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIntegerBlock _Nonnull)byMaxWordCount{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.maxWordCount = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSAttributedStringPointerBlock _Nonnull)byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)bySubText{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subText = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)bySubFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySubTextCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTextCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSAttributedStringPointerBlock _Nonnull)byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)bySelectedText{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedText = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)bySelectedFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySelectedTextCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTextCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedText{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedText = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)bySelectedSubText{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubText = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)bySelectedSubFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySelectedSubTextCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTextCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubText{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubText = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.Alpha = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byLayerBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerBorderWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byLayerCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerCornerRadius = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsTranslucent{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isTranslucent = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsVisible{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isVisible = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsInvisible{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isInvisible = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsMultiLineShows{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMultiLineShows = data;
        return self;
    };
}

-(JobsRetUIViewModelByUILabelShowingTypeBlock _Nonnull)byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.labelShowingType = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSUIntegerBlock _Nonnull)byJobsTag{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

-(JobsRetUIViewModelByComingStyleBlock _Nonnull)byPushOrPresent{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(ComingStyle data) {
        @jobs_strongify(self)
        self.pushOrPresent = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIActionPointerBlock _Nonnull)byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIAction * _Nullable data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsRetIDByIDBlockBlock _Nonnull)byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsRetIDByIDBlockBlock _Nonnull)byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByBtnBlockBlock _Nonnull)byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByBtnBlockBlock _Nonnull)byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetViewModelByViewBlock _Nonnull)byVIEW{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.VIEW = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIViewControllerPointerBlock _Nonnull)byVC{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.VC = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIControlContentHorizontalAlignmentBlock _Nonnull)byContentHorizontalAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIControlContentHorizontalAlignment data) {
        @jobs_strongify(self)
        self.contentHorizontalAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIControlContentVerticalAlignmentBlock _Nonnull)byContentVerticalAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIControlContentVerticalAlignment data) {
        @jobs_strongify(self)
        self.contentVerticalAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSDirectionalEdgeInsetsBlock _Nonnull)byContentInsets{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        self.contentInsets = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIEdgeInsets data) {
        @jobs_strongify(self)
        self.contentEdgeInsets = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.baseBackgroundColor = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySelectedBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedBaseBackgroundColor = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySelectedLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedLayerBorderCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byNormalBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.normalBorderWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySelectedBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.selectedBorderWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImagePadding{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imagePadding = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTitlePadding{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titlePadding = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSDirectionalRectEdgeBlock _Nonnull)byImagePlacement{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.imagePlacement = data;
        return self;
    };
}

-(JobsRetUIViewModelByUILabelShowingTypeBlock _Nonnull)byTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.titleShowingType = data;
        return self;
    };
}

-(JobsRetUIViewModelByUILabelShowingTypeBlock _Nonnull)bySubTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.subTitleShowingType = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byImageSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byContentSpacing{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSpacing = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byBtnWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.btnWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)bySubTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.titleCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySubTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTextAlignmentBlock _Nonnull)byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.titleAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTextAlignmentBlock _Nonnull)bySubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTitleAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)byButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.buttonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSLineBreakModeBlock _Nonnull)byTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.titleLineBreakMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)bySelectedTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitle = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)bySelectedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitle = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)bySelectedTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)bySelectedSubTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySelectedTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)bySelectedSubTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTextAlignmentBlock _Nonnull)bySelectedTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedTitleAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTextAlignmentBlock _Nonnull)bySelectedSubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedSubTitleAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)bySelectedButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.selectedButtonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSLineBreakModeBlock _Nonnull)bySelectedTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedTitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSLineBreakModeBlock _Nonnull)bySelectedSubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedSubtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byNormalImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.normalImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byHighlightBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightBackgroundImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byHighlightImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedTitle = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubTitle = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textLabelFrame = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)bySubTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.subTextLabelFrame = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byBtnImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.btnImageViewFrame = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.textLabelSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)bySubTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.subTextLabelSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byImageViewSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageViewSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewFrameResetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewFrameResetY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetY = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByFontBlock _Nonnull)byTextFont{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.textFont = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byTextFieldPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.textFieldPlaceholder = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSAttributedStringPointerBlock _Nonnull)byAttributedPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedPlaceholder = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTextAlignmentBlock _Nonnull)byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byText_offset{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(JobsRetViewModelByViewBlock _Nonnull)byLeftView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.leftView = data;
        return self;
    };
}

-(JobsRetViewModelByViewBlock _Nonnull)byRightView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.rightView = data;
        return self;
    };
}

-(JobsRetUIViewModelByUITextFieldViewModeBlock _Nonnull)byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByUITextFieldViewModeBlock _Nonnull)byRightViewMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.rightViewMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsShowMenu{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowMenu = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byNotAllowEdit{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.notAllowEdit = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byTextFieldSecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.textFieldSecureTextEntry = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTFRiseHeight{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.TFRiseHeight = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance_ = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIKeyboardTypeBlock _Nonnull)byKeyboardType_{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType_ = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType_ = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byBorderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.borderRectForBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetUIViewModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock _Nonnull)byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <JobsRetIDByIDBlock> * _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(JobsRetUIViewModelByURLBlock _Nonnull)byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(JobsRetUIViewModelByURLBlock _Nonnull)byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(JobsRetUIViewModelByImageBlock _Nonnull)byTitleImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByMASConstraintMakerBlockBlock _Nonnull)byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByMASConstraintMakerBlock _Nullable data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByFrameBlock _Nonnull)byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(JobsRetUIViewModelByTimeIntervalBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(JobsRetUIViewModelByTimeIntervalBlock _Nonnull)byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(JobsRetUIViewModelByTimeIntervalBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byRepeats{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSInvocationPointerBlock _Nonnull)byInvocation{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInvocation * _Nullable data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSRunLoopModeBlock _Nonnull)byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetUIViewModelByShowTimeTypeBlock _Nonnull)byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsTimerStyleBlock _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsTimerTypeBlock _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(JobsRetUIViewModelByTimeIntervalBlock _Nonnull)byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(JobsRetUIViewModelByDateBlock _Nonnull)byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSTimerPointerBlock _Nonnull)byNsTimer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSTimer * _Nullable data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(JobsRetUIViewModelByDispatch_source_tBlock _Nonnull)byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(dispatch_source_t _Nullable data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(JobsRetUIViewModelByCADisplayLinkPointerBlock _Nonnull)byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CADisplayLink * _Nullable data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(JobsRetUIViewModelByDispatch_queue_tBlock _Nonnull)byQueue{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(dispatch_queue_t _Nullable data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsTimerStateBlock _Nonnull)byTimerState{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByCGFloatBlockBlock _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByCGFloatBlock _Nullable data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsTimerBlockBlock _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsTimerBlock _Nullable data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsTimerPointerBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsTimer * _Nullable data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSLockPointerBlock _Nonnull)byLock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSLock * _Nullable data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSRecursiveLockPointerBlock _Nonnull)byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSRecursiveLock * _Nullable data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(JobsRetUIViewModelByDispatch_semaphore_tBlock _Nonnull)bySemaphore{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(dispatch_semaphore_t _Nullable data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsLock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsRead{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(JobsRetUIViewModelByAppLanguageBlock _Nonnull)byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGPointBlock _Nonnull)byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(JobsRetUIViewModelByWKUserContentControllerPointerBlock _Nonnull)byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(WKUserContentController * _Nullable data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(JobsRetUIViewModelByWKScriptMessagePointerBlock _Nonnull)byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(WKScriptMessage * _Nullable data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byHandlerName{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsJSCompletionHandlerBlockBlock _Nonnull)byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsJSCompletionHandlerBlock _Nullable data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayNSURLPointerPointerBlock _Nonnull)byUrls{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <NSURL *> * _Nullable data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(JobsRetUIViewModelByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetUIViewModelByURLBlock _Nonnull)byImageUrl{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(JobsRetUIViewModelByStrBlock _Nonnull)byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(JobsRetUIViewModelByMutableSetBlock _Nonnull)byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableSet * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayPointerBlock _Nonnull)byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableDictionaryPointerBlock _Nonnull)byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(JobsRetUIViewModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(Class _Nullable data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(JobsRetUIViewModelBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(SEL _Nullable data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(JobsRetUIViewModelByIMPBlock _Nonnull)byImplementation{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(IMP _Nullable data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byWeak_target{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byModelData{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGFloatBlock _Nonnull)byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSIntegerBlock _Nonnull)byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSUIntegerBlock _Nonnull)byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byData_weak{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(JobsRetUIViewModelByIDBlock _Nonnull)byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIViewModelPointerBlock _Nonnull)byViewModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIViewModelPointerBlock _Nonnull)byViewModel_weak{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel_weak = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByViewModelBlockBlock _Nonnull)byViewModelBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByViewModelBlock _Nullable data) {
        @jobs_strongify(self)
        if (data && self.viewModel) data(self.viewModel);
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonModelPointerBlock _Nonnull)byButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonModelPointerBlock _Nonnull)bySubButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.subButtonModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByButtonModelBlockBlock _Nonnull)byButtonModelBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByButtonModelBlock _Nullable data) {
        @jobs_strongify(self)
        if (data) data(self.buttonModel);
        return self;
    };
}

-(JobsRetUIViewModelByJobsByButtonModelBlockBlock _Nonnull)bySubButtonModelBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByButtonModelBlock _Nullable data) {
        @jobs_strongify(self)
        if (data) data(self.subButtonModel);
        return self;
    };
}

-(JobsRetUIViewModelByUITextModelPointerBlock _Nonnull)byTextModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.textModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUITextModelPointerBlock _Nonnull)bySubTextModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.subTextModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUITextModelPointerBlock _Nonnull)byBackBtnTitleModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnTitleModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByTextModelBlockBlock _Nonnull)byTextModelBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByTextModelBlock _Nullable data) {
        @jobs_strongify(self)
        if (data) data(self.textModel);
        return self;
    };
}

-(JobsRetUIViewModelByJobsByTextModelBlockBlock _Nonnull)bySubTextModelBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByTextModelBlock _Nullable data) {
        @jobs_strongify(self)
        if (data) data(self.subTextModel);
        return self;
    };
}

-(JobsRetUIViewModelByJobsByTextModelBlockBlock _Nonnull)byBackBtnTitleModelBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByTextModelBlock _Nullable data) {
        @jobs_strongify(self)
        if (data) data(self.backBtnTitleModel);
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayKindofUIViewModelPointerPointerBlock _Nonnull)byViewModels{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <__kindof UIViewModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.viewModels = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock _Nonnull)byButtonModels{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <__kindof UIButtonModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModels = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)byTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.titleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedSubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonPointerBlock _Nonnull)byBackBtn{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.backBtn = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonModelPointerBlock _Nonnull)byCloseBtnModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonModelPointerBlock _Nonnull)byBackBtnModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIViewModelPointerBlock _Nonnull)byTitleModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.titleModel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIActivityIndicatorViewPointerBlock _Nonnull)byActivityIndicatorView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIActivityIndicatorView * _Nullable data) {
        @jobs_strongify(self)
        self.activityIndicatorView = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIStackViewPointerBlock _Nonnull)byStackView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIStackView * _Nullable data) {
        @jobs_strongify(self)
        self.stackView = data;
        return self;
    };
}

-(JobsRetViewModelByViewBlock _Nonnull)byViewer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.viewer = data;
        return self;
    };
}

-(JobsRetUIViewModelByUICollectionViewPointerBlock _Nonnull)byCollectionView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UICollectionView * _Nullable data) {
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(JobsRetUIViewModelByUITableViewPointerBlock _Nonnull)byTableView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UITableView * _Nullable data) {
        @jobs_strongify(self)
        self.tableView = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIScrollViewPointerBlock _Nonnull)byScrollView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIScrollView * _Nullable data) {
        @jobs_strongify(self)
        self.scrollView = data;
        return self;
    };
}

-(JobsRetUIViewModelByWKWebViewPointerBlock _Nonnull)byWebView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof WKWebView * _Nullable data) {
        @jobs_strongify(self)
        self.webView = data;
        return self;
    };
}

-(JobsRetUIViewModelByPDFViewPointerBlock _Nonnull)byPdfView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof PDFView * _Nullable data) {
        @jobs_strongify(self)
        self.pdfView = data;
        return self;
    };
}

-(JobsRetUIViewModelByKindofUIImageViewPointerBlock _Nonnull)byImageView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIButtonPointerBlock _Nonnull)byButton{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.button = data;
        return self;
    };
}

-(JobsRetUIViewModelByUILabelPointerBlock _Nonnull)byLabel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.label = data;
        return self;
    };
}

-(JobsRetUIViewModelByUILabelPointerBlock _Nonnull)bySubLabel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.subLabel = data;
        return self;
    };
}

-(JobsRetUIViewModelByUITextViewPointerBlock _Nonnull)byTextView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UITextView * _Nullable data) {
        @jobs_strongify(self)
        self.textView = data;
        return self;
    };
}

-(JobsRetUIViewModelBySZTextViewPointerBlock _Nonnull)bySzTextView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof SZTextView * _Nullable data) {
        @jobs_strongify(self)
        self.szTextView = data;
        return self;
    };
}

-(JobsRetUIViewModelByUITextFieldPointerBlock _Nonnull)byTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.textField = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsTextViewPointerBlock _Nonnull)byJobsTextView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof JobsTextView * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextView = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsMagicTextFieldPointerBlock _Nonnull)byMagicTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof JobsMagicTextField * _Nullable data) {
        @jobs_strongify(self)
        self.magicTextField = data;
        return self;
    };
}

-(JobsRetUIViewModelByZYTextFieldPointerBlock _Nonnull)byZyTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof ZYTextField * _Nullable data) {
        @jobs_strongify(self)
        self.zyTextField = data;
        return self;
    };
}

-(JobsRetUIViewModelByHQTextFieldPointerBlock _Nonnull)byHqTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof HQTextField * _Nullable data) {
        @jobs_strongify(self)
        self.hqTextField = data;
        return self;
    };
}

-(JobsRetUIViewModelByCJTextFieldPointerBlock _Nonnull)byCjTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof CJTextField * _Nullable data) {
        @jobs_strongify(self)
        self.cjTextField = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsTextFieldPointerBlock _Nonnull)byJobsTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(__kindof JobsTextField * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextField = data;
        return self;
    };
}

-(JobsRetUIViewModelByBOOLBlock _Nonnull)byIsAllowDrag{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isAllowDrag = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBackBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBackBlock = data;
        return self;
    };
}

-(JobsRetUIViewModelByUIRectCornerBlock _Nonnull)byLayoutSubviewsRectCorner{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCorner = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byLayoutSubviewsRectCornerSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCornerSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByCorBlock _Nonnull)byLayerCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerCor = data;
        return self;
    };
}

-(JobsRetUIViewModelByNSMutableArrayMASConstraintPointerPointerBlock _Nonnull)byConstraintMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(NSMutableArray <MASConstraint *> * _Nullable data) {
        @jobs_strongify(self)
        self.constraintMutArr = data;
        return self;
    };
}

-(JobsRetUIViewModelByCGSizeBlock _Nonnull)byThisViewSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.thisViewSize = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsHeaderFooterViewStyleBlock _Nonnull)byHeaderFooterViewStyle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(JobsHeaderFooterViewStyle data) {
        @jobs_strongify(self)
        self.headerFooterViewStyle = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByBtnBlockBlock _Nonnull)byBackBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.backBtnClickAction = data;
        return self;
    };
}

-(JobsRetUIViewModelByJobsByBtnBlockBlock _Nonnull)byCloseBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnClickAction = data;
        return self;
    };
}

@end
