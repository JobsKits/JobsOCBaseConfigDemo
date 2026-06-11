//
//  UIView+Extra.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_A7DDD20459
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_A7DDD20459

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsNavigationTransitionMgr/NSObject+Extra.h>
#import <JobsNavigationTransitionMgr/NSString+Sys.h>
#import <JobsNavigationTransitionMgr/UIView+Measure.h>
#import <JobsNavigationTransitionMgr/UIButton+UI.h>
#import <JobsNavigationTransitionMgr/UIBarButtonItem+Extra.h>
#import <JobsNavigationTransitionMgr/UIBezierPath+Extra.h>
#import <JobsNavigationTransitionMgr/CALayer+Extra.h>
#import <JobsNavigationTransitionMgr/UIView+ViewController.h>
#import <JobsNavigationTransitionMgr/UIScrollView+UIScrollViewProtocol.h>
#import <JobsNavigationTransitionMgr/NSObject+GKPhotoBrowser.h>

#if __has_include(<TFPopup/UIView+TFPopup.h>)
#import <TFPopup/UIView+TFPopup.h>
#else
#import "UIView+TFPopup.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
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

/// 在 Objective-C 中，无法直接通过函数参数隐式传递对象的地址。
/// 如果希望在函数调用时自动传递对象的地址，只能通过宏来实现。
#ifndef DestroyView
#define DestroyView(view) destroyView(&(view))
#endif /* DestroyView */

@interface UIView (Extra) <BaseViewProtocol,BaseCellProtocol>
#pragma mark —— init
+(JobsRetViewByFrameBlock _Nonnull)initByFrame;
-(UIBarButtonItem *_Nonnull)barBtnItem;
Prop_assign()CGFloat jobsVisible;
-(JobsRetViewByCGFloatBlock _Nonnull)byVisible;
#pragma mark —— 打印
-(jobsByStrBlock _Nonnull)jobsLogFrame;
-(jobsByStrBlock _Nonnull)jobsLogPoint;
-(jobsByStrBlock _Nonnull)jobsLogSize;
#pragma mark —— 键盘事件
/// 监听键盘事件
-(void)monitorKeyboardAction;
#pragma mark —— 截屏
/*
 1、将图片存本地相册 UIImageWriteToSavedPhotosAlbum
 2、iOS安全 —— 录屏、截屏判断
    2.1、UIApplicationUserDidTakeScreenshotNotification iOS7+ 截屏事件通知
    2.2、UIScreenCapturedDidChangeNotification 判断是否在录屏状态 而当录屏状态改变时，UIKit会发送录屏通知
 */
/// 获取屏幕截图
-(UIImage *_Nullable)screenShot;
/// 获取启动页的截图
-(UIImage *_Nullable)lanuchScreenShot;
/// 获取某个view 上的截图
-(UIImage *_Nullable)viewShots;
/// 获取某个scrollview 上的截图
-(UIImage *_Nullable)scrollViewShot;
/// 截图
-(JobsRetImageByViewBlock _Nonnull)rendImage;
/// 获取某个 范围内的 截图
-(JobsRetImageByFrameBlock _Nonnull)innerViewShotAtFrame;
#pragma mark —— 描边
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)leftBorderColor;
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)rightBorderColor;
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)topBorderColor;
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsRetViewByCorBlock _Nonnull)bottomBorderColor;
/// 调用方式：view.leftBorderColor(color).leftBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)leftBorderWidth;
/// 调用方式：view.rightBorderColor(color).rightBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)rightBorderWidth;
/// 调用方式：view.topBorderColor(color).topBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)topBorderWidth;
/// 调用方式：view.bottomBorderColor(color).bottomBorderWidth(borderType);
-(JobsRetViewByFloatBlock _Nonnull)bottomBorderWidth;
/// 描边：统一设置Layer的线宽+颜色+圆切角（一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)setLayerBy;
/// 描边：统一设置Layer的线宽+颜色+圆切角（不一定切角）
-(JobsReturnViewByLocationModelBlock _Nonnull)layerBy;
/// 指定描边 【在使用这个方法的一个前提是被描边的view刷新后存在frame】
/// @param color 作用颜色
/// @param borderWidth 线宽
/// @param borderType 作用方向
-(void)setBorderWithColor:(UIColor *_Nullable)color
              borderWidth:(CGFloat)borderWidth
               borderType:(UIBorderSideType)borderType;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth;
