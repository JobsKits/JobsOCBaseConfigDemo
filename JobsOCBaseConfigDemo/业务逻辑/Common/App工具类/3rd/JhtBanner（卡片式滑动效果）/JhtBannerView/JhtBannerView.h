//
//  JhtBannerView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JhtBannerScrollView.h"
#import "JhtBannerScrollViewProtocol.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

/// banner ScrollView
@interface JhtBannerView : UIView
<
JhtBannerScrollViewDelegate
,JhtBannerScrollViewDataSource
>
/// 图片数组
/// tips: [imageStr containsString:@"http"] ? 网络图片 : 本地图片（不会使用placeholderImageName作为占位图）
Prop_copy(nonnull)NSArray *dataArr; /// 可以是UIImage 也可以是NSString
Prop_strong(nonnull)JhtBannerScrollView *bannerView;
/// 占位图片名（本地）
Prop_copy(nullable)NSString *placeholderImageName;
/// 占位名（本地）
Prop_copy(nullable)NSString *placeholderName;
/// 当前显示cardView的Size
Prop_assign()CGSize JhtBannerCardViewSize;
/// 点击ScrollView内部卡片
-(void)clickScrollViewInsideCardView:(jobsByIDBlock _Nonnull)clickBlock;
/// 滚动ScrollView内部卡片
-(void)scrollViewIndex:(jobsByIDBlock _Nonnull)scrollBlock;

@end
