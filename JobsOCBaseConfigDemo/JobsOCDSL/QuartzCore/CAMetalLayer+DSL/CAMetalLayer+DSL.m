//
//  CAMetalLayer+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CAMetalLayer+DSL.h"

#if __has_include(<QuartzCore/CAMetalLayer.h>)
@implementation CAMetalLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CAMetalLayer
-(JobsRetCAMetalLayerByIDBlock _Nonnull)byDevice{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.device = data;
        return self;
    };
}

-(JobsRetCAMetalLayerByNSUIntegerBlock _Nonnull)byPixelFormat{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.pixelFormat = data;
        return self;
    };
}

-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byFramebufferOnly{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.framebufferOnly = data;
        return self;
    };
}

-(JobsRetCAMetalLayerByCGSizeBlock _Nonnull)byDrawableSize{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.drawableSize = data;
        return self;
    };
}

-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byPresentsWithTransaction{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.presentsWithTransaction = data;
        return self;
    };
}

-(JobsRetCAMetalLayerByNSUIntegerBlock _Nonnull)byMaximumDrawableCount{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)){
            self.maximumDrawableCount = data;
        };return self;
    };
}

-(JobsRetCAMetalLayerByCGColorSpaceRefBlock _Nonnull)byColorspace{
    @jobs_weakify(self)
    return ^__kindof CAMetalLayer *_Nullable(CGColorSpaceRef _Nullable data){
        @jobs_strongify(self)
        self.colorspace = data;
        return self;
    };
}

@end
#endif /* __has_include(<QuartzCore/CAMetalLayer.h>) */
