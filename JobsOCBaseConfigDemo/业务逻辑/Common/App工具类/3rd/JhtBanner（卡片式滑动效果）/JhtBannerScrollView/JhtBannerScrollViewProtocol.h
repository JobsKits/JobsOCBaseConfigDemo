//
//  JhtBannerScrollViewProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#ifndef JhtBannerScrollViewProtocol_h
#define JhtBannerScrollViewProtocol_h
@class JhtBannerScrollView;
#pragma mark —— JhtBannerScrollViewDelegate
@protocol JhtBannerScrollViewDelegate <NSObject>
@optional
/// 当前显示cardView Size
-(JobsRetCGSizeByJhtBannerScrollViewBlock _Nonnull)sizeForCurrentCardViewInBannerView;
/// 滚动到了某一个cardView
- (void)bannerView:(JhtBannerScrollView *_Nonnull)bannerView didScrollToCardViewWithIndex:(NSInteger)index;
/// 点击了第几个cardView
-(void)bannerView:(JhtBannerScrollView *_Nonnull)bannerView
didSelectCardView:(UIView *_Nonnull)cardView
withCardViewIndex:(NSInteger)index;

@end
#pragma mark —— JhtBannerScrollViewDataSource
@protocol JhtBannerScrollViewDataSource <NSObject>
@required
/// 显示cardView 个数
-(JobsRetNSIntegerByJhtBannerScrollViewBlock _Nonnull)numberOfCardViewInBannerView;
/// 单个cardView
-(UIView *_Nonnull)bannerView:(JhtBannerScrollView *_Nonnull)bannerView cardViewForBannerViewAtIndex:(NSInteger)index;

@end

#endif /* JhtBannerScrollViewProtocol_h */
