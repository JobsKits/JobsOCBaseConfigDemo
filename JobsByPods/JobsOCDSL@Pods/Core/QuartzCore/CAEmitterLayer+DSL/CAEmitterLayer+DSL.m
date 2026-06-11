//
//  CAEmitterLayer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CAEmitterLayer+DSL.h"

@implementation CAEmitterLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CAEmitterLayer
-(JobsRetCAEmitterLayerByArrBlock _Nonnull)byEmitterCells{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.emitterCells = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byBirthRate{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(float data){
        @jobs_strongify(self)
        self.birthRate = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byLifetime{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(float data){
        @jobs_strongify(self)
        self.lifetime = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByCGPointBlock _Nonnull)byEmitterPosition{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.emitterPosition = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByCGFloatBlock _Nonnull)byEmitterZPosition{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emitterZPosition = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByCGSizeBlock _Nonnull)byEmitterSize{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.emitterSize = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByCGFloatBlock _Nonnull)byEmitterDepth{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.emitterDepth = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByEmitterShapeBlock _Nonnull)byEmitterShape{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(CAEmitterLayerEmitterShape data){
        @jobs_strongify(self)
        self.emitterShape = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByEmitterModeBlock _Nonnull)byEmitterMode{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(CAEmitterLayerEmitterMode data){
        @jobs_strongify(self)
        self.emitterMode = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByRenderModeBlock _Nonnull)byRenderMode{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(CAEmitterLayerRenderMode data){
        @jobs_strongify(self)
        self.renderMode = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByBOOLBlock _Nonnull)byPreservesDepth{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.preservesDepth = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byVelocity{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(float data){
        @jobs_strongify(self)
        self.velocity = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byScale{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(float data){
        @jobs_strongify(self)
        self.scale = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)bySpin{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(float data){
        @jobs_strongify(self)
        self.spin = data;
        return self;
    };
}

-(JobsRetCAEmitterLayerByUnsignedIntBlock _Nonnull)bySeed{
    @jobs_weakify(self)
    return ^__kindof CAEmitterLayer *_Nullable(unsigned int data){
        @jobs_strongify(self)
        self.seed = data;
        return self;
    };
}

@end
