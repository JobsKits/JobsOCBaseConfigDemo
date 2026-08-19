//
//  TDMapCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDMapCellNode.h"

@interface TDMapCellNode ()

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASMapNode
@interface ASMapNode (JobsLocalPropertyDSLAutogen_b2fffae02b)
-(JobsRetASMapNodeByBOOLBlock _Nonnull)byClipsToBounds;
-(JobsRetASMapNodeByBOOLBlock _Nonnull)byLiveMap;
-(JobsRetASMapNodeByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetASMapNodeByMKCoordinateRegionBlock _Nonnull)byRegion;
-(void)setClipsToBounds:(BOOL)data;
-(void)setCornerRadius:(CGFloat)data;
-(void)setLiveMap:(BOOL)data;
-(void)setRegion:(MKCoordinateRegion)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASMapNode

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASLayoutElementStyle
@interface ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_b2fffae02b)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize;
-(void)setPreferredSize:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASLayoutElementStyle

@implementation TDMapCellNode
- (instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.mapNode.needsMapReloadOnBoundsChange = YES;
    };return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDMapCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:_mapNode];
    };
}
#pragma mark —— lazyLoad
-(ASMapNode *)mapNode{
    if(!_mapNode){
        _mapNode = jobsMakeMapNode(^(ASMapNode * _Nullable node) {
            node
                .byCornerRadius(12)
                .byClipsToBounds(YES)
                .byRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(35.0, 103.0), MKCoordinateSpanMake(20, 20)))
                .byLiveMap(YES)
                .byPreferredSize(CGSizeMake(0, 180));
        });
    };return _mapNode;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ASMapNode
@implementation ASMapNode (JobsLocalPropertyDSLAutogen_b2fffae02b)
-(JobsRetASMapNodeByBOOLBlock _Nonnull)byClipsToBounds{
    @jobs_weakify(self)
    return ^__kindof ASMapNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setClipsToBounds:data];
        return self;
    };
}

-(JobsRetASMapNodeByBOOLBlock _Nonnull)byLiveMap{
    @jobs_weakify(self)
    return ^__kindof ASMapNode * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setLiveMap:data];
        return self;
    };
}

-(JobsRetASMapNodeByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof ASMapNode * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCornerRadius:data];
        return self;
    };
}

-(JobsRetASMapNodeByMKCoordinateRegionBlock _Nonnull)byRegion{
    @jobs_weakify(self)
    return ^__kindof ASMapNode * _Nullable(MKCoordinateRegion data){
        @jobs_strongify(self)
        [self setRegion:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ASMapNode
