//
//  JobsNavigationTransitionMgr.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNavigationTransitionMgr.h"

#import <JobsNavigationTransitionMgr/UIView+Extra.h>
#import <JobsNavigationTransitionMgr/UIViewController+Extra.h>
#import <JobsNavigationTransitionMgr/UIGestureRecognizer+Extra.h>

@interface JobsNavigationTransitionMgr ()

Prop_weak()UIViewController *viewController;
Prop_assign()JobsTransitionDirection direction;
Prop_strong()UIPercentDrivenInteractiveTransition *interactiveTransition;
Prop_assign()ComingStyle comingStyle;
Prop_strong()UIPanGestureRecognizer *panGesture;

@end

@implementation JobsNavigationTransitionMgr
#define JobsNavigationTransitionMgrDSL(_type_, _name_, _property_, _dataType_) \
-(JobsRetNavigationTransitionMgrBy##_type_##Block _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsNavigationTransitionMgr *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}
JobsNavigationTransitionMgrDSL(VC, ViewController, viewController, UIViewController *_Nullable)
JobsNavigationTransitionMgrDSL(Direction, Direction, direction, JobsTransitionDirection)
JobsNavigationTransitionMgrDSL(InteractiveTransition, InteractiveTransition, interactiveTransition, UIPercentDrivenInteractiveTransition *_Nullable)
JobsNavigationTransitionMgrDSL(ComingStyle, ComingStyle, comingStyle, ComingStyle)
#undef JobsNavigationTransitionMgrDSL

static JobsTransitionDirection _storedDirection;
static JobsNavigationTransitionMgr *static_navigationTransitionMgr = nil;
static dispatch_once_t static_navigationTransitionManagerOnceToken;
JobsKey(_navigationTransitionMgr)
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsNavigationTransitionMgr.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_navigationTransitionManagerOnceToken = 0;
        static_navigationTransitionMgr = nil;
    };
}

+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsNavigationTransitionMgr.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_navigationTransitionManagerOnceToken, ^{
            static_navigationTransitionMgr = JobsNavigationTransitionMgr.new;
        });return static_navigationTransitionMgr;
    };
}
#pragma mark —— 一些私有方法
-(JobsRetBOOLByVoidBlock _Nonnull)isPush{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.comingStyle == ComingStyle_PUSH;
    };
}
#pragma mark —— 一些公共方法
+(void)setDirection:(JobsTransitionDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC{
    if (!navCtrlVC) return;
    JobsNavigationTransitionMgr *manager = jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr * _Nullable manager) {
        manager.byDirection(direction);
    });
    Jobs_setAssociatedRETAIN_NONATOMICByTarget(navCtrlVC, _navigationTransitionMgr, manager)
    navCtrlVC.byDelegate(manager);
}
/// 自定义 push/pop 控制器的手势方向
+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsTransitionDirection)direction {
    if (!viewController) return;
    UINavigationController *navigationController = viewController.navigationController;
    if (!navigationController) return;
    JobsNavigationTransitionMgr *previous = Jobs_getAssociatedObjectByTarget(viewController, _navigationTransitionMgr);
    if (previous.panGesture) {
        [viewController.view removeGestureRecognizer:previous.panGesture];
    }
    JobsNavigationTransitionMgr *manager = jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr * _Nullable manager) {
        manager
            .byViewController(viewController)
            .byDirection(direction);
    });
    Jobs_setAssociatedRETAIN_NONATOMICByTarget(viewController, _navigationTransitionMgr, manager)
    viewController.clzPopGesture();
    navigationController.byDelegate(manager);
    @jobs_weakify(manager)
    @jobs_weakify(viewController)
    manager.panGesture = (jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
        gesture.byDelegate(manager);
    })).GestureActionBy(^(UIPanGestureRecognizer * _Nullable gesture) {
        @jobs_strongify(manager)
        @jobs_strongify(viewController)
        if (!manager || !viewController || !gesture.view) return;
        UINavigationController *navigation = viewController.navigationController;
        CGPoint translation = [gesture translationInView:gesture.view];
        BOOL horizontal = manager.direction == JobsTransitionDirectionLeft || manager.direction == JobsTransitionDirectionRight;
        CGFloat extent = horizontal ? CGRectGetWidth(gesture.view.bounds) : CGRectGetHeight(gesture.view.bounds);
        CGFloat displacement = horizontal ? translation.x : translation.y;
        if (manager.direction == JobsTransitionDirectionLeft || manager.direction == JobsTransitionDirectionTop) displacement = -displacement;
        CGFloat progress = isfinite(extent) && extent > 0 && isfinite(displacement) ? MIN(1, MAX(0, displacement / extent)) : 0;
        switch (gesture.state) {
            /// 只在开始时判方向，后续反向拖动仍要更新与结束已创建的会话
            case UIGestureRecognizerStateBegan: {
                CGPoint velocity = [gesture velocityInView:gesture.view];
                if (!navigation || navigation.viewControllers.count < 2 || navigation.topViewController != viewController || navigation.transitionCoordinator || JobsNavigationTransitionMgr.directionByPoint(velocity) != manager.direction) return;
                manager.byInteractiveTransition(UIPercentDrivenInteractiveTransition.new);
                [navigation popViewControllerAnimated:YES];
                break;
            }
            /// 当前会话按照自身方向更新且始终限制在 0...1
            case UIGestureRecognizerStateChanged:
                [manager.interactiveTransition updateInteractiveTransition:progress];
                break;
            /// 正常结束按阈值完成或取消
            case UIGestureRecognizerStateEnded:
                if (progress >= 0.3) {
                    [manager.interactiveTransition finishInteractiveTransition];
                } else {
                    [manager.interactiveTransition cancelInteractiveTransition];
                }
                manager.byInteractiveTransition(nil);
                break;
            /// 系统取消必须回滚
            case UIGestureRecognizerStateCancelled:
            /// 识别失败必须回滚
            case UIGestureRecognizerStateFailed:
                [manager.interactiveTransition cancelInteractiveTransition];
                manager.byInteractiveTransition(nil);
                break;
            /// 尚未识别，不建立交互会话
            default:
                break;
        }
    });
    viewController.view.addGesture(manager.panGesture);
}
#pragma mark —— UINavigationControllerDelegate
/// 当导航控制器要执行动画切换时，询问是否需要一个交互式的转场控制器
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                      interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactiveTransition;
}
/// 当前导航操作（push 或 pop）时，应该使用哪个自定义转场动画对象
/// - Parameters:
///   - navigationController: 当前正在执行操作的导航控制器
///   - operation: 导航操作的类型（push / pop）
///   - fromVC: 当前正在离开的控制器（源）
///   - toVC: 当前正在进入的控制器（目标）
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC {
    if(operation == UINavigationControllerOperationPush){
        return jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr * _Nullable manager) {
            manager
                .byDirection(self.direction)
                .byComingStyle(ComingStyle_PUSH);
        });
    }
    if(operation == UINavigationControllerOperationPop){
        return jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr * _Nullable manager) {
            manager
                .byDirection(self.direction)
                .byComingStyle(ComingStyle_POP);
        });
    };return nil;
}
#pragma mark —— UIViewControllerAnimatedTransitioning
/// 自定义转场动画需要多长时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock action = ((JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavigationTransitionMgr.class, @selector(jobsTransitionDuration)))(self, @selector(jobsTransitionDuration));
    return action ? action(transitionContext) : (NSTimeInterval){0};
}

