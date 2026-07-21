//
//  JobsTodayNewsRefreshConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <math.h>
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

+(__kindof JobsTodayNewsRefreshConfig *)config;
-(JobsTodayNewsRefreshConfig *(^)(UIColor *data))byStrokeColor;
-(JobsTodayNewsRefreshConfig *(^)(CGFloat data))byLineWidth;
-(JobsTodayNewsRefreshConfig *(^)(CGFloat data))byTriangleWidth;
-(JobsTodayNewsRefreshConfig *(^)(CGFloat data))byTriangleHeight;
-(JobsTodayNewsRefreshConfig *(^)(CGFloat data))byCenterGap;
-(JobsTodayNewsRefreshConfig *(^)(NSTimeInterval data))byCycleDuration;
-(CGSize)indicatorSize;

@end

NS_ASSUME_NONNULL_END
