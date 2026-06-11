//
//  FMBannerAdsModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "FMBannerAdsModel+DSL.h"

@implementation FMBannerAdsModel (DSL)

#pragma mark —— 来自 FMBannerAdsModel
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byAccountName{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.accountName = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(FMAccType data))byAccountType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(FMAccType data) {
        @jobs_strongify(self)
        self.accountType = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(BOOL data))byAdvStatus{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.advStatus = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(FMAdsType data))byAdvType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(FMAdsType data) {
        @jobs_strongify(self)
        self.advType = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byAndroidImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.androidImage = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byCarouselTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.carouselTitle = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateBy{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.createBy = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byEndingTime{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.endingTime = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byH5Image{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.h5Image = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byH5SmallImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.h5SmallImage = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byIntroduction{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.introduction = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byIosImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.iosImage = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byJumpParameter{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.jumpParameter = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(FMJumpType data))byJumpType{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(FMJumpType data) {
        @jobs_strongify(self)
        self.jumpType = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byPort{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.port = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(BOOL data))byShowForGuest{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.showForGuest = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byStartingTime{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.startingTime = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSInteger data))byTenantId{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.tenantId = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateBy{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.updateBy = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateTime{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.updateTime = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byVipLimitGroup{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.vipLimitGroup = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byWebImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.webImage = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byWebSmallImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.webSmallImage = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byContent{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.content = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(JobsSwitchType2 data))byStatus{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(JobsSwitchType2 data) {
        @jobs_strongify(self)
        self.status = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSInteger data))byID{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSInteger data))bySortNum{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.sortNum = data;
        return self;
    };
}

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSMutableArray <JobsRetIDByIDBlock> * data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(jobsByMASConstraintMakerBlock data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof FMBannerAdsModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

@end
