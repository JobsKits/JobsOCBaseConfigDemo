//
//  WMZBannerView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "WMZBannerParam.h"
#import "WMZBannerFlowLayout.h"
#import "WMZBannerControl.h"
#import "WMZBannerOverLayout.h"
#import "WMZBannerFadeLayout.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface WMZBannerView : UIView
<
UICollectionViewDelegate
,UICollectionViewDataSource
>
/// 背景图
Prop_strong()UIImageView *bgImgView;
/// 调用方法
- (instancetype)initConfigureWithModel:(WMZBannerParam *)param withView:(UIView*)parentView;
/// 调用方法
- (instancetype)initConfigureWithModel:(WMZBannerParam *)param;
+(JobsRetWMZBannerViewByBannerParamBlock _Nonnull)initBy;
/// 更新UI
- (void)updateUI;
/// 手动调用滚动
- (void)scrolToPath:(NSIndexPath*)path animated:(BOOL)animated;

@end

@interface Collectioncell : UICollectionViewCell

Prop_strong()UIImageView *icon;
Prop_strong()WMZBannerParam *param;

@end

@interface CollectionTextCell : UICollectionViewCell

Prop_strong()UILabel *label;
Prop_strong()WMZBannerParam *param;

@end

NS_ASSUME_NONNULL_END
