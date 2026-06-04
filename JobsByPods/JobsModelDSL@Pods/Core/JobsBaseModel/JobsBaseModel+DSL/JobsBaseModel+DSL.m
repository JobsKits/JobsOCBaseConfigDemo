//
//  JobsBaseModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsBaseModel+DSL.h"

@implementation JobsBaseModel (DSL)

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIRectCornerBlock _Nonnull)byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsTop{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsRight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSUIntegerBlock _Nonnull)byLocation{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byJobsSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byJobsRect{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGPointBlock _Nonnull)byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIRectCornerBlock _Nonnull)byRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUILayoutConstraintAxisBlock _Nonnull)byAxis{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIStackViewDistributionBlock _Nonnull)byDistribution{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIStackViewAlignmentBlock _Nonnull)byAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIntegerBlock _Nonnull)bySection{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIntegerBlock _Nonnull)byItem{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIntegerBlock _Nonnull)byRow{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSDirectionalRectEdgeBlock _Nonnull)byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.HeightForHeaderInSection = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byCellWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byCellHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byCellSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.CellSize = data;
        return self;
    };
}





-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIndexPathPointerBlock _Nonnull)byIndexPath{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSIndexPath * _Nullable data) {
        @jobs_strongify(self)
        self.indexPath = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNumberBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNumberBlock _Nonnull)byPageSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNumberBlock _Nonnull)byPageNum{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageNum = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGPointBlock _Nonnull)byLastPoint{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastPoint = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIntegerBlock _Nonnull)byIndex{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsMark{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMark = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byPresentUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.presentUpHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byNavBgImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.navBgImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byNavBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.navBgCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byBgImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.imageURLString = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageURLString = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byBackBtnIMG{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnIMG = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgConfig{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgConfig = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)bySelectedImage_{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImage_ = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byBgSelectedImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)bySelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImageURLString = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byBgSelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImageURLString = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byBgSelectedCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byBackBtnSelectedIMG{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnSelectedIMG = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgSelectedConfig{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedConfig = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIImageViewPointerBlock _Nonnull)byBgImageView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTextAlignmentBlock _Nonnull)bySubTextAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTextAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSLineBreakModeBlock _Nonnull)bySubLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLineSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLineSpacing = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIntegerBlock _Nonnull)byCurWordCount{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.curWordCount = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIntegerBlock _Nonnull)byMaxWordCount{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.maxWordCount = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSAttributedStringPointerBlock _Nonnull)byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)bySubText{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subText = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)bySubFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySubTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTextCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSAttributedStringPointerBlock _Nonnull)byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)bySelectedText{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedText = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)bySelectedFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySelectedTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTextCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedText{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedText = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)bySelectedSubText{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubText = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)bySelectedSubFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySelectedSubTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTextCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubText{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubText = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.Alpha = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byLayerBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byLayerCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerCornerRadius = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsTranslucent{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isTranslucent = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsVisible{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isVisible = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsInvisible{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isInvisible = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsMultiLineShows{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMultiLineShows = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUILabelShowingTypeBlock _Nonnull)byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.labelShowingType = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSUIntegerBlock _Nonnull)byJobsTag{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByComingStyleBlock _Nonnull)byPushOrPresent{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(ComingStyle data) {
        @jobs_strongify(self)
        self.pushOrPresent = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIActionPointerBlock _Nonnull)byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIAction * _Nullable data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsRetIDByIDBlockBlock _Nonnull)byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsRetIDByIDBlockBlock _Nonnull)byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByBtnBlockBlock _Nonnull)byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByBtnBlockBlock _Nonnull)byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIViewPointerBlock _Nonnull)byVIEW{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.VIEW = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIViewControllerPointerBlock _Nonnull)byVC{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.VC = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIControlContentHorizontalAlignmentBlock _Nonnull)byContentHorizontalAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIControlContentHorizontalAlignment data) {
        @jobs_strongify(self)
        self.contentHorizontalAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIControlContentVerticalAlignmentBlock _Nonnull)byContentVerticalAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIControlContentVerticalAlignment data) {
        @jobs_strongify(self)
        self.contentVerticalAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSDirectionalEdgeInsetsBlock _Nonnull)byContentInsets{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        self.contentInsets = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIEdgeInsets data) {
        @jobs_strongify(self)
        self.contentEdgeInsets = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.baseBackgroundColor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySelectedBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedBaseBackgroundColor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySelectedLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedLayerBorderCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byNormalBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.normalBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySelectedBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.selectedBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImagePadding{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imagePadding = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTitlePadding{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titlePadding = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSDirectionalRectEdgeBlock _Nonnull)byImagePlacement{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.imagePlacement = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUILabelShowingTypeBlock _Nonnull)byTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.titleShowingType = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUILabelShowingTypeBlock _Nonnull)bySubTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.subTitleShowingType = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byImageSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byContentSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSpacing = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byBtnWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.btnWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)bySubTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.titleCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySubTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTextAlignmentBlock _Nonnull)byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.titleAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTextAlignmentBlock _Nonnull)bySubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)byButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.buttonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSLineBreakModeBlock _Nonnull)byTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.titleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)bySelectedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)bySelectedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)bySelectedTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)bySelectedSubTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySelectedTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)bySelectedSubTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTextAlignmentBlock _Nonnull)bySelectedTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTextAlignmentBlock _Nonnull)bySelectedSubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedSubTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)bySelectedButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.selectedButtonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSLineBreakModeBlock _Nonnull)bySelectedTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedTitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSLineBreakModeBlock _Nonnull)bySelectedSubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedSubtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byNormalImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.normalImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byHighlightBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightBackgroundImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byHighlightImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedTitle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textLabelFrame = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)bySubTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.subTextLabelFrame = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byBtnImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.btnImageViewFrame = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.textLabelSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)bySubTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.subTextLabelSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byImageViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageViewSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFontBlock _Nonnull)byTextFont{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.textFont = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byTextFieldPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.textFieldPlaceholder = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSAttributedStringPointerBlock _Nonnull)byAttributedPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedPlaceholder = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTextAlignmentBlock _Nonnull)byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byText_offset{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByKindofUIViewPointerBlock _Nonnull)byLeftView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.leftView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByKindofUIViewPointerBlock _Nonnull)byRightView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.rightView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITextFieldViewModeBlock _Nonnull)byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITextFieldViewModeBlock _Nonnull)byRightViewMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.rightViewMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsShowMenu{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowMenu = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byNotAllowEdit{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.notAllowEdit = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byTextFieldSecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.textFieldSecureTextEntry = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTFRiseHeight{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.TFRiseHeight = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance_ = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIKeyboardTypeBlock _Nonnull)byKeyboardType_{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType_ = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType_ = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byBorderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.borderRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock _Nonnull)byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <JobsRetIDByIDBlock> * _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByURLBlock _Nonnull)byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByURLBlock _Nonnull)byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByImageBlock _Nonnull)byTitleImage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByMASConstraintMakerBlockBlock _Nonnull)byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByMASConstraintMakerBlock _Nullable data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByFrameBlock _Nonnull)byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByTimeIntervalBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByTimeIntervalBlock _Nonnull)byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByTimeIntervalBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSInvocationPointerBlock _Nonnull)byInvocation{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInvocation * _Nullable data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSRunLoopModeBlock _Nonnull)byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByShowTimeTypeBlock _Nonnull)byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsTimerStyleBlock _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsTimerTypeBlock _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByTimeIntervalBlock _Nonnull)byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByDateBlock _Nonnull)byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSTimerPointerBlock _Nonnull)byNsTimer{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSTimer * _Nullable data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByDispatch_source_tBlock _Nonnull)byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(dispatch_source_t _Nullable data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCADisplayLinkPointerBlock _Nonnull)byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CADisplayLink * _Nullable data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByDispatch_queue_tBlock _Nonnull)byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(dispatch_queue_t _Nullable data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsTimerStateBlock _Nonnull)byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByCGFloatBlockBlock _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByCGFloatBlock _Nullable data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsTimerBlockBlock _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsTimerBlock _Nullable data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsTimerPointerBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsTimer * _Nullable data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSLockPointerBlock _Nonnull)byLock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSLock * _Nullable data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSRecursiveLockPointerBlock _Nonnull)byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSRecursiveLock * _Nullable data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByDispatch_semaphore_tBlock _Nonnull)bySemaphore{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(dispatch_semaphore_t _Nullable data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsLock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsRead{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByAppLanguageBlock _Nonnull)byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGPointBlock _Nonnull)byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByWKUserContentControllerPointerBlock _Nonnull)byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(WKUserContentController * _Nullable data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByWKScriptMessagePointerBlock _Nonnull)byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(WKScriptMessage * _Nullable data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byHandlerName{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsJSCompletionHandlerBlockBlock _Nonnull)byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsJSCompletionHandlerBlock _Nullable data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayNSURLPointerPointerBlock _Nonnull)byUrls{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <NSURL *> * _Nullable data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByURLBlock _Nonnull)byImageUrl{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByStrBlock _Nonnull)byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByMutableSetBlock _Nonnull)byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableSet * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayPointerBlock _Nonnull)byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableDictionaryPointerBlock _Nonnull)byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(Class _Nullable data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(JobsRetJobsBaseModelBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(SEL _Nullable data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIMPBlock _Nonnull)byImplementation{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(IMP _Nullable data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byWeak_target{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byModelData{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGFloatBlock _Nonnull)byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSIntegerBlock _Nonnull)byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSUIntegerBlock _Nonnull)byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byData_weak{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByIDBlock _Nonnull)byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIViewModelPointerBlock _Nonnull)byViewModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIViewModelPointerBlock _Nonnull)byViewModel_weak{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel_weak = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonModelPointerBlock _Nonnull)byButtonModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonModelPointerBlock _Nonnull)bySubButtonModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.subButtonModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITextModelPointerBlock _Nonnull)byTextModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.textModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITextModelPointerBlock _Nonnull)bySubTextModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.subTextModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITextModelPointerBlock _Nonnull)byBackBtnTitleModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnTitleModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayKindofUIViewModelPointerPointerBlock _Nonnull)byViewModels{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <__kindof UIViewModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.viewModels = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock _Nonnull)byButtonModels{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <__kindof UIButtonModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModels = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)byTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.titleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedSubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonPointerBlock _Nonnull)byBackBtn{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.backBtn = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonModelPointerBlock _Nonnull)byCloseBtnModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonModelPointerBlock _Nonnull)byBackBtnModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIViewModelPointerBlock _Nonnull)byTitleModel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.titleModel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIActivityIndicatorViewPointerBlock _Nonnull)byActivityIndicatorView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIActivityIndicatorView * _Nullable data) {
        @jobs_strongify(self)
        self.activityIndicatorView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIStackViewPointerBlock _Nonnull)byStackView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIStackView * _Nullable data) {
        @jobs_strongify(self)
        self.stackView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByKindofUIViewPointerBlock _Nonnull)byViewer{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.viewer = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUICollectionViewPointerBlock _Nonnull)byCollectionView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UICollectionView * _Nullable data) {
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITableViewPointerBlock _Nonnull)byTableView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UITableView * _Nullable data) {
        @jobs_strongify(self)
        self.tableView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIScrollViewPointerBlock _Nonnull)byScrollView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIScrollView * _Nullable data) {
        @jobs_strongify(self)
        self.scrollView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByWKWebViewPointerBlock _Nonnull)byWebView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof WKWebView * _Nullable data) {
        @jobs_strongify(self)
        self.webView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByPDFViewPointerBlock _Nonnull)byPdfView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof PDFView * _Nullable data) {
        @jobs_strongify(self)
        self.pdfView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByKindofUIImageViewPointerBlock _Nonnull)byImageView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIButtonPointerBlock _Nonnull)byButton{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.button = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUILabelPointerBlock _Nonnull)byLabel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.label = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUILabelPointerBlock _Nonnull)bySubLabel{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.subLabel = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITextViewPointerBlock _Nonnull)byTextView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UITextView * _Nullable data) {
        @jobs_strongify(self)
        self.textView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelBySZTextViewPointerBlock _Nonnull)bySzTextView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof SZTextView * _Nullable data) {
        @jobs_strongify(self)
        self.szTextView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUITextFieldPointerBlock _Nonnull)byTextField{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.textField = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsTextViewPointerBlock _Nonnull)byJobsTextView{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof JobsTextView * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextView = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsMagicTextFieldPointerBlock _Nonnull)byMagicTextField{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof JobsMagicTextField * _Nullable data) {
        @jobs_strongify(self)
        self.magicTextField = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByZYTextFieldPointerBlock _Nonnull)byZyTextField{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof ZYTextField * _Nullable data) {
        @jobs_strongify(self)
        self.zyTextField = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByHQTextFieldPointerBlock _Nonnull)byHqTextField{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof HQTextField * _Nullable data) {
        @jobs_strongify(self)
        self.hqTextField = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCJTextFieldPointerBlock _Nonnull)byCjTextField{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof CJTextField * _Nullable data) {
        @jobs_strongify(self)
        self.cjTextField = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsTextFieldPointerBlock _Nonnull)byJobsTextField{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(__kindof JobsTextField * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextField = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByBOOLBlock _Nonnull)byIsAllowDrag{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isAllowDrag = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBackBlock{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBackBlock = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByUIRectCornerBlock _Nonnull)byLayoutSubviewsRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCorner = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byLayoutSubviewsRectCornerSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCornerSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCorBlock _Nonnull)byLayerCor{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerCor = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByNSMutableArrayMASConstraintPointerPointerBlock _Nonnull)byConstraintMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(NSMutableArray <MASConstraint *> * _Nullable data) {
        @jobs_strongify(self)
        self.constraintMutArr = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByCGSizeBlock _Nonnull)byThisViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.thisViewSize = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsHeaderFooterViewStyleBlock _Nonnull)byHeaderFooterViewStyle{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(JobsHeaderFooterViewStyle data) {
        @jobs_strongify(self)
        self.headerFooterViewStyle = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByBtnBlockBlock _Nonnull)byBackBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.backBtnClickAction = data;
        return self;
    };
}

-(JobsRetJobsBaseModelByJobsByBtnBlockBlock _Nonnull)byCloseBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsBaseModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnClickAction = data;
        return self;
    };
}

@end
