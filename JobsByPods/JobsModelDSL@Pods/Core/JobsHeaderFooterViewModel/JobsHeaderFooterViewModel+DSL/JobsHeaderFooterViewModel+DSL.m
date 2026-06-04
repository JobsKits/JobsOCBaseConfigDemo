//
//  JobsHeaderFooterViewModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsHeaderFooterViewModel+DSL.h"

@implementation JobsHeaderFooterViewModel (DSL)

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byUseHeaderView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.useHeaderView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byUseFooterView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.useFooterView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIRectCornerBlock _Nonnull)byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsTop{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsRight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSUIntegerBlock _Nonnull)byLocation{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byJobsSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byJobsRect{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGPointBlock _Nonnull)byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIRectCornerBlock _Nonnull)byRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUILayoutConstraintAxisBlock _Nonnull)byAxis{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIStackViewDistributionBlock _Nonnull)byDistribution{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIStackViewAlignmentBlock _Nonnull)byAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIntegerBlock _Nonnull)bySection{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIntegerBlock _Nonnull)byItem{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIntegerBlock _Nonnull)byRow{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSDirectionalRectEdgeBlock _Nonnull)byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.HeightForHeaderInSection = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byCellWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byCellHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byCellSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.CellSize = data;
        return self;
    };
}





