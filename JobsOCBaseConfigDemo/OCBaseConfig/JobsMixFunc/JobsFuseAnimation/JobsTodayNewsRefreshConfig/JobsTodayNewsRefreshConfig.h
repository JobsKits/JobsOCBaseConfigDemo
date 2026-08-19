//
//  JobsTodayNewsRefreshConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <math.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 今日头条红色轮廓形变刷新动画配置。
@interface JobsTodayNewsRefreshConfig : NSObject<NSCopying>

Prop_strong()UIColor *strokeColor;
Prop_assign()CGFloat lineWidth;
Prop_assign()CGFloat triangleWidth;
Prop_assign()CGFloat triangleHeight;
Prop_assign()CGFloat centerGap;
Prop_assign()NSTimeInterval cycleDuration;

+(JobsRetJobsTodayNewsRefreshConfigByVoidBlock _Nonnull)config;
-(JobsRetJobsTodayNewsRefreshConfigByUIColorBlock _Nonnull)byStrokeColor;
-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byLineWidth;
-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byTriangleWidth;
-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byTriangleHeight;
-(JobsRetJobsTodayNewsRefreshConfigByCGFloatBlock _Nonnull)byCenterGap;
-(JobsRetJobsTodayNewsRefreshConfigByNSTimeIntervalBlock _Nonnull)byCycleDuration;
-(CGSize)indicatorSize;
-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIndicatorSize;

@end

NS_ASSUME_NONNULL_END
