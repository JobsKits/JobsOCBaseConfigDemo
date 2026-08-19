//
//  TransitionController.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TransitionController.h"

@interface TransitionController()

Prop_weak()id<UIViewControllerContextTransitioning> transitionContext;
Prop_strong(readonly)UIPanGestureRecognizer *gestureRecognizer;
Prop_assign(readwrite)CGPoint initialTranslationInContainerView;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN TransitionController
@interface TransitionController (JobsPropertyDSLSetterAutogen_e5799f3aa8)
-(void)setInitialTranslationInContainerView:(CGPoint)data;
-(void)setTransitionContext:(id<UIViewControllerContextTransitioning> _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END TransitionController

@implementation TransitionController
- (void)dealloc{
    [self.gestureRecognizer removeTarget:self
                                  action:@selector(gestureRecognizeDidUpdate:)];
}

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer{
    if (self = [super init]){
        _gestureRecognizer = gestureRecognizer;
        [_gestureRecognizer addTarget:self
                               action:@selector(gestureRecognizeDidUpdate:)];
    };return self;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:NSInvalidArgumentException
                                   reason:@"Use -initWithGestureRecognizer:"
                                 userInfo:nil];
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    ((((jobsByIDUIViewControllerContextTransitioningBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TransitionController.class, @selector(startInteractiveTransition)))(self, @selector(startInteractiveTransition))))(transitionContext);
}
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)startInteractiveTransition{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
        self.byTransitionContext(transitionContext);
        self.byInitialTranslationInContainerView([self.gestureRecognizer translationInView:transitionContext.containerView]);
        [super startInteractiveTransition:transitionContext];
    };
}

-(JobsRetCGFloatByUIPanGestureRecognizerBlock _Nonnull)percentForGesture{
    @jobs_weakify(self)
    return ^CGFloat(UIPanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        UIView *transitionContainerView = self.transitionContext.containerView;
        CGPoint translation = [gesture translationInView:gesture.view.superview];
        if ((translation.x > 0.f && self.initialTranslationInContainerView.x < 0.f) ||
            (translation.x < 0.f && self.initialTranslationInContainerView.x > 0.f)){
            return -1.f;
        };return fabs(translation.x)/CGRectGetWidth(transitionContainerView.bounds);
    };
}

- (void)gestureRecognizeDidUpdate:(UIScreenEdgePanGestureRecognizer *)gestureRecognizer{
    jobsByScreenEdgePanGestureRecognizerBlock action = ((jobsByScreenEdgePanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TransitionController.class, @selector(jobsGestureRecognizeDidUpdate)))(self, @selector(jobsGestureRecognizeDidUpdate));
    if (action) action(gestureRecognizer);
}

-(jobsByScreenEdgePanGestureRecognizerBlock _Nonnull)jobsGestureRecognizeDidUpdate{
    @jobs_weakify(self)
    return ^(UIScreenEdgePanGestureRecognizer * gestureRecognizer){
        @jobs_strongify(self)
        if (!self) return;
        switch (gestureRecognizer.state) {
            /// 处理 UIGestureRecognizerStateBegan 分支
            case UIGestureRecognizerStateBegan:
                break;
            /// 处理 UIGestureRecognizerStateChanged 分支
            case UIGestureRecognizerStateChanged:
                if (self.percentForGesture(gestureRecognizer) < 0.f) {
                    [self cancelInteractiveTransition];
                    [self.gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
                }
                else {
                    [self updateInteractiveTransition:self.percentForGesture(gestureRecognizer)];
                }break;
            /// 处理 UIGestureRecognizerStateEnded 分支
            case UIGestureRecognizerStateEnded:
                if (self.percentForGesture(gestureRecognizer) >= 0.4f){
                    [self finishInteractiveTransition];
                }
                else{
                    [self cancelInteractiveTransition];
                }break;
            /// 未匹配已知分支时执行兜底处理
            default:
                [self cancelInteractiveTransition];
                break;
        }
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN TransitionController
-(JobsRetTransitionControllerByCGPointBlock _Nonnull)byInitialTranslationInContainerView{
    @jobs_weakify(self)
    return ^__kindof TransitionController * _Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setInitialTranslationInContainerView:data];
        return self;
    };
}

-(JobsRetTransitionControllerByIDUIViewControllerContextTransitioningBlock _Nonnull)byTransitionContext{
    @jobs_weakify(self)
    return ^__kindof TransitionController * _Nullable(id<UIViewControllerContextTransitioning> _Nullable data){
        @jobs_strongify(self)
        [self setTransitionContext:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END TransitionController
@end
