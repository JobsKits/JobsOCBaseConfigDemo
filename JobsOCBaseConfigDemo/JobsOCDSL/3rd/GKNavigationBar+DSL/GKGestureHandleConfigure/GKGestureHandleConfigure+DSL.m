//
//  GKGestureHandleConfigure+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月5日，星期五.
//

#import "GKGestureHandleConfigure+DSL.h"

@implementation GKGestureHandleConfigure (DSL)
+(__kindof GKGestureHandleConfigure *_Nonnull)bySetupDefault{
    GKGestureHandleConfigure *configure = GKGestureHandleConfigure.sharedInstance;
    [configure setupDefaultConfigure];
    return configure;
}

+(JobsRetGKGestureConfigureByConfigureBlock _Nonnull)bySetup{
    return ^__kindof GKGestureHandleConfigure *_Nullable(void (^ _Nullable block)(GKGestureHandleConfigure *configure)){
        GKGestureHandleConfigure *configure = GKGestureHandleConfigure.sharedInstance;
        [configure setupCustomConfigure:^(__kindof GKGestureHandleConfigure * _Nonnull data){
            if (block) block(data);
        }];
        return configure;
    };
}

+(JobsRetGKGestureConfigureByConfigureBlock _Nonnull)byUpdate{
    return ^__kindof GKGestureHandleConfigure *_Nullable(void (^ _Nullable block)(GKGestureHandleConfigure *configure)){
        GKGestureHandleConfigure *configure = GKGestureHandleConfigure.sharedInstance;
        [configure updateConfigure:^(__kindof GKGestureHandleConfigure * _Nonnull data){
            if (block) block(data);
        }];
        return configure;
    };
}

-(JobsRetGKGestureConfigureByConfigureBlock _Nonnull)dsl{
    @jobs_weakify(self)
    return ^__kindof GKGestureHandleConfigure *_Nullable(void (^ _Nullable block)(GKGestureHandleConfigure *configure)){
        @jobs_strongify(self)
        if (block) block(self);
        return self;
    };
}

-(JobsRetGKGestureConfigureByArrayBlock _Nonnull)byShieldGestureVCs{
    @jobs_weakify(self)
    return ^__kindof GKGestureHandleConfigure *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        self.shiledGuestureVCs = data;
        return self;
    };
}

-(JobsRetGKGestureConfigureByBOOLBlock _Nonnull)byOpenScrollViewGestureHandle{
    @jobs_weakify(self)
    return ^__kindof GKGestureHandleConfigure *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.gk_openScrollViewGestureHandle = data;
        return self;
    };
}

-(JobsRetGKGestureConfigureByBOOLBlock _Nonnull)byHidesBottomBarWhenPushed{
    @jobs_weakify(self)
    return ^__kindof GKGestureHandleConfigure *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.gk_hidesBottomBarWhenPushed = data;
        return self;
    };
}

-(JobsRetGKGestureConfigureByCGFloatBlock _Nonnull)bySnapSensitivity{
    @jobs_weakify(self)
    return ^__kindof GKGestureHandleConfigure *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.gk_snapMovementSensitivity = data;
        return self;
    };
}

-(JobsRetGKGestureConfigureByCriticalBlock _Nonnull)byTransitionCritical{
    @jobs_weakify(self)
    return ^__kindof GKGestureHandleConfigure *_Nullable(NSNumber *_Nullable push, NSNumber *_Nullable pop){
        @jobs_strongify(self)
        if (push) self.gk_pushTransitionCriticalValue = push.doubleValue;
        if (pop) self.gk_popTransitionCriticalValue = pop.doubleValue;
        return self;
    };
}

-(JobsRetGKGestureConfigureByScaleBlock _Nonnull)byScale{
    @jobs_weakify(self)
    return ^__kindof GKGestureHandleConfigure *_Nullable(NSNumber *_Nullable x, NSNumber *_Nullable y){
        @jobs_strongify(self)
        if (x) self.gk_scaleX = x.doubleValue;
        if (y) self.gk_scaleY = y.doubleValue;
        return self;
    };
}

@end
