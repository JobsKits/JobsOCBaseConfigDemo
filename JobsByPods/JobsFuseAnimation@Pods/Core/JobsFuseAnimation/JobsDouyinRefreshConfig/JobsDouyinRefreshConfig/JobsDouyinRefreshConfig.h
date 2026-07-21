//
//  JobsDouyinRefreshConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <UIKit/UIKit.h>

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

+(__kindof JobsDouyinRefreshConfig *)config;
-(JobsDouyinRefreshConfig *(^)(UIColor *data))byRedColor;
-(JobsDouyinRefreshConfig *(^)(UIColor *data))byGreenColor;
-(JobsDouyinRefreshConfig *(^)(CGFloat data))byDotDiameter;
-(JobsDouyinRefreshConfig *(^)(CGFloat data))byHorizontalTravel;
-(JobsDouyinRefreshConfig *(^)(CGFloat data))byJumpHeight;
-(JobsDouyinRefreshConfig *(^)(NSTimeInterval data))byCycleDuration;
-(CGSize)indicatorSize;

@end

NS_ASSUME_NONNULL_END