-(JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock _Nonnull)jobsTransitionDuration{
    @jobs_weakify(self)
    return ^NSTimeInterval(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return (NSTimeInterval){0};
        return isfinite(self.time) && self.time > 0 ? self.time : 1;
    };
}
/// 执行自定义的视图控制器转场动画逻辑（位移动画、缩放、透明度等）（push、pop、present、dismiss）
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    ((((jobsByIDUIViewControllerContextTransitioningBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavigationTransitionMgr.class, @selector(animateTransition)))(self, @selector(animateTransition))))(transitionContext);
}
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)animateTransition{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIView *containerView = transitionContext.containerView;
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey] ?: fromVC.view;
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey] ?: toVC.view;
        if (!fromView || !toView || !containerView) {
            [transitionContext completeTransition:NO];
            return;
        }
        CGRect originalFromFrame = fromView.frame;
        CGRect originalToFrame = toView.frame;
        BOOL toWasInContainer = toView.superview == containerView;
        CGRect fromInitialFrame = [transitionContext initialFrameForViewController:fromVC];
        CGRect toFinalFrame = [transitionContext finalFrameForViewController:toVC];
        if (CGRectIsEmpty(fromInitialFrame)) fromInitialFrame = containerView.bounds;
        if (CGRectIsEmpty(toFinalFrame)) toFinalFrame = containerView.bounds;
        CGFloat width = CGRectGetWidth(containerView.bounds);
        CGFloat height = CGRectGetHeight(containerView.bounds);
        CGFloat dx = 0;
        CGFloat dy = 0;
        switch (self.direction) {
            /// 向左滑动
            case JobsTransitionDirectionLeft:
                dx = -width;
                break;
            /// 向右滑动
            case JobsTransitionDirectionRight:
                dx = width;
                break;
            /// 向上滑动
            case JobsTransitionDirectionTop:
                dy = -height;
                break;
            /// 向下滑动
            case JobsTransitionDirectionBottom:
                dy = height;
                break;
        }
        BOOL pushes = self.isPush();
        if (pushes) {
            containerView.addSubview(toView);
            toView.byFrame(CGRectOffset(toFinalFrame, dx, dy));
        } else {
            [containerView insertSubview:toView belowSubview:fromView];
            toView.byFrame(toFinalFrame);
        }
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            if (pushes) {
                toView.byFrame(toFinalFrame);
            } else {
                fromView.byFrame(CGRectOffset(fromInitialFrame, dx, dy));
            }
        } completion:^(__unused BOOL finished) {
            BOOL cancelled = transitionContext.transitionWasCancelled;
            if (cancelled) {
                fromView.byFrame(originalFromFrame);
                toView.byFrame(originalToFrame);
                if (!toWasInContainer) toView.byRemoveFromSuperview();
            }
            [transitionContext completeTransition:!cancelled];
        }];
    };
}
/// BaseProtocol
@synthesize time = _time;
-(CGFloat)time{
    if(!_time){
        _time = 1;
    };return _time;
}

@end
