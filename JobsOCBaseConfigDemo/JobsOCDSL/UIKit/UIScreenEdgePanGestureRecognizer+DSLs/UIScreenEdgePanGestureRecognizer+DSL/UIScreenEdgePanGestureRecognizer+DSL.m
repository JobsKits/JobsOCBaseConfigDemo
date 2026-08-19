//
//  UIScreenEdgePanGestureRecognizer+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "UIScreenEdgePanGestureRecognizer+DSL.h"

@implementation UIScreenEdgePanGestureRecognizer (JobsChain)
-(JobsRetScreenEdgePanGestureRecognizerByUIRectEdgeBlock _Nonnull)byEdges{
    @jobs_weakify(self)
    return ^__kindof UIScreenEdgePanGestureRecognizer *_Nullable(UIRectEdge data){
        @jobs_strongify(self)
        self.edges = data;
        return self;
    };
}

@end
