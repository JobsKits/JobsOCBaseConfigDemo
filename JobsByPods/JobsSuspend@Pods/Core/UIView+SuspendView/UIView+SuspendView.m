//
//  UIView+SuspendView.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+SuspendView.h"
#import <JobsSuspend/UIView+Measure.h>

@interface JobsSuspendGestureDelegate : NSObject<UIGestureRecognizerDelegate>

@end

@implementation JobsSuspendGestureDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    BOOL hasPan = [gestureRecognizer isKindOfClass:UIPanGestureRecognizer.class] ||
        [otherGestureRecognizer isKindOfClass:UIPanGestureRecognizer.class];
    BOOL hasLongPress = [gestureRecognizer isKindOfClass:UILongPressGestureRecognizer.class] ||
        [otherGestureRecognizer isKindOfClass:UILongPressGestureRecognizer.class];
    return hasPan && hasLongPress;
}

@end

static CGRect JobsSuspendAvailableBounds(UIView *container) {
    return UIEdgeInsetsInsetRect(container.bounds, container.safeAreaInsets);
}

static CGPoint JobsSuspendClampedOrigin(CGPoint origin, CGSize size, CGRect bounds) {
    CGFloat maxX = MAX(CGRectGetMinX(bounds), CGRectGetMaxX(bounds) - size.width);
    CGFloat maxY = MAX(CGRectGetMinY(bounds), CGRectGetMaxY(bounds) - size.height);
    return CGPointMake(MIN(MAX(CGRectGetMinX(bounds), origin.x), maxX),
                       MIN(MAX(CGRectGetMinY(bounds), origin.y), maxY));
}

@implementation UIView (SuspendView)
#pragma mark —— @property(nonatomic,weak)UIViewController *vc;
JobsKey(_vc)
@dynamic vc;
-(UIViewController *)vc{
    UIViewController *VC = Jobs_getAssociatedObject(_vc);
    if (!VC) {
        JobsLog(@"VC 不能为空");
    };return VC;
}

-(void)setVc:(UIViewController *)vc{
    Jobs_setAssociatedRETAIN_NONATOMIC(_vc, vc)
}
JobsKey(_suspendHapticOnDock)
@dynamic suspendHapticOnDock;
-(BOOL)suspendHapticOnDock{
    return [Jobs_getAssociatedObject(_suspendHapticOnDock) boolValue];
}

-(void)setSuspendHapticOnDock:(BOOL)suspendHapticOnDock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_suspendHapticOnDock, @(suspendHapticOnDock))
}
JobsKey(_suspendConfineInSafeArea)
@dynamic suspendConfineInSafeArea;
-(BOOL)suspendConfineInSafeArea{
    NSNumber *value = Jobs_getAssociatedObject(_suspendConfineInSafeArea);
    if (!value) {
        value = @YES;
        Jobs_setAssociatedRETAIN_NONATOMIC(_suspendConfineInSafeArea, value)
    };return value.boolValue;
}

-(void)setSuspendConfineInSafeArea:(BOOL)suspendConfineInSafeArea{
    Jobs_setAssociatedRETAIN_NONATOMIC(_suspendConfineInSafeArea, @(suspendConfineInSafeArea))
}

