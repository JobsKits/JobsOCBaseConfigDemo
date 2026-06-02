//
//  ScrollDecelerator.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ScrollDecelerator.h"

@implementation ScrollDecelerator

- (instancetype)initWithVelocity:(CGFloat)velocity
                decelerationRate:(CGFloat)decelerationRate {
    if (self = [super init]) {
        _velocity = velocity;
        _decelerationRate = decelerationRate;
    }return self;
}

-(JobsRetCGFloatByCGFloatBlock _Nonnull)stepVtDt{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat dt){
        @jobs_strongify(self)
        if (dt <= 0) return 0;
        // 每毫秒乘一次 rate -> dt 秒乘 pow(rate, dt * 1000)
        CGFloat factor = pow(self.decelerationRate, dt * 1000.0);
        CGFloat v0 = self.velocity;
        CGFloat v1 = v0 * factor;  // 衰减后的速度
        // 位移 ≈ (v0 + v1) / 2 * dt （匀变速近似）
        CGFloat displacement = (v0 + v1) * 0.5 * dt;
        self.velocity = v1;
        return displacement;
    };
}

-(JobsRetBOOLByCGFloatBlock _Nonnull)isStoppedByThreshold{
    @jobs_weakify(self)
    return ^BOOL(CGFloat threshold){
        @jobs_strongify(self)
        return fabs(self.velocity) < threshold;
    };
}

@end
