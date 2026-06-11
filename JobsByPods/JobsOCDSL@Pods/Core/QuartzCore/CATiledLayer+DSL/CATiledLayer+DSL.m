//
//  CATiledLayer+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#import "CATiledLayer+DSL.h"

@implementation CATiledLayer (JobsChain)
#pragma mark —— Inherited CALayer DSL
#pragma mark —— Geometry
#pragma mark —— Hierarchy
#pragma mark —— Display
#pragma mark —— Visibility
#pragma mark —— Border / Shadow
#pragma mark —— Filters / Rasterize
#pragma mark —— Layout / Action
#pragma mark —— CATiledLayer
-(JobsRetCATiledLayerByNSIntegerBlock _Nonnull)byLevelsOfDetail{
    @jobs_weakify(self)
    return ^__kindof CATiledLayer *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.levelsOfDetail = data;
        return self;
    };
}

-(JobsRetCATiledLayerByNSIntegerBlock _Nonnull)byLevelsOfDetailBias{
    @jobs_weakify(self)
    return ^__kindof CATiledLayer *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.levelsOfDetailBias = data;
        return self;
    };
}

-(JobsRetCATiledLayerByCGSizeBlock _Nonnull)byTileSize{
    @jobs_weakify(self)
    return ^__kindof CATiledLayer *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.tileSize = data;
        return self;
    };
}

@end
