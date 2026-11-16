//
//  JobsDouyinRefreshConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <UIKit/UIKit.h>

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

NS_ASSUME_NONNULL_BEGIN

/// 抖音风格双球刷新动画配置。
@interface JobsDouyinRefreshConfig : NSObject<NSCopying>

Prop_strong()UIColor *redColor;
Prop_strong()UIColor *greenColor;
Prop_assign()CGFloat dotDiameter;
Prop_assign()CGFloat horizontalTravel;
Prop_assign()CGFloat jumpHeight;
Prop_assign()NSTimeInterval cycleDuration;

+(JobsRetJobsDouyinRefreshConfigByVoidBlock _Nonnull)config;
-(JobsRetJobsDouyinRefreshConfigByUIColorBlock _Nonnull)byRedColor;
-(JobsRetJobsDouyinRefreshConfigByUIColorBlock _Nonnull)byGreenColor;
-(JobsRetJobsDouyinRefreshConfigByCGFloatBlock _Nonnull)byDotDiameter;
-(JobsRetJobsDouyinRefreshConfigByCGFloatBlock _Nonnull)byHorizontalTravel;
-(JobsRetJobsDouyinRefreshConfigByCGFloatBlock _Nonnull)byJumpHeight;
-(JobsRetJobsDouyinRefreshConfigByNSTimeIntervalBlock _Nonnull)byCycleDuration;
-(CGSize)indicatorSize;
-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIndicatorSize;

@end

NS_ASSUME_NONNULL_END
