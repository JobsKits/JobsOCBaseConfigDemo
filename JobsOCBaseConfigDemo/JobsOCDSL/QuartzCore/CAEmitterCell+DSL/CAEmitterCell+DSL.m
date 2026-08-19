//
//  CAEmitterCell+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#import "CAEmitterCell+DSL.h"

@implementation CAEmitterCell (JobsChain)
#pragma mark —— Factory / KVC
+(JobsRetCAEmitterCellByVoidBlock _Nonnull)byEmitterCell{
    return ^__kindof CAEmitterCell *_Nullable(void){
        return [self emitterCell];
    };
}

+(JobsRetIDByStrBlock _Nonnull)byDefaultValueForKey{
    return ^id _Nullable(__kindof NSString *_Nullable data){
        return data ? [self defaultValueForKey:data] : nil;
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)byShouldArchiveValueForKey{
    @jobs_weakify(self)
    return ^BOOL(__kindof NSString *_Nullable data){
        @jobs_strongify(self)
        return data ? [self shouldArchiveValueForKey:data] : NO;
    };
}

#pragma mark —— CAMediaTiming
-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byBeginTime{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.beginTime = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byDuration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)bySpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.speed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byTimeOffset{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.timeOffset = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byRepeatCount{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.repeatCount = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byRepeatDuration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.repeatDuration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByBOOLBlock _Nonnull)byAutoreverses{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.autoreverses = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCAMediaTimingFillModeBlock _Nonnull)byFillMode{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CAMediaTimingFillMode _Nullable data){
        @jobs_strongify(self)
        self.fillMode = data;
        return self;
    };
}

#pragma mark —— CAEmitterCell
-(JobsRetCAEmitterCellByStringBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByBOOLBlock _Nonnull)byEnabled{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enabled = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byBirthRate{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.birthRate = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byLifetime{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.lifetime = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byLifetimeRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.lifetimeRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byEmissionLatitude{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emissionLatitude = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byEmissionLongitude{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emissionLongitude = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byEmissionRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emissionRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byVelocity{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.velocity = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byVelocityRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.velocityRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byXAcceleration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.xAcceleration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byYAcceleration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.yAcceleration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byZAcceleration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.zAcceleration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byScale{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scale = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byScaleRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scaleRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byScaleSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scaleSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)bySpin{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.spin = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)bySpinRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.spinRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGColorRefBlock _Nonnull)byColor{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.color = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByUIColorBlock _Nonnull)byColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.byColor(data.CGColor);
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byRedRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.redRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byGreenRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.greenRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byBlueRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.blueRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byAlphaRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.alphaRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byRedSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.redSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byGreenSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.greenSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byBlueSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.blueSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byAlphaSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.alphaSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByIDBlock _Nonnull)byContents{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.contents = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGRectBlock _Nonnull)byContentsRect{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.contentsRect = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byContentsScale{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentsScale = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCALayerContentsFilterBlock _Nonnull)byMinificationFilter{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CALayerContentsFilter data){
        @jobs_strongify(self)
        self.minificationFilter = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCALayerContentsFilterBlock _Nonnull)byMagnificationFilter{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CALayerContentsFilter data){
        @jobs_strongify(self)
        self.magnificationFilter = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byMinificationFilterBias{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.minificationFilterBias = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByArrBlock _Nonnull)byEmitterCells{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.emitterCells = data;
        return self;
    };
}

@end
