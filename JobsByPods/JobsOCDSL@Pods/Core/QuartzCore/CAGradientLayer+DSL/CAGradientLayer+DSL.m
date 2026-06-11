//
//  CAGradientLayer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CAGradientLayer+DSL.h"

@implementation CAGradientLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CAGradientLayer
-(JobsRetCAGradientLayerByArrBlock _Nonnull)byColors{
    @jobs_weakify(self)
    return ^__kindof CAGradientLayer *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.colors = data;
        return self;
    };
}

-(JobsRetCAGradientLayerByArrBlock _Nonnull)byLocations{
    @jobs_weakify(self)
    return ^__kindof CAGradientLayer *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.locations = data;
        return self;
    };
}

-(JobsRetCAGradientLayerByCGPointBlock _Nonnull)byStartPoint{
    @jobs_weakify(self)
    return ^__kindof CAGradientLayer *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.startPoint = data;
        return self;
    };
}

-(JobsRetCAGradientLayerByCGPointBlock _Nonnull)byEndPoint{
    @jobs_weakify(self)
    return ^__kindof CAGradientLayer *_Nullable(CGPoint data){
        @jobs_strongify(self)
        self.endPoint = data;
        return self;
    };
}

-(JobsRetCAGradientLayerByTypeBlock _Nonnull)byType{
    @jobs_weakify(self)
    return ^__kindof CAGradientLayer *_Nullable(CAGradientLayerType data){
        @jobs_strongify(self)
        self.type = data;
        return self;
    };
}

@end
