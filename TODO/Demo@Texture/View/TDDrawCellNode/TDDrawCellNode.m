//
//  TDDrawCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDDrawCellNode.h"

@interface TDDrawCellNode ()

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASLayoutElementStyle
@interface ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_8603ed8d1a)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize;
-(void)setPreferredSize:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASLayoutElementStyle

@implementation TDDrawCellNode
- (instancetype)init {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.canvas.placeholderEnabled = YES;
    };return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDDrawCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 16, 8, 16) child:_canvas];
    };
}
#pragma mark —— lazyLoad
-(TDDrawingNode *)canvas{
    if(!_canvas){
        _canvas = jobsMakeDrawingNode(^(TDDrawingNode * _Nullable node) {
            node.style.byPreferredSize(CGSizeMake(0, 120)); // 高度 120，宽度由父布局给
        });
    };return _canvas;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ASLayoutElementStyle
@implementation ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_8603ed8d1a)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize{
    @jobs_weakify(self)
    return ^__kindof ASLayoutElementStyle * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setPreferredSize:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ASLayoutElementStyle