-(JobsRetViewByCGPointBlock _Nonnull)bySuspendOriginInSafeArea{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGPoint origin) {
        @jobs_strongify(self)
        UIView *container = self.superview;
        if (!container) return self;
        [container layoutIfNeeded];
        CGRect availableBounds = JobsSuspendAvailableBounds(container);
        CGPoint safeAreaOrigin = CGPointMake(CGRectGetMinX(availableBounds) + origin.x,
                                             CGRectGetMinY(availableBounds) + origin.y);
        if (self.suspendConfineInSafeArea) {
            safeAreaOrigin = JobsSuspendClampedOrigin(safeAreaOrigin, self.bounds.size, availableBounds);
        }
        self.byFrame(CGRectMake(safeAreaOrigin.x,
                                safeAreaOrigin.y,
                                CGRectGetWidth(self.bounds),
                                CGRectGetHeight(self.bounds)));
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byHapticOnDock{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL enabled) {
        @jobs_strongify(self)
        self.suspendHapticOnDock = enabled;
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)byConfineInSafeArea{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL enabled) {
        @jobs_strongify(self)
        self.suspendConfineInSafeArea = enabled;
        return self;
    };
}
#pragma mark —— Prop_strong()UIPanGestureRecognizer *panRcognize;
JobsKey(_panRcognize)
JobsKey(_suspendGestureDelegate)
@dynamic panRcognize;
-(UIPanGestureRecognizer *)panRcognize{
    UIPanGestureRecognizer *PanRcognize = Jobs_getAssociatedObject(_panRcognize);
    if (!PanRcognize) {
        self.weak_target = self;/// ⚠️注意：任何手势这一句都要写
        @jobs_weakify(self)
        self.panGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                           UIPanGestureRecognizer *_Nullable recognizer) {
            @jobs_strongify(self)
            UIView *container = recognizer.view.superview;
            if (!container) return nil;
            CGRect availableBounds = JobsSuspendAvailableBounds(container);
            switch (recognizer.state) {
                /// 处理 UIGestureRecognizerStateChanged 分支
                case UIGestureRecognizerStateChanged:{
                    CGPoint translation = [recognizer translationInView:container];
                    CGPoint origin = CGPointMake(CGRectGetMinX(recognizer.view.frame) + translation.x,
                                                 CGRectGetMinY(recognizer.view.frame) + translation.y);
                    if (self.suspendConfineInSafeArea) {
                        origin = JobsSuspendClampedOrigin(origin, recognizer.view.bounds.size, availableBounds);
                    }
                    recognizer.view.byFrame(CGRectMake(origin.x,
                                                       origin.y,
                                                       CGRectGetWidth(recognizer.view.bounds),
                                                       CGRectGetHeight(recognizer.view.bounds)));
                }
                    break;
                /// 处理 UIGestureRecognizerStateEnded 分支
                case UIGestureRecognizerStateEnded:
                /// 处理 UIGestureRecognizerStateCancelled 分支
                case UIGestureRecognizerStateCancelled:
                /// 处理 UIGestureRecognizerStateFailed 分支
                case UIGestureRecognizerStateFailed:{
                    CGRect frame = recognizer.view.frame;
                    CGPoint center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
                    CGFloat leftDistance = fabs(center.x - CGRectGetMinX(availableBounds));
                    CGFloat rightDistance = fabs(CGRectGetMaxX(availableBounds) - center.x);
                    CGFloat topDistance = fabs(center.y - CGRectGetMinY(availableBounds));
                    CGFloat bottomDistance = fabs(CGRectGetMaxY(availableBounds) - center.y);
                    CGFloat minimumDistance = MIN(MIN(leftDistance, rightDistance), MIN(topDistance, bottomDistance));
                    CGPoint targetOrigin = frame.origin;
                    if (minimumDistance == leftDistance) {
                        targetOrigin.x = CGRectGetMinX(availableBounds);
                    }else if (minimumDistance == rightDistance){
                        targetOrigin.x = CGRectGetMaxX(availableBounds) - CGRectGetWidth(frame);
                    }else if (minimumDistance == topDistance){
                        targetOrigin.y = CGRectGetMinY(availableBounds);
                    }else{
                        targetOrigin.y = CGRectGetMaxY(availableBounds) - CGRectGetHeight(frame);
                    }
                    targetOrigin = JobsSuspendClampedOrigin(targetOrigin, frame.size, availableBounds);
                    [UIView animateWithDuration:0.25
                                          delay:0
                                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                                     animations:^{
                        recognizer.view.byFrame(CGRectMake(targetOrigin.x,
                                                           targetOrigin.y,
                                                           CGRectGetWidth(frame),
                                                           CGRectGetHeight(frame)));
                    } completion:^(__unused BOOL finished) {
                        if (self.suspendHapticOnDock) {
                            UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
                            [generator impactOccurred];
                        }
                    }];
                }
                    break;
                /// 未匹配已知分支时执行兜底处理
                default:
                    break;
            }
            [recognizer setTranslation:CGPointMake(0, 0)
                                inView:container];
            return nil;
        }];
        PanRcognize = self.panGR;
        JobsSuspendGestureDelegate *delegate = Jobs_getAssociatedObject(_suspendGestureDelegate);
        if (!delegate) {
            delegate = JobsSuspendGestureDelegate.new;
            Jobs_setAssociatedRETAIN_NONATOMIC(_suspendGestureDelegate, delegate)
        }
        PanRcognize.delegate = delegate;
        PanRcognize.byEnabled(YES);
        PanRcognize.minimumNumberOfTouches = 1;
        PanRcognize.maximumNumberOfTouches = 2;
        PanRcognize.delaysTouchesEnded = NO;
        PanRcognize.cancelsTouchesInView = NO;
        Jobs_setAssociatedRETAIN_NONATOMIC(_panRcognize, PanRcognize)
    };return PanRcognize;
}

-(void)setPanRcognize:(UIPanGestureRecognizer *)panRcognize{
    Jobs_setAssociatedRETAIN_NONATOMIC(_panRcognize, panRcognize)
}

@end
