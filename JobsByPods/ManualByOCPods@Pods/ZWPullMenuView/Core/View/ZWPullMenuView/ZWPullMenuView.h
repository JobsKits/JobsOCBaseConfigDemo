//
//  ZWPullMenuView.h
//  ZWPullMenuView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <ZWPullMenuView/ZWPullMenuCell.h>
#import <ZWPullMenuView/ZWPullMenuModel.h>
#import <ZWPullMenuView/ZWPullMenuConfig.h>

#if __has_include(<JobsGetWindow/window.h>)
#import <JobsGetWindow/window.h>
#else
#import "window.h"
#endif

#if __has_include(<JobsByOCPods/UIKits.h>)
#import <JobsByOCPods/UIKits.h>
#else
#import "UIKits.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef void(^BlockSelectedMenu)(NSInteger menuRow); // selected

@interface ZWPullMenuView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>
/// 文字
Prop_copy()NSArray *titleArray;

/// 图片
Prop_copy()NSArray *imageArray;
/// 图文Model
Prop_copy()NSArray<ZWPullMenuModel *> *menuArray;
/// 相关配置
Prop_strong()ZWPullMenuConfig *zw_menuConfg;
/// 蒙层背景color
Prop_strong()UIColor *coverBgColor;
/// 主样式color
Prop_strong()UIColor *menuBgColor;
/// 线条颜色
Prop_strong()UIColor *lineColor;
/// cell高度
Prop_assign()CGFloat menuCellHeight;
/// table最大高度限制
/// 默认：5 * cellHeight
Prop_assign()CGFloat menuMaxHeight;
/// 小三角高度
/// 45°等腰三角形
Prop_assign()CGFloat triangleHeight;
/// 调整使下拉优先 当向下偏转屏幕距离足够，优先向下偏转
Prop_assign()BOOL zw_adjustPullDown;
/// pullMenu样式
Prop_assign()ZWPullMenuStyle zwPullMenuStyle;
/// click
Prop_copy()BlockSelectedMenu blockSelectedMenu;
/**
 *  anchorView：下拉依赖视图[推荐初始化]
 *  箭头指向依赖视图
 *  titleArray:文字
 *  imageArray:icon
 *  menuArray:图文Model
 */
+ (instancetype)pullMenuAnchorView:(UIView *)anchorView;
+ (instancetype)pullMenuAnchorView:(UIView *)anchorView titleArray:(nullable NSArray *)titleArray;
+ (instancetype)pullMenuAnchorView:(UIView *)anchorView titleArray:(nullable NSArray *)titleArray imageArray:(nullable NSArray *)imageArray;
+ (instancetype)pullMenuAnchorView:(UIView *)anchorView menuArray:(nullable NSArray<ZWPullMenuModel *> *)menuArray;
/**
 *  anchorView：下拉依赖绝对坐标
 *  指定坐标下拉
 *  箭头指向点
 *  titleArray:文字
 *  imageArray:icon
 *  menuArray:图文Model
 */
+ (instancetype)pullMenuAnchorPoint:(CGPoint)anchorPoint;
+ (instancetype)pullMenuAnchorPoint:(CGPoint)anchorPoint titleArray:(nullable NSArray *)titleArray;
+ (instancetype)pullMenuAnchorPoint:(CGPoint)anchorPoint titleArray:(nullable NSArray *)titleArray imageArray:(nullable NSArray *)imageArray;
+ (instancetype)pullMenuAnchorPoint:(CGPoint)anchorPoint menuArray:(nullable NSArray<ZWPullMenuModel *> *)menuArray;

@end

NS_ASSUME_NONNULL_END
