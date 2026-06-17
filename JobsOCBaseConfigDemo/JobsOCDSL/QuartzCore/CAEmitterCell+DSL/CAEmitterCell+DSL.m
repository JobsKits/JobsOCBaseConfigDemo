//
//  CAEmitterCell+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#import "CAEmitterCell+DSL.h"

@implementation CAEmitterCell (JobsChain)
#pragma mark —— Factory / KVC
+(JobsRetCAEmitterCellByVoidBlock)byEmitterCell{
    return ^__kindof CAEmitterCell *_Nullable(void){
        return [self emitterCell];
    };
}

+(JobsRetIDByStrBlock)byDefaultValueForKey{
    return ^id _Nullable(__kindof NSString *_Nullable data){
        return data ? [self defaultValueForKey:data] : nil;
    };
}

-(JobsRetBOOLByStrBlock)byShouldArchiveValueForKey{
    @jobs_weakify(self)
    return ^BOOL(__kindof NSString *_Nullable data){
        @jobs_strongify(self)
        return data ? [self shouldArchiveValueForKey:data] : NO;
    };
}

#pragma mark —— CAMediaTiming
-(JobsRetCAEmitterCellByCFTimeIntervalBlock)byBeginTime{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.beginTime = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCFTimeIntervalBlock)byDuration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)bySpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.speed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCFTimeIntervalBlock)byTimeOffset{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.timeOffset = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byRepeatCount{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.repeatCount = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCFTimeIntervalBlock)byRepeatDuration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.repeatDuration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByBOOLBlock)byAutoreverses{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.autoreverses = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCAMediaTimingFillModeBlock)byFillMode{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CAMediaTimingFillMode _Nullable data){
        @jobs_strongify(self)
        self.fillMode = data;
        return self;
    };
}

#pragma mark —— CAEmitterCell
-(JobsRetCAEmitterCellByStringBlock)byName{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByBOOLBlock)byEnabled{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.enabled = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byBirthRate{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.birthRate = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byLifetime{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.lifetime = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byLifetimeRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.lifetimeRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byEmissionLatitude{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emissionLatitude = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byEmissionLongitude{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emissionLongitude = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byEmissionRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emissionRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byVelocity{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.velocity = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byVelocityRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.velocityRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byXAcceleration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.xAcceleration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byYAcceleration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.yAcceleration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byZAcceleration{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.zAcceleration = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byScale{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scale = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byScaleRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scaleRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byScaleSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scaleSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)bySpin{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.spin = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)bySpinRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.spinRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGColorRefBlock)byColor{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.color = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByUIColorBlock)byColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.color = data.CGColor;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byRedRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.redRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byGreenRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.greenRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byBlueRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.blueRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byAlphaRange{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.alphaRange = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byRedSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.redSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byGreenSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.greenSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byBlueSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.blueSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byAlphaSpeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.alphaSpeed = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByIDBlock)byContents{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.contents = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGRectBlock)byContentsRect{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.contentsRect = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCGFloatBlock)byContentsScale{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentsScale = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCALayerContentsFilterBlock)byMinificationFilter{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CALayerContentsFilter data){
        @jobs_strongify(self)
        self.minificationFilter = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByCALayerContentsFilterBlock)byMagnificationFilter{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(CALayerContentsFilter data){
        @jobs_strongify(self)
        self.magnificationFilter = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByFloatBlock)byMinificationFilterBias{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(float data){
        @jobs_strongify(self)
        self.minificationFilterBias = data;
        return self;
    };
}

-(JobsRetCAEmitterCellByArrBlock)byEmitterCells{
    @jobs_weakify(self)
    return ^__kindof CAEmitterCell *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.emitterCells = data;
        return self;
    };
}

@end