#pragma mark —— 切角
/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius;
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
-(JobsRetViewByNSUIntegerBlock _Nonnull)appointCorners;
/// 调用方式：view.appointCorners(UIRectCornerTopLeft | UIRectCornerBottomRight).cornerRadii(CGSizeMake(10, 10));
-(JobsRetViewByCGSizeBlock _Nonnull)cornerRadii;
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
#pragma mark —— 其他
-(JobsRetViewByNSUIntegerBlock _Nonnull)makeLabelByShowingType;
-(JobsRetViewByNSIntegerBlock _Nonnull)viewByID;
-(JobsRetViewByGestureRecognizer _Nonnull)addGesture;
-(JobsReturnGestureByGesture _Nonnull)addGestureRecognizer;
-(JobsRetViewByNSIntegerBlock _Nonnull)viewWithTag;
-(JobsRetViewByInteractionBlock _Nonnull)addInteraction;
-(JobsRetViewByInteractionBlock _Nonnull)removeInteraction;
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
/// 针对数据源是UIImage  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageDataMutArr:(NSMutableArray <UIImage *>*_Nonnull)imageDataMutArr
                                atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                   byTarget:(id _Nonnull)target;
/// 针对数据源是NSURL  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlMutArr:(NSMutableArray <NSURL *>*_Nonnull)imageUrlMutArr
                               atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                  byTarget:(id _Nonnull)target;
/// 针对数据源是NSString  *的GKPhotoBrowser
-(void)viewTapGRSavePicsWithImageUrlStrMutArr:(NSMutableArray <NSString *>*_Nonnull)imageUrlStrMutArr
                                  atIndexPath:(NSIndexPath *_Nonnull)indexPath
                                     byTarget:(id _Nonnull)target;
/// 对GKPhotoBrowser保存图片的基础设置
-(jobsByIDBlock _Nonnull)viewTapGRSavePicsBaseConfigByTarget;
/// popView取消按钮常规处理方法
-(jobsByIDBlock _Nonnull)cancelBtnActionForPopView;
/// 顺时针旋转radians度【依据中心点进行旋转】
-(jobsByCGFloatBlock _Nonnull)transformByRadians;
/// 顺时针旋转degrees弧度【依据中心点进行旋转】
-(jobsByCGFloatBlock _Nonnull)transformByDegrees;

-(UIImage *_Nullable)getImage;
/// iOS 阴影效果 添加了shadowPath后消除了离屏渲染问题 。特别提示：不能存在 -(void)drawRect:(CGRect)rect 或者在-(void)drawRect:(CGRect)rect里面写，否则无效
/// @param targetShadowview 需要作用阴影效果的View
/// @param superview 该阴影效果的View的父View
/// @param ShadowDirection 阴影朝向
/// @param offsetX 贝塞尔曲线X轴偏移量
/// @param offsetY 贝塞尔曲线Y轴偏移量
/// @param cornerRadius 圆切角参数，传0表示不切
/// @param shadowOffset  阴影偏移量
/// @param shadowOpacity 阴影的不透明度,取值范围在0~1
/// @param layerShadowColor 阴影颜色
/// @param layerShadowRadius  模糊计算的半径
+(void)makeTargetShadowview:(__kindof UIView *__nonnull)targetShadowview
                  superView:(__kindof UIView *__nullable)superview
            shadowDirection:(ShadowDirection)ShadowDirection
          shadowWithOffsetX:(CGFloat)offsetX
                    offsetY:(CGFloat)offsetY
               cornerRadius:(CGFloat)cornerRadius
               shadowOffset:(CGSize)shadowOffset
              shadowOpacity:(CGFloat)shadowOpacity
           layerShadowColor:(UIColor *__nullable)layerShadowColor
          layerShadowRadius:(CGFloat)layerShadowRadius;

@end
/**
     // 最外层的UI-描边
     _textField_phone.layerByBorderCor(@"#FFC700".cor).layerByBorderWidth(1);
     // 最外层的UI-切全角
     _textField_phone.cornerCutToCircleWithCornerRadius(JobsWidth(8));
 */
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_A7DDD20459 */
