//
//  CAReplicatorLayer+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CAReplicatorLayer+DSL.h"

@implementation CAReplicatorLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CAReplicatorLayer
-(JobsRetCAReplicatorLayerByNSIntegerBlock _Nonnull)byInstanceCount{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.instanceCount = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByBOOLBlock _Nonnull)byPreservesDepth{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.preservesDepth = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByCFTimeIntervalBlock _Nonnull)byInstanceDelay{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.instanceDelay = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByCATransform3DBlock _Nonnull)byInstanceTransform{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(CATransform3D data){
        @jobs_strongify(self)
        self.instanceTransform = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByCGColorRefBlock _Nonnull)byInstanceColor{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.instanceColor = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByUIColorBlock _Nonnull)byInstanceColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.instanceColor = data.CGColor;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceRedOffset{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.instanceRedOffset = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceGreenOffset{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.instanceGreenOffset = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceBlueOffset{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.instanceBlueOffset = data;
        return self;
    };
}

-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceAlphaOffset{
    @jobs_weakify(self)
    return ^__kindof CAReplicatorLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.instanceAlphaOffset = data;
        return self;
    };
}

@end
