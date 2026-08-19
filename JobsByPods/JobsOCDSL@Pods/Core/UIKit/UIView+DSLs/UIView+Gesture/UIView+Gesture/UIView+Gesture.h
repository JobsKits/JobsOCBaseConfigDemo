//
//  UIView+Gesture.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月10日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_GESTURE_94FB6687CC
#define JOBS_HEADER_GUARD_UIVIEW_GESTURE_94FB6687CC

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/UIView+DSL.h>)
#import <JobsOCDSL/UIView+DSL.h>
#else
#import "UIView+DSL.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

/// UIGestureRecognizer 是父类
/// UITapGestureRecognizer                       轻拍手势【OK】
/// UISwipeGestureRecognizer                    轻扫手势【OK】
/// UILongPressGestureRecognizer                长按手势【OK】
/// UIPanGestureRecognizer                      平移手势【OK】
/// UIPinchGestureRecognizer                    捏合（缩放）手势【OK】
/// UIRotationGestureRecognizer                 旋转手势【OK】
/// UIScreenEdgePanGestureRecognizer            屏幕边缘平移【OK】

/**
     长按手势是连续的。
     当在指定的时间段（minimumPressDuration）
     按下允许的手指的数量（numberOfTouchesRequired）
     并且触摸不超过允许的移动范围（allowableMovement）时，
     手势开始（UIGestureRecognizerStateBegan）。
     手指移动时，手势识别器转换到“更改”状态，
     并且当任何手指抬起时手势识别器结束（UIGestureRecognizerStateEnded）。
 */
NS_ASSUME_NONNULL_BEGIN
#warning —— 本类不实现UIGestureRecognizerDelegate的原因说明:覆盖了UISCrollView 里面对应的方法
@interface UIView (Gesture)<GestureProtocol>

/// UIScreenEdgePanGestureRecognizer.edges
Prop_assign()UIRectEdge screenEdgePanGREdges;

#pragma mark —— Gesture Config DSL
/// UIPanGestureRecognizer.minimumNumberOfTouches
-(JobsRetViewByNSUIntegerBlock _Nonnull)byMinimumNumberOfTouches;
/// UIPanGestureRecognizer.maximumNumberOfTouches
-(JobsRetViewByNSUIntegerBlock _Nonnull)byMaximumNumberOfTouches;
/// UILongPressGestureRecognizer / UITapGestureRecognizer.numberOfTapsRequired
-(JobsRetViewByNSUIntegerBlock _Nonnull)byNumberOfTapsRequired;
/// UILongPressGestureRecognizer / UITapGestureRecognizer / UISwipeGestureRecognizer.numberOfTouchesRequired
-(JobsRetViewByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired;
/// UILongPressGestureRecognizer.minimumPressDuration
-(JobsRetViewByTimeIntervalBlock _Nonnull)byMinimumPressDuration;
/// UILongPressGestureRecognizer.allowableMovement
-(JobsRetViewByCGFloatBlock _Nonnull)byAllowableMovement;
/// UISwipeGestureRecognizer.direction
-(JobsRetViewBySwipeGestureRecognizerDirectionBlock _Nonnull)bySwipeGRDirection;
/// UIPanGestureRecognizer.allowedScrollTypesMask
-(JobsRetViewByNSIntegerBlock _Nonnull)byAllowedScrollTypesMask;
/// UIPinchGestureRecognizer.scale
-(JobsRetViewByCGFloatBlock _Nonnull)byScale;
/// UIRotationGestureRecognizer.rotation
-(JobsRetViewByCGFloatBlock _Nonnull)byRotate;
/// UIScreenEdgePanGestureRecognizer.edges
-(JobsRetViewByUIRectEdgeBlock _Nonnull)byScreenEdgePanGREdges;

#pragma mark —— Add Gesture DSL
/// 任意手势：仅添加到当前 view，并开启 userInteractionEnabled / enabled
-(JobsRetViewByGestureRecognizer _Nonnull)addGR;
/// 任意手势：addGR 的语义化别名
-(JobsRetViewByGestureRecognizer _Nonnull)addGestureRecognizerGR;
/// 单击手势
-(JobsRetViewByTapGestureRecognizerActionBlock _Nonnull)addTapGR;
/// 双击手势
-(JobsRetViewByTapGestureRecognizerActionBlock _Nonnull)addDoubleTapGR;
/// 长按手势
-(JobsRetViewByLongPressGestureRecognizerActionBlock _Nonnull)addLongPressGR;
/// 轻扫手势
-(JobsRetViewBySwipeGestureRecognizerActionBlock _Nonnull)addSwipeGR;
/// 平移手势
-(JobsRetViewByPanGestureRecognizerActionBlock _Nonnull)addPanGR;
/// 捏合手势
-(JobsRetViewByPinchGestureRecognizerActionBlock _Nonnull)addPinchGR;
/// 旋转手势
-(JobsRetViewByRotationGestureRecognizerActionBlock _Nonnull)addRotationGR;
/// 屏幕边缘平移手势
-(JobsRetViewByScreenEdgePanGestureRecognizerActionBlock _Nonnull)addScreenEdgePanGR;

@end

NS_ASSUME_NONNULL_END
/**

     DSL 调用示例：设置长按手势和点击手势
     {
         _adView
             .byNumberOfTouchesRequired(1)
             .byNumberOfTapsRequired(1)/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
             .byMinimumPressDuration(0.1)
             .byAllowableMovement(1)
             .addLongPressGR(^(__kindof UILongPressGestureRecognizer * _Nullable gesture) {
                 JobsLog(@"长按手势被触发");
             })
             .addTapGR(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
                 JobsLog(@"单击手势被触发");
             })
             .addDoubleTapGR(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
                 JobsLog(@"双击手势被触发");
             });
     }
 */
#endif /* JOBS_HEADER_GUARD_UIVIEW_GESTURE_94FB6687CC */
