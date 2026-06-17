//
//  UIView+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_DSL_556F4879E9
#define JOBS_HEADER_GUARD_UIVIEW_DSL_556F4879E9

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DSL)

#pragma mark —— UIView+Measure 迁移到 JobsOCDSL 的几何/尺寸 DSL 扩充
#pragma mark —— 简捷获得控件坐标
Prop_assign()CGFloat x;
Prop_assign()CGFloat y;
Prop_assign()CGFloat width;
Prop_assign()CGFloat height;
Prop_assign()CGFloat centerX;
Prop_assign()CGFloat centerY;
Prop_assign()CGFloat left;
Prop_assign()CGFloat right;
Prop_assign()CGFloat top;
Prop_assign()CGFloat bottom;
Prop_assign()CGSize sizer;// 避免与size冲突
Prop_assign()CGPoint Origin;
#pragma mark —— 初始化方法封装
+(JobsRetViewByClassBlock _Nonnull)build;
#pragma mark —— 控件居中的时候，相对于全屏的X和Y值
/// 当控件相对于view居中的时候，控件的X值
-(JobsRetCGFloatByViewBlock _Nonnull)xWhenViewInViewCenter;
/// 当控件相对于view居中的时候，控件的Y值
-(JobsRetCGFloatByViewBlock _Nonnull)yWhenViewInViewCenter;
/// 当控件相对于一个特定的值居中的时候，控件的X值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)xWhenViewInViewCenterBy;
/// 当控件相对于一个特定的值居中的时候，控件的Y值
-(JobsRetCGFloatByCGFloatBlock _Nonnull)yWhenViewInViewCenterBy;
/// 当控件相对于整个设备屏幕居中的时候，控件的X值
-(JobsRetCGFloatByVoidBlock _Nonnull)xWhenViewInScreenCenter;
/// 当控件相对于整个设备屏幕居中的时候，控件的Y值
-(JobsRetCGFloatByVoidBlock _Nonnull)yWhenViewInScreenCenter;
#pragma mark —— 刷新UI
-(JobsRetViewByVoidBlock _Nonnull)jobsRefreshUI;
#pragma mark —— 交换宽高
-(JobsRetFrameByVoidBlock _Nonnull)exchangeWidthAndHeight;
#pragma mark —— 交换 X 和 Y
-(JobsRetFrameByVoidBlock _Nonnull)exchangeXAndY;
#pragma mark —— 【类方法】设置控件的约束（返回控件自己本身）
+(JobsRetViewByCGSizeBlock _Nonnull)BySize;
/// 设置控件的 Frame
+(JobsRetViewByFrameBlock _Nonnull)ByFrame;
/// 设置控件的 Origin
+(JobsRetViewByCGPointBlock _Nonnull)ByOrigin;
/// 设置控件的 X
+(JobsRetViewByCGFloatBlock _Nonnull)ByX;
/// 设置控件的 Y
+(JobsRetViewByCGFloatBlock _Nonnull)ByY;
/// 设置控件的 Left，语义等同于 X
+(JobsRetViewByCGFloatBlock _Nonnull)ByLeft;
/// 设置控件的 Right，语义为 X + Width
+(JobsRetViewByCGFloatBlock _Nonnull)ByRight;
/// 设置控件的 Top，语义等同于 Y
+(JobsRetViewByCGFloatBlock _Nonnull)ByTop;
/// 设置控件的 Bottom，语义为 Y + Height
+(JobsRetViewByCGFloatBlock _Nonnull)ByBottom;
/// 设置控件的 Width
+(JobsRetViewByFloatBlock _Nonnull)ByWidth;
/// 设置控件的 Height
+(JobsRetViewByFloatBlock _Nonnull)ByHeight;
/// 设置控件的 CenterX
+(JobsRetViewByCGFloatBlock _Nonnull)ByCenterX;
/// 设置控件的 CenterY
+(JobsRetViewByCGFloatBlock _Nonnull)ByCenterY;
/// 设置控件的 Center
+(JobsRetViewByCenterBlock _Nonnull)ByCenter;
#pragma mark —— 【实例方法】设置控件的约束（返回控件自己本身）
/// 设置控件的 Size
-(JobsRetViewByCGSizeBlock _Nonnull)bySize;
/// 设置控件的 Origin
-(JobsRetViewByCGPointBlock _Nonnull)byOrigin;
/// 设置控件的 X
-(JobsRetViewByCGFloatBlock _Nonnull)byX;
/// 设置控件的 Y
-(JobsRetViewByCGFloatBlock _Nonnull)byY;
/// 设置控件的 Left，语义等同于 X
-(JobsRetViewByCGFloatBlock _Nonnull)byLeft;
/// 设置控件的 Right，语义为 X + Width
-(JobsRetViewByCGFloatBlock _Nonnull)byRight;
/// 设置控件的 Top，语义等同于 Y
-(JobsRetViewByCGFloatBlock _Nonnull)byTop;
/// 设置控件的 Bottom，语义为 Y + Height
-(JobsRetViewByCGFloatBlock _Nonnull)byBottom;
/// 设置控件的 Width
-(JobsRetViewByFloatBlock _Nonnull)byWidth;
/// 设置控件的 Height
-(JobsRetViewByFloatBlock _Nonnull)byHeight;
/// 设置控件的 CenterX
-(JobsRetViewByCGFloatBlock _Nonnull)byCenterX;
/// 设置控件的 CenterY
-(JobsRetViewByCGFloatBlock _Nonnull)byCenterY;
/// 设置控件的 Center
-(JobsRetViewByCenterBlock _Nonnull)byCenter;
#pragma mark —— 重新设置控件的约束（返回控件的Frame）
/// 重设Frame
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginX;
-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetRightX;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginY;
-(JobsRetFrameByCGFloatAndUIViewBlock _Nonnull)resetBottomY;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidth;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeight;
-(JobsRetFrameByCGPointBlock _Nonnull)resetOrigin;
-(JobsRetFrameByCGSizeBlock _Nonnull)resetSize;
/// 依据偏移量重设Frame
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginXByOffset;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginYByOffset;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterX;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetCenterY;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidthByOffset;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeightByOffset;
-(JobsRetFrameByCGPointBlock _Nonnull)resetOriginByOffset;
-(JobsRetFrameByCGSizeBlock _Nonnull)resetSizeByOffset;
#pragma mark —— UIView对齐方法扩充 https://github.com/MisterZhouZhou/ZWUIViewExtension
/// 设置水平方向对齐
-(JobsRetViewByViewBlock _Nonnull)centerxEqualToView;
/// 设置垂平方向对齐
-(JobsRetViewByViewBlock _Nonnull)centeryEqualToView;
/// 设置中心方向对齐
-(JobsRetViewByViewBlock _Nonnull)centerEqualToView;
/// 设置左对齐
-(JobsRetViewByViewBlock _Nonnull)leftEqualToView;
/// 设置右对齐
-(JobsRetViewByViewBlock _Nonnull)rightEqualToView;
/// 设置顶部对齐
-(JobsRetViewByViewBlock _Nonnull)topEqualToView;
/// 设置底部对齐
-(JobsRetViewByViewBlock _Nonnull)bottomEqualToView;
#pragma mark —— 拉升和平移
Prop(readonly)CGFloat maxX;
Prop(readonly)CGFloat maxY;
Prop(readonly)CGPoint boundCenter;
/// [平移]这个view, 让view.maxX = maxX
-(void)setMaxXByShift:(CGFloat)maxX;
/// [拉伸]这个view, 让view.maxX = maxX
-(void)setMaxXByStretch:(CGFloat)maxX;
/// [平移]这个view, 让view.maxY = maxY
-(void)setMaxYByShift:(CGFloat)maxY;
/// [拉伸]这个view, 让view.maxY = maxY
-(void)setMaxYByStretch:(CGFloat)maxY;

