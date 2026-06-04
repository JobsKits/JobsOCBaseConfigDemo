//
//  FMBannerAdsModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "FMBannerAdsModel+DSL.h"

@implementation FMBannerAdsModel (DSL)

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byAccountName{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.accountName = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFMAccTypeBlock _Nonnull)byAccountType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(FMAccType data) {
        @jobs_strongify(self)
        self.accountType = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byAdvStatus{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.advStatus = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFMAdsTypeBlock _Nonnull)byAdvType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(FMAdsType data) {
        @jobs_strongify(self)
        self.advType = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byAndroidImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.androidImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byCarouselTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.carouselTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byCreateBy{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.createBy = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byEndingTime{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.endingTime = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byH5Image{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.h5Image = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byH5SmallImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.h5SmallImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byIntroduction{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.introduction = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byIosImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.iosImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byJumpParameter{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.jumpParameter = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFMJumpTypeBlock _Nonnull)byJumpType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(FMJumpType data) {
        @jobs_strongify(self)
        self.jumpType = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byPort{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.port = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byShowForGuest{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.showForGuest = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byStartingTime{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.startingTime = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)byTenantId{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.tenantId = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byUpdateBy{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.updateBy = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byUpdateTime{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.updateTime = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byVipLimitGroup{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.vipLimitGroup = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byWebImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.webImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byWebSmallImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.webSmallImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byContent{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.content = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsSwitchType2Block _Nonnull)byStatus{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(JobsSwitchType2 data) {
        @jobs_strongify(self)
        self.status = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)bySortNum{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.sortNum = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIRectCornerBlock _Nonnull)byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsTop{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsRight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSUIntegerBlock _Nonnull)byLocation{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byJobsSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byJobsRect{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGPointBlock _Nonnull)byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIRectCornerBlock _Nonnull)byRectCorner{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUILayoutConstraintAxisBlock _Nonnull)byAxis{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIStackViewDistributionBlock _Nonnull)byDistribution{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIStackViewAlignmentBlock _Nonnull)byAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)bySection{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)byItem{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)byRow{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSDirectionalRectEdgeBlock _Nonnull)byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.HeightForHeaderInSection = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byCellWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byCellHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byCellSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.CellSize = data;
        return self;
    };
}





-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIndexPathPointerBlock _Nonnull)byIndexPath{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSIndexPath * _Nullable data) {
        @jobs_strongify(self)
        self.indexPath = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNumberBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNumberBlock _Nonnull)byPageSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNumberBlock _Nonnull)byPageNum{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageNum = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGPointBlock _Nonnull)byLastPoint{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastPoint = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)byIndex{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byIsMark{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMark = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byPresentUpHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.presentUpHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byNavBgImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.navBgImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byNavBgCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.navBgCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byBgImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.imageURLString = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageURLString = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byBgCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byBackBtnIMG{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnIMG = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgConfig{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgConfig = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)bySelectedImage_{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImage_ = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byBgSelectedImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)bySelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImageURLString = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byBgSelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImageURLString = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byBgSelectedCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byBackBtnSelectedIMG{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnSelectedIMG = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgSelectedConfig{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedConfig = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIImageViewPointerBlock _Nonnull)byBgImageView{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageView = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSTextAlignmentBlock _Nonnull)bySubTextAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTextAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSLineBreakModeBlock _Nonnull)bySubLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subLineBreakMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLineSpacing{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLineSpacing = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)byCurWordCount{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.curWordCount = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSIntegerBlock _Nonnull)byMaxWordCount{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.maxWordCount = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock _Nonnull)byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)bySubText{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subText = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)bySubFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySubTextCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTextCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock _Nonnull)byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)bySelectedText{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedText = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)bySelectedFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySelectedTextCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTextCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedText{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedText = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)bySelectedSubText{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubText = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)bySelectedSubFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySelectedSubTextCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTextCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubText{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubText = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.Alpha = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byLayerBorderWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerBorderWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byLayerCornerRadius{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerCornerRadius = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byIsTranslucent{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isTranslucent = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byIsVisible{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isVisible = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byIsInvisible{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isInvisible = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byIsMultiLineShows{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMultiLineShows = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUILabelShowingTypeBlock _Nonnull)byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.labelShowingType = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSUIntegerBlock _Nonnull)byJobsTag{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByComingStyleBlock _Nonnull)byPushOrPresent{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(ComingStyle data) {
        @jobs_strongify(self)
        self.pushOrPresent = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIActionPointerBlock _Nonnull)byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIAction * _Nullable data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsRetIDByIDBlockBlock _Nonnull)byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsRetIDByIDBlockBlock _Nonnull)byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsByBtnBlockBlock _Nonnull)byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsByBtnBlockBlock _Nonnull)byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIViewPointerBlock _Nonnull)byVIEW{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.VIEW = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIViewControllerPointerBlock _Nonnull)byVC{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.VC = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIControlContentHorizontalAlignmentBlock _Nonnull)byContentHorizontalAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIControlContentHorizontalAlignment data) {
        @jobs_strongify(self)
        self.contentHorizontalAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIControlContentVerticalAlignmentBlock _Nonnull)byContentVerticalAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIControlContentVerticalAlignment data) {
        @jobs_strongify(self)
        self.contentVerticalAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSDirectionalEdgeInsetsBlock _Nonnull)byContentInsets{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        self.contentInsets = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIEdgeInsets data) {
        @jobs_strongify(self)
        self.contentEdgeInsets = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.baseBackgroundColor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySelectedBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedBaseBackgroundColor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySelectedLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedLayerBorderCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byNormalBorderWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.normalBorderWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySelectedBorderWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.selectedBorderWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImagePadding{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imagePadding = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTitlePadding{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titlePadding = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSDirectionalRectEdgeBlock _Nonnull)byImagePlacement{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.imagePlacement = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUILabelShowingTypeBlock _Nonnull)byTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.titleShowingType = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUILabelShowingTypeBlock _Nonnull)bySubTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.subTitleShowingType = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byImageSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byContentSpacing{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSpacing = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byBtnWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.btnWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)bySubTitleFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)byTitleCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.titleCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySubTitleCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSTextAlignmentBlock _Nonnull)byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.titleAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSTextAlignmentBlock _Nonnull)bySubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTitleAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)byButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.buttonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSLineBreakModeBlock _Nonnull)byTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.titleLineBreakMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)bySelectedTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)bySelectedSubTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)bySelectedTitleFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)bySelectedSubTitleFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySelectedTitleCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCorBlock _Nonnull)bySelectedSubTitleCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleCor = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSTextAlignmentBlock _Nonnull)bySelectedTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedTitleAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSTextAlignmentBlock _Nonnull)bySelectedSubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedSubTitleAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)bySelectedButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.selectedButtonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSLineBreakModeBlock _Nonnull)bySelectedTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedTitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSLineBreakModeBlock _Nonnull)bySelectedSubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedSubtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byNormalImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.normalImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byHighlightBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightBackgroundImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byHighlightImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubTitle = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textLabelFrame = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)bySubTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.subTextLabelFrame = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byBtnImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.btnImageViewFrame = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.textLabelSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)bySubTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.subTextLabelSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGSizeBlock _Nonnull)byImageViewSize{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageViewSize = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewFrameResetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewFrameResetY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetY = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFontBlock _Nonnull)byTextFont{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.textFont = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byTextFieldPlaceholder{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.textFieldPlaceholder = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSAttributedStringPointerBlock _Nonnull)byAttributedPlaceholder{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedPlaceholder = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByNSTextAlignmentBlock _Nonnull)byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byText_offset{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByKindofUIViewPointerBlock _Nonnull)byLeftView{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.leftView = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByKindofUIViewPointerBlock _Nonnull)byRightView{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.rightView = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUITextFieldViewModeBlock _Nonnull)byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUITextFieldViewModeBlock _Nonnull)byRightViewMode{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.rightViewMode = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byIsShowMenu{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowMenu = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byNotAllowEdit{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.notAllowEdit = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByBOOLBlock _Nonnull)byTextFieldSecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.textFieldSecureTextEntry = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByCGFloatBlock _Nonnull)byTFRiseHeight{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.TFRiseHeight = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance_ = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIKeyboardTypeBlock _Nonnull)byKeyboardType_{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType_ = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType_ = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byBorderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.borderRectForBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByMutableDicBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByMutableArrayBlock _Nonnull)byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSMutableArray <JobsRetIDByIDBlock> * _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByURLBlock _Nonnull)byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByStrBlock _Nonnull)byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByURLBlock _Nonnull)byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByImageBlock _Nonnull)byTitleImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByJobsByMASConstraintMakerBlockBlock _Nonnull)byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(jobsByMASConstraintMakerBlock _Nullable data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(JobsRetFMBannerAdsModelByFrameBlock _Nonnull)byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

@end
