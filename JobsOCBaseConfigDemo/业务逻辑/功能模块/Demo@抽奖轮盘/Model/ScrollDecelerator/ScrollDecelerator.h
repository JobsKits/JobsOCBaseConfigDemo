//
//  ScrollDecelerator.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <math.h>
#import <Foundation/Foundation.h>

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
/// 模拟 UIScrollView 的减速曲线：
/// velocity：当前速度（可以是角速度）
/// decelerationRate：例如 UIScrollViewDecelerationRateNormal
@interface ScrollDecelerator : NSObject
/// 当前速度（比如角速度）
Prop_assign()CGFloat velocity;
/// 衰减系数（0~1，越接近 1 减速越慢）
Prop_assign()CGFloat decelerationRate;

- (instancetype)initWithVelocity:(CGFloat)velocity
                decelerationRate:(CGFloat)decelerationRate;
/// 每过 dt 秒，更新一次速度，并返回这一小段的“位移”（Δangle）
-(JobsRetCGFloatByCGFloatBlock _Nonnull)stepVtDt;
/// 是否已经“几乎停了”
-(JobsRetBOOLByCGFloatBlock _Nonnull)isStoppedByThreshold;

@end

NS_ASSUME_NONNULL_END
