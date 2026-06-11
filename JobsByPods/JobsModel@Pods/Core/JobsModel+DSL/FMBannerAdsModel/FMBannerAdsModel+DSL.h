//
//  FMBannerAdsModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FMBANNERADSMODEL_DSL_69D2CD26FC5B45EB
#define JOBS_HEADER_GUARD_FMBANNERADSMODEL_DSL_69D2CD26FC5B45EB

#if __has_include(<JobsModel/FMBannerAdsModel.h>)
#import <JobsModel/FMBannerAdsModel.h>
#else
#import "FMBannerAdsModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMBannerAdsModel (DSL)

#pragma mark —— 来自 FMBannerAdsModel
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byAccountName;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(FMAccType data))byAccountType;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(BOOL data))byAdvStatus;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(FMAdsType data))byAdvType;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byAndroidImage;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byCarouselTitle;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateBy;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byEndingTime;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byH5Image;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byH5SmallImage;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byIntroduction;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byIosImage;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byJumpParameter;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(FMJumpType data))byJumpType;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byPort;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(BOOL data))byShowForGuest;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byStartingTime;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSInteger data))byTenantId;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateBy;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateTime;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byVipLimitGroup;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byWebImage;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byWebSmallImage;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byContent;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(JobsSwitchType2 data))byStatus;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSInteger data))byID;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSInteger data))bySortNum;

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame;

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth;
-(__kindof FMBannerAdsModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FMBANNERADSMODEL_DSL_69D2CD26FC5B45EB */
