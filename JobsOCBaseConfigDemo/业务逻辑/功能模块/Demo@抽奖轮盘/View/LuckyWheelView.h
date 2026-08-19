//
//  LuckyWheelView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "LuckyWheelSegment.h"
#import "ScrollDecelerator.h"

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface LuckyWheelView : UIView
/// “指针”方向（默认正上方）
Prop_assign()JobsDirectionType pointerDirection;
/// 完整 Segment 模型（推荐使用）
Prop_strong()NSArray<LuckyWheelSegment *> *segments;
/// 仅背景色（向下兼容）：设置 colors 会自动生成 segments
Prop_strong()NSArray<UIColor *> *colors;
/// 旋转持续时间（秒，近似控制）
Prop_assign()NSTimeInterval spinDuration;
/// 自定义初始角速度（rad/s）
/// - 如果不为 nil，则优先使用这个值，而不是通过 spinDuration 反推
/// - 数值越大，甩得越猛，转得越久
Prop_strong(nullable)NSNumber *customInitialVelocity;
/// 是否允许手势拖动旋转（默认 YES）
Prop_assign()BOOL panRotationEnabled;
/// 是否正在自动旋转
Prop_assign(readonly, getter=isSpinning)BOOL spinning;
/// 自动旋转状态变化
Prop_copy(nullable)jobsByBOOLBlock spinningStateChangedHandler;
/// 点按事件
Prop_copy(nullable)jobsByLuckyWheelSegmentBlock segmentTapHandler;
/// 长按事件
Prop_copy(nullable)jobsByLuckyWheelSegmentAndLPGesturerBlock segmentLongPressHandler;
/// 启动减速旋转；旋转中重复调用会按内部配置重置初始角速度
- (jobsByVoidBlock _Nonnull)startSpinWithScrollLikeDeceleration;
/// 指定初始角速度启动减速旋转；旋转中重复调用会重置为该速度
-(jobsByCGFloatBlock _Nonnull)startSpinWithScrollLikeDecelerationWithInitialVelocity;
/// 开始 / 停止切换
- (jobsByVoidBlock _Nonnull)toggleSpin;
/// 停止旋转
- (jobsByVoidBlock _Nonnull)stopSpin;
/// （可选）非 DSL 版本，直接配置
-(JobsRetIDByjobsByLuckyWheelSegmentBlockBlock _Nonnull)onSegmentTap;
-(JobsRetIDByjobsByLuckyWheelSegmentAndLPGesturerBlockBlock _Nonnull)onSegmentLongPress;
-(JobsRetIDByjobsByBOOLBlockBlock _Nonnull)onSpinningStateChanged;
#pragma mark —— DSL
/// DSL@设置指针方向
- (JobsRetLuckyWheelViewByPointerDirectionBlock _Nonnull)byPointerDirection;
/// DSL@设置完整 segments
- (JobsRetLuckyWheelViewBySegmentsBlock _Nonnull)bySegments;
/// DSL@设置颜色数组（向下兼容）
/// 内部可以根据 colors 自动生成 segments
- (JobsRetLuckyWheelViewByColorsBlock _Nonnull)byColors;
/// DSL@设置旋转持续时间（秒）
- (JobsRetLuckyWheelViewByTimeIntervalBlock _Nonnull)bySpinDuration;
/// DSL@设置自定义初始角速度（rad/s）
- (JobsRetLuckyWheelViewByNumberBlock _Nonnull)byCustomInitialVelocity;
/// DSL@设置是否允许手势拖动旋转
- (JobsRetLuckyWheelViewByBOOLBlock _Nonnull)byPanRotationEnabled;
/// DSL@配置短按回调
- (JobsRetLuckyWheelViewBySegmentTapDSLBlock _Nonnull)bySegmentTap;
/// DSL@配置长按回调
- (JobsRetLuckyWheelViewBySegmentLongPressDSLBlock _Nonnull)bySegmentLongPress;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LuckyWheelView
-(JobsRetLuckyWheelViewByBOOLBlock _Nonnull)bySpinning;
-(JobsRetLuckyWheelViewByCFTimeIntervalBlock _Nonnull)byLastTouchTimestamp;
-(JobsRetLuckyWheelViewByCGFloatBlock _Nonnull)byAngularVelocityFromPan;
-(JobsRetLuckyWheelViewByCGFloatBlock _Nonnull)byLastTouchAngle;
-(JobsRetLuckyWheelViewBySegmentLongPressDSLBlock _Nonnull)bySegmentLongPressHandler;
-(JobsRetLuckyWheelViewBySegmentTapDSLBlock _Nonnull)bySegmentTapHandler;
-(JobsRetLuckyWheelViewByjobsByBOOLBlockBlock _Nonnull)bySpinningStateChangedHandler;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END LuckyWheelView
@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof LuckyWheelView *_Nonnull
jobsMakeLuckyWheelView(jobsByLuckyWheelViewBlock _Nonnull block){
    LuckyWheelView *data = LuckyWheelView.alloc.init;
    if (block) block(data);
    return data;
}
