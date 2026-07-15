//
//  TDMapCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDMapCellNode.h"

@interface TDMapCellNode ()

@end

@implementation TDMapCellNode
- (instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.mapNode.needsMapReloadOnBoundsChange = YES;
    };return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:_mapNode];
}
#pragma mark —— lazyLoad
-(ASMapNode *)mapNode{
    if(!_mapNode){
        _mapNode = jobsMakeMapNode(^(ASMapNode * _Nullable node) {
            node.style.preferredSize = CGSizeMake(0, 180);
            node.cornerRadius = 12;
            node.clipsToBounds = YES;
            // 示例：设置一个区域
            node.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(35.0, 103.0), MKCoordinateSpanMake(20, 20));
            node.liveMap = YES;
        });
    };return _mapNode;
}

@end
