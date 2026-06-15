//
//  JhtBannerScrollView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JhtBannerScrollViewProtocol.h"
#import "JhtBannerCardView.h"

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

#ifndef WidthScale375
#define WidthScale375 (([[UIScreen mainScreen] bounds].size.width) / 375)
#endif /* WidthScale375 */

static const NSString * _Nullable subviewClassName = @"JhtBannerCardView";
/// banner view（整条view）
@interface JhtBannerScrollView : UIView <UIScrollViewDelegate>
/// 滚动方向：default: BV_Orientation_Horizontal
Prop_assign()JhtBannerViewOrientation orientation;
/// 非当前页的透明比例（蒙板View alpha）default: 0.4
Prop_assign()CGFloat minCoverViewAlpha;
/// View之间 左右间距 default: 20.0
Prop_assign()CGFloat leftRightMargin;
/// 两侧小View与中间View 高度差 default: 15.0
Prop_assign()CGFloat topBottomMargin;
/// 是否开启自动滚动 default: YES
Prop_assign()BOOL isOpenAutoScroll;
/// 是否开启无限轮播 default: YES
Prop_assign()BOOL isCarousel;
/// 自动切换视图 时间 default: 3.0
Prop_assign()NSTimeInterval autoTime;
/// 当前是第几页
Prop_assign(readonly)NSInteger currentIndex;
/// pageControl（自定义扩展）
Prop_strong(nullable)UIPageControl *pageControl;
Prop_assign(nullable)id<JhtBannerScrollViewDataSource> dataSource;
Prop_assign(nullable)id<JhtBannerScrollViewDelegate> delegate;

+(JobsRetJhtBannerScrollViewByFrameBlock _Nonnull)initByFrame;
/// 刷新视图
-(void)reloadData;
/// 获取可重复使用的卡片View（cardView）
-(UIView *_Nullable)dequeueReusableView;
/// 滚动到指定的页面
-(jobsByNSUIntegerBlock _Nonnull)scrollToPageByPageNumber;
/// 继续滚动
-(void)continueScroll;
/// 暂停滚动
-(void)pauseScroll;

@end
