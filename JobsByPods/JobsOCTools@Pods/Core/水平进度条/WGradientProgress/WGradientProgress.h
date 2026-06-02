//
//  WGradientProgress.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_WGRADIENTPROGRESS_BFFDECC369
#define JOBS_HEADER_GUARD_WGRADIENTPROGRESS_BFFDECC369

#import <UIKit/UIKit.h>
#import <JobsOCTools/WGradientProgressModel.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

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

#if __has_include(<JobsOCTimer/JobsTimer.h>)
#import <JobsOCTimer/JobsTimer.h>
#else
#import "JobsTimer.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface WGradientProgress : UIView

Prop_assign()CGFloat progress;
Prop_assign()CGFloat increment;// 只能允许 0 ~ 1 范围内 每一单位
Prop_assign()BOOL isShowRoad;// 是否显示即将运动的轨迹
Prop_assign()BOOL isShowFence;// 是否显示栅栏
Prop_assign()CGFloat fenceLayer_x;// 栅栏位置
Prop_assign()CGFloat fenceLayer_width;
Prop_assign()NSTimeInterval color_timeInterval;// 色彩翻滚的频率
Prop_assign()NSTimeInterval length_timeInterval;// 长度变化的频率
Prop_assign()NSTimeInterval length_timeSecIntervalSinceDate;// 长度变化的时间延迟
Prop_assign()WGradientProgressType progressType;
Prop_strong()UIColor * _Nullable progressColor;
Prop_strong()UIColor * _Nullable fenceLayerColor;// 栅栏颜色

-(void)showOnParent;/// 启动色彩翻滚
-(void)hide;
-(void)start;
-(void)pause;
-(void)resume;
-(void)reset;

@end
#endif /* JOBS_HEADER_GUARD_WGRADIENTPROGRESS_BFFDECC369 */
