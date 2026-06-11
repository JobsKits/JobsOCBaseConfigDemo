//
//  UIScreenEdgePanGestureRecognizer+DSL.m
//  JobsOCDSL
//
#import "UIScreenEdgePanGestureRecognizer+DSL.h"

@implementation UIScreenEdgePanGestureRecognizer (JobsChain)
-(JobsRetScreenEdgePanGestureRecognizerByUIRectEdgeBlock)byEdges{
    @jobs_weakify(self)
    return ^__kindof UIScreenEdgePanGestureRecognizer *_Nullable(UIRectEdge data){
        @jobs_strongify(self)
        self.edges = data;
        return self;
    };
}

@end