#pragma mark —— Geometry
-(JobsRetViewByFrameBlock _Nonnull)byFrame;
-(JobsRetViewByFrameBlock _Nonnull)byBounds;
-(JobsRetViewByCGPointBlock _Nonnull)byCenterPoint;
-(JobsRetViewByCGAffineTransformBlock _Nonnull)byTransform;
-(JobsRetViewByCATransform3DBlock _Nonnull)byTransform3D;
-(JobsRetViewByCGFloatBlock _Nonnull)byContentScaleFactor;
-(JobsRetViewByCGPointBlock _Nonnull)byAnchorPoint;
#pragma mark —— Identity
-(JobsRetViewByNSIntegerBlock _Nonnull)byTag;
-(JobsRetViewByBOOLBlock _Nonnull)byUserInteractionEnabled;
-(JobsRetViewByBOOLBlock _Nonnull)byMultipleTouchEnabled;
-(JobsRetViewByBOOLBlock _Nonnull)byExclusiveTouch;
#pragma mark —— Rendering
/// 回调当前 UIView，便于父层 DSL 之后继续做当前 view 相关操作
-(JobsRetViewByJobsByViewBlock _Nonnull)byViewBlock;
/// 回调当前 UIView 的 layer，便于继续使用 CALayer+DSL 进行链式配置
-(JobsRetViewByLayerBlock _Nonnull)byLayer;
/// 圆切角参数：通常作用于 -layoutSubviews
Prop_assign()UIRectCorner layoutSubviewsRectCorner;
/// 圆切角尺寸：通常作用于 -layoutSubviews
Prop_assign()CGSize layoutSubviewsRectCornerSize;
-(JobsRetViewByUIRectCornerBlock _Nonnull)byLayoutSubviewsRectCorner;
-(JobsRetViewByCGSizeBlock _Nonnull)byLayoutSubviewsRectCornerSize;
-(JobsRetViewByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetViewByBOOLBlock _Nonnull)byClipsToBounds;
-(JobsRetViewByCorBlock _Nonnull)byBgColor;
-(JobsRetViewByCGFloatBlock _Nonnull)byAlpha;
-(JobsRetViewByBOOLBlock _Nonnull)byOpaque;
-(JobsRetViewByBOOLBlock _Nonnull)byClearsContextBeforeDrawing;
-(JobsRetViewByBOOLBlock _Nonnull)byHidden;
-(JobsRetViewByCGFloatBlock _Nonnull)byJobsVisible;
-(JobsRetViewByNSIntegerBlock _Nonnull)byContentMode;
-(JobsRetViewByViewBlock _Nonnull)byMaskView;
-(JobsRetViewByCorBlock _Nonnull)byTintColor;
-(JobsRetViewByNSIntegerBlock _Nonnull)byTintAdjustmentMode;
#pragma mark —— Semantics / RTL
-(JobsRetViewByNSIntegerBlock _Nonnull)bySemanticContentAttribute;
#pragma mark —— Layout behaviors
-(JobsRetViewByBOOLBlock _Nonnull)byAutoresizesSubviews;
-(JobsRetViewByNSUIntegerBlock _Nonnull)byAutoresizingMask;
-(JobsRetViewByUIEdgeInsetBlock _Nonnull)byLayoutMargins;
-(JobsRetViewByNSDirectionalEdgeInsetsBlock _Nonnull)byDirectionalLayoutMargins;
-(JobsRetViewByBOOLBlock _Nonnull)byPreservesSuperviewLayoutMargins;
-(JobsRetViewByBOOLBlock _Nonnull)byInsetsLayoutMarginsFromSafeArea;
#pragma mark —— UIUserInterfaceStyle
-(JobsRetViewByUIUserInterfaceStyleBlock _Nonnull)byOverrideUserInterfaceStyle;
#pragma mark —— Dynamic Type limits
-(JobsRetViewByStringBlock _Nonnull)byMinimumContentSizeCategory;
-(JobsRetViewByStringBlock _Nonnull)byMaximumContentSizeCategory;
#pragma mark —— Focus
-(JobsRetViewByStringBlock _Nonnull)byFocusGroupIdentifier;
-(JobsRetViewByNSIntegerBlock _Nonnull)byFocusGroupPriority;
-(JobsRetViewByIDBlock _Nonnull)byFocusEffect;
#pragma mark —— iOS 26+ CornerConfiguration
#if defined(__IPHONE_26_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_26_0)
-(JobsRetViewByCornerConfigBlock _Nonnull)byCornerConfiguration;
#endif
#pragma mark —— Single-parameter / no-parameter methods
/// 对 UIKit API addSubview 的二次封装：附着在父视图上
-(JobsRetViewByViewBlock _Nonnull)addOn;
/// 对 UIKit API addSubview 的二次封装：加入子视图
-(JobsRetViewByViewBlock _Nonnull)addBy;
/// 对 UIKit API bringSubviewToFront 的二次封装
-(JobsRetViewByViewBlock _Nonnull)byBringSubviewToFront;
/// 对 UIKit API sendSubviewToBack 的二次封装
-(JobsRetViewByViewBlock _Nonnull)bySendSubviewToBack;
/// 对 UIKit API removeFromSuperview 的二次封装
-(JobsRetViewByVoidBlock _Nonnull)byRemove;
-(JobsRetViewByGestureRecognizer _Nonnull)byAddGestureRecognizer;
-(JobsRetViewByGestureRecognizer _Nonnull)byRemoveGestureRecognizer;
-(JobsRetViewByInteractionBlock _Nonnull)byAddInteraction;
-(JobsRetViewByInteractionBlock _Nonnull)byRemoveInteraction;
-(JobsRetViewByFrameBlock _Nonnull)bySetNeedsDisplayInRect;
-(JobsRetViewByVoidBlock _Nonnull)byRemoveFromSuperview;
-(JobsRetViewByVoidBlock _Nonnull)bySetNeedsDisplay;
-(JobsRetViewByVoidBlock _Nonnull)bySetNeedsLayout;
-(JobsRetViewByVoidBlock _Nonnull)byLayoutIfNeeded;
-(JobsRetViewByVoidBlock _Nonnull)bySizeToFit;
-(JobsRetViewByVoidBlock _Nonnull)bySetNeedsUpdateConstraints;
-(JobsRetViewByVoidBlock _Nonnull)byUpdateConstraintsIfNeeded;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_DSL_556F4879E9 */
