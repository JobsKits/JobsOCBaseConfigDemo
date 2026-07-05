//
//  CAEAGLLayer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CAEAGLLayer+DSL.h"

@implementation CAEAGLLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CAEAGLLayer
-(JobsRetCAEAGLLayerByNSDictionaryBlock _Nonnull)byDrawableProperties{
    @jobs_weakify(self)
    return ^__kindof CAEAGLLayer *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.drawableProperties = data;
        return self;
    };
}

-(JobsRetCAEAGLLayerByBOOLBlock _Nonnull)byPresentsWithTransaction{
    @jobs_weakify(self)
    return ^__kindof CAEAGLLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.presentsWithTransaction = data;
        return self;
    };
}

@end
