//
//  JhtBannerView.h
//  JobsOCBaseConfigDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jinht on 2017/6/2.
//  Copyright © 2017年 JhtBannerScrollView. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JhtBannerScrollView.h"
#import "JobsDefineConstString.h"
#import "JhtBannerScrollViewProtocol.h"

/// banner ScrollView
#import "JobsDefineProperty.h"

@interface JhtBannerView : UIView
<
JhtBannerScrollViewDelegate
,JhtBannerScrollViewDataSource
>
/** 图片数组
 *  tips: [imageStr containsString:@"http"] ? 网络图片 : 本地图片（不会使用placeholderImageName作为占位图）
 */
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
/** 滚动ScrollView内部卡片 */
-(void)scrollViewIndex:(jobsByIDBlock _Nonnull)scrollBlock;

@end