-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIndexPathPointerBlock _Nonnull)byIndexPath{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSIndexPath * _Nullable data) {
        @jobs_strongify(self)
        self.indexPath = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNumberBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNumberBlock _Nonnull)byPageSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNumberBlock _Nonnull)byPageNum{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageNum = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGPointBlock _Nonnull)byLastPoint{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastPoint = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIntegerBlock _Nonnull)byIndex{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsMark{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMark = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byPresentUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.presentUpHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byNavBgImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.navBgImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byNavBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.navBgCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byBgImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.imageURLString = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageURLString = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byBackBtnIMG{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnIMG = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgConfig{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgConfig = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)bySelectedImage_{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImage_ = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byBgSelectedImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)bySelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImageURLString = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byBgSelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImageURLString = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byBgSelectedCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byBackBtnSelectedIMG{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnSelectedIMG = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgSelectedConfig{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedConfig = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIImageViewPointerBlock _Nonnull)byBgImageView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock _Nonnull)bySubTextAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTextAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSLineBreakModeBlock _Nonnull)bySubLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLineSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLineSpacing = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIntegerBlock _Nonnull)byCurWordCount{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.curWordCount = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIntegerBlock _Nonnull)byMaxWordCount{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.maxWordCount = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock _Nonnull)byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)bySubText{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subText = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)bySubFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySubTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTextCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock _Nonnull)byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)bySelectedText{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedText = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)bySelectedFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySelectedTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTextCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedText{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedText = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)bySelectedSubText{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubText = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)bySelectedSubFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySelectedSubTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTextCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubText{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubText = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.Alpha = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byLayerBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byLayerCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerCornerRadius = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsTranslucent{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isTranslucent = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsVisible{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isVisible = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsInvisible{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isInvisible = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsMultiLineShows{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMultiLineShows = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUILabelShowingTypeBlock _Nonnull)byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.labelShowingType = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSUIntegerBlock _Nonnull)byJobsTag{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByComingStyleBlock _Nonnull)byPushOrPresent{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(ComingStyle data) {
        @jobs_strongify(self)
        self.pushOrPresent = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIActionPointerBlock _Nonnull)byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIAction * _Nullable data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsRetIDByIDBlockBlock _Nonnull)byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsRetIDByIDBlockBlock _Nonnull)byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByBtnBlockBlock _Nonnull)byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByBtnBlockBlock _Nonnull)byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIViewPointerBlock _Nonnull)byVIEW{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.VIEW = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIViewControllerPointerBlock _Nonnull)byVC{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.VC = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIControlContentHorizontalAlignmentBlock _Nonnull)byContentHorizontalAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIControlContentHorizontalAlignment data) {
        @jobs_strongify(self)
        self.contentHorizontalAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIControlContentVerticalAlignmentBlock _Nonnull)byContentVerticalAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIControlContentVerticalAlignment data) {
        @jobs_strongify(self)
        self.contentVerticalAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSDirectionalEdgeInsetsBlock _Nonnull)byContentInsets{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        self.contentInsets = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIEdgeInsets data) {
        @jobs_strongify(self)
        self.contentEdgeInsets = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.baseBackgroundColor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySelectedBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedBaseBackgroundColor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySelectedLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedLayerBorderCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byNormalBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.normalBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySelectedBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.selectedBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImagePadding{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imagePadding = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTitlePadding{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titlePadding = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSDirectionalRectEdgeBlock _Nonnull)byImagePlacement{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.imagePlacement = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUILabelShowingTypeBlock _Nonnull)byTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.titleShowingType = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUILabelShowingTypeBlock _Nonnull)bySubTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.subTitleShowingType = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byImageSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byContentSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSpacing = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byBtnWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.btnWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)bySubTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.titleCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySubTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock _Nonnull)byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.titleAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock _Nonnull)bySubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)byButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.buttonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSLineBreakModeBlock _Nonnull)byTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.titleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)bySelectedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)bySelectedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)bySelectedTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)bySelectedSubTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySelectedTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)bySelectedSubTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock _Nonnull)bySelectedTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock _Nonnull)bySelectedSubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedSubTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)bySelectedButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.selectedButtonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSLineBreakModeBlock _Nonnull)bySelectedTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedTitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSLineBreakModeBlock _Nonnull)bySelectedSubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedSubtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byNormalImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.normalImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byHighlightBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightBackgroundImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byHighlightImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedTitle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textLabelFrame = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)bySubTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.subTextLabelFrame = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byBtnImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.btnImageViewFrame = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.textLabelSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)bySubTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.subTextLabelSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byImageViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageViewSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFontBlock _Nonnull)byTextFont{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.textFont = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byTextFieldPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.textFieldPlaceholder = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSAttributedStringPointerBlock _Nonnull)byAttributedPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedPlaceholder = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTextAlignmentBlock _Nonnull)byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byText_offset{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByKindofUIViewPointerBlock _Nonnull)byLeftView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.leftView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByKindofUIViewPointerBlock _Nonnull)byRightView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.rightView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITextFieldViewModeBlock _Nonnull)byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITextFieldViewModeBlock _Nonnull)byRightViewMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.rightViewMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsShowMenu{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowMenu = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byNotAllowEdit{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.notAllowEdit = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byTextFieldSecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.textFieldSecureTextEntry = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTFRiseHeight{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.TFRiseHeight = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance_ = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIKeyboardTypeBlock _Nonnull)byKeyboardType_{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType_ = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType_ = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byBorderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.borderRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock _Nonnull)byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <JobsRetIDByIDBlock> * _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByURLBlock _Nonnull)byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByURLBlock _Nonnull)byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByImageBlock _Nonnull)byTitleImage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByMASConstraintMakerBlockBlock _Nonnull)byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByMASConstraintMakerBlock _Nullable data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByFrameBlock _Nonnull)byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByTimeIntervalBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByTimeIntervalBlock _Nonnull)byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByTimeIntervalBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSInvocationPointerBlock _Nonnull)byInvocation{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInvocation * _Nullable data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSRunLoopModeBlock _Nonnull)byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByShowTimeTypeBlock _Nonnull)byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsTimerStyleBlock _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsTimerTypeBlock _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByTimeIntervalBlock _Nonnull)byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByDateBlock _Nonnull)byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSTimerPointerBlock _Nonnull)byNsTimer{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSTimer * _Nullable data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByDispatch_source_tBlock _Nonnull)byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(dispatch_source_t _Nullable data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCADisplayLinkPointerBlock _Nonnull)byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CADisplayLink * _Nullable data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByDispatch_queue_tBlock _Nonnull)byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(dispatch_queue_t _Nullable data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsTimerStateBlock _Nonnull)byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByCGFloatBlockBlock _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByCGFloatBlock _Nullable data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsTimerBlockBlock _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsTimerBlock _Nullable data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsTimerPointerBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsTimer * _Nullable data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSLockPointerBlock _Nonnull)byLock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSLock * _Nullable data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSRecursiveLockPointerBlock _Nonnull)byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSRecursiveLock * _Nullable data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByDispatch_semaphore_tBlock _Nonnull)bySemaphore{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(dispatch_semaphore_t _Nullable data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsLock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsRead{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByAppLanguageBlock _Nonnull)byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGPointBlock _Nonnull)byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByWKUserContentControllerPointerBlock _Nonnull)byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(WKUserContentController * _Nullable data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByWKScriptMessagePointerBlock _Nonnull)byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(WKScriptMessage * _Nullable data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byHandlerName{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsJSCompletionHandlerBlockBlock _Nonnull)byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsJSCompletionHandlerBlock _Nullable data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayNSURLPointerPointerBlock _Nonnull)byUrls{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <NSURL *> * _Nullable data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByURLBlock _Nonnull)byImageUrl{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByStrBlock _Nonnull)byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByMutableSetBlock _Nonnull)byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableSet * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayPointerBlock _Nonnull)byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableDictionaryPointerBlock _Nonnull)byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(Class _Nullable data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(SEL _Nullable data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIMPBlock _Nonnull)byImplementation{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(IMP _Nullable data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byWeak_target{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byModelData{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGFloatBlock _Nonnull)byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSIntegerBlock _Nonnull)byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSUIntegerBlock _Nonnull)byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byData_weak{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByIDBlock _Nonnull)byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIViewModelPointerBlock _Nonnull)byViewModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIViewModelPointerBlock _Nonnull)byViewModel_weak{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel_weak = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonModelPointerBlock _Nonnull)byButtonModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonModelPointerBlock _Nonnull)bySubButtonModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.subButtonModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITextModelPointerBlock _Nonnull)byTextModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.textModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITextModelPointerBlock _Nonnull)bySubTextModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.subTextModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITextModelPointerBlock _Nonnull)byBackBtnTitleModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnTitleModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayKindofUIViewModelPointerPointerBlock _Nonnull)byViewModels{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <__kindof UIViewModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.viewModels = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock _Nonnull)byButtonModels{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <__kindof UIButtonModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModels = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)byTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.titleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedSubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonPointerBlock _Nonnull)byBackBtn{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.backBtn = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonModelPointerBlock _Nonnull)byCloseBtnModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonModelPointerBlock _Nonnull)byBackBtnModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIViewModelPointerBlock _Nonnull)byTitleModel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.titleModel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIActivityIndicatorViewPointerBlock _Nonnull)byActivityIndicatorView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIActivityIndicatorView * _Nullable data) {
        @jobs_strongify(self)
        self.activityIndicatorView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIStackViewPointerBlock _Nonnull)byStackView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIStackView * _Nullable data) {
        @jobs_strongify(self)
        self.stackView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByKindofUIViewPointerBlock _Nonnull)byViewer{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.viewer = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUICollectionViewPointerBlock _Nonnull)byCollectionView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UICollectionView * _Nullable data) {
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITableViewPointerBlock _Nonnull)byTableView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UITableView * _Nullable data) {
        @jobs_strongify(self)
        self.tableView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIScrollViewPointerBlock _Nonnull)byScrollView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIScrollView * _Nullable data) {
        @jobs_strongify(self)
        self.scrollView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByWKWebViewPointerBlock _Nonnull)byWebView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof WKWebView * _Nullable data) {
        @jobs_strongify(self)
        self.webView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByPDFViewPointerBlock _Nonnull)byPdfView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof PDFView * _Nullable data) {
        @jobs_strongify(self)
        self.pdfView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByKindofUIImageViewPointerBlock _Nonnull)byImageView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIButtonPointerBlock _Nonnull)byButton{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.button = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUILabelPointerBlock _Nonnull)byLabel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.label = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUILabelPointerBlock _Nonnull)bySubLabel{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.subLabel = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITextViewPointerBlock _Nonnull)byTextView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UITextView * _Nullable data) {
        @jobs_strongify(self)
        self.textView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelBySZTextViewPointerBlock _Nonnull)bySzTextView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof SZTextView * _Nullable data) {
        @jobs_strongify(self)
        self.szTextView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUITextFieldPointerBlock _Nonnull)byTextField{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.textField = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsTextViewPointerBlock _Nonnull)byJobsTextView{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof JobsTextView * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextView = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsMagicTextFieldPointerBlock _Nonnull)byMagicTextField{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof JobsMagicTextField * _Nullable data) {
        @jobs_strongify(self)
        self.magicTextField = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByZYTextFieldPointerBlock _Nonnull)byZyTextField{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof ZYTextField * _Nullable data) {
        @jobs_strongify(self)
        self.zyTextField = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByHQTextFieldPointerBlock _Nonnull)byHqTextField{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof HQTextField * _Nullable data) {
        @jobs_strongify(self)
        self.hqTextField = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCJTextFieldPointerBlock _Nonnull)byCjTextField{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof CJTextField * _Nullable data) {
        @jobs_strongify(self)
        self.cjTextField = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsTextFieldPointerBlock _Nonnull)byJobsTextField{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(__kindof JobsTextField * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextField = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByBOOLBlock _Nonnull)byIsAllowDrag{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isAllowDrag = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBackBlock{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBackBlock = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByUIRectCornerBlock _Nonnull)byLayoutSubviewsRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCorner = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byLayoutSubviewsRectCornerSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCornerSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCorBlock _Nonnull)byLayerCor{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerCor = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByNSMutableArrayMASConstraintPointerPointerBlock _Nonnull)byConstraintMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(NSMutableArray <MASConstraint *> * _Nullable data) {
        @jobs_strongify(self)
        self.constraintMutArr = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByCGSizeBlock _Nonnull)byThisViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.thisViewSize = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsHeaderFooterViewStyleBlock _Nonnull)byHeaderFooterViewStyle{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(JobsHeaderFooterViewStyle data) {
        @jobs_strongify(self)
        self.headerFooterViewStyle = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByBtnBlockBlock _Nonnull)byBackBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.backBtnClickAction = data;
        return self;
    };
}

-(JobsRetJobsHeaderFooterViewModelByJobsByBtnBlockBlock _Nonnull)byCloseBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsHeaderFooterViewModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnClickAction = data;
        return self;
    };
}

@end
