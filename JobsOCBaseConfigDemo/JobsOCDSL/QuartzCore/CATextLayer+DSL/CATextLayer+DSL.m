//
//  CATextLayer+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CATextLayer+DSL.h"

@implementation CATextLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CATextLayer
-(JobsRetCATextLayerByIDBlock _Nonnull)byString{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.string = data;
        return self;
    };
}

-(JobsRetCATextLayerByCFTypeRefBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(CFTypeRef _Nullable data){
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetCATextLayerByCGFloatBlock _Nonnull)byFontSize{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fontSize = data;
        return self;
    };
}

-(JobsRetCATextLayerByCGColorRefBlock _Nonnull)byForegroundColor{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(CGColorRef _Nullable data){
        @jobs_strongify(self)
        self.foregroundColor = data;
        return self;
    };
}

-(JobsRetCATextLayerByUIColorBlock _Nonnull)byForegroundColorUIColor{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.foregroundColor = data.CGColor;
        return self;
    };
}

-(JobsRetCATextLayerByBOOLBlock _Nonnull)byWrapped{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.wrapped = data;
        return self;
    };
}

-(JobsRetCATextLayerByTruncationModeBlock _Nonnull)byTruncationMode{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(CATextLayerTruncationMode data){
        @jobs_strongify(self)
        self.truncationMode = data;
        return self;
    };
}

-(JobsRetCATextLayerByAlignmentModeBlock _Nonnull)byAlignmentMode{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(CATextLayerAlignmentMode data){
        @jobs_strongify(self)
        self.alignmentMode = data;
        return self;
    };
}

-(JobsRetCATextLayerByBOOLBlock _Nonnull)byAllowsFontSubpixelQuantization{
    @jobs_weakify(self)
    return ^__kindof CATextLayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsFontSubpixelQuantization = data;
        return self;
    };
}

@end
