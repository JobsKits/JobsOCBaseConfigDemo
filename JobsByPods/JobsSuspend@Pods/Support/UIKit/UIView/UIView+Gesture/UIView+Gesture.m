//
//  UIView+Gesture.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Gesture.h"

@implementation UIView (Gesture)
#pragma mark —— Prop_assign()NSUInteger minimumNumberOfTouches
JobsKey(_minimumNumberOfTouches)
@dynamic minimumNumberOfTouches;
-(NSUInteger)minimumNumberOfTouches{
    return [Jobs_getAssociatedObject(_minimumNumberOfTouches) unsignedIntegerValue];
}

-(void)setMinimumNumberOfTouches:(NSUInteger)minimumNumberOfTouches{
    Jobs_setAssociatedRETAIN_NONATOMIC(_minimumNumberOfTouches, @(minimumNumberOfTouches))
}

#pragma mark —— Prop_strong()UIPanGestureRecognizer *panGR;
JobsKey(_panGR)
@dynamic panGR;
-(UIPanGestureRecognizer *)panGR{
    UIPanGestureRecognizer *PanGR = Jobs_getAssociatedObject(_panGR);
    if (!PanGR) {
        PanGR = [UIPanGestureRecognizer.alloc initWithTarget:self.weak_target action:nil];
        PanGR.delegate = self.weak_target;
        PanGR.target = self.weak_target;
        PanGR.minimumNumberOfTouches = self.minimumNumberOfTouches;
        if (self.panGR_SelImp.selector) PanGR.addAction(self.panGR_SelImp.selector);
        [self addGestureRecognizer:PanGR];
        [self setPanGR:PanGR];
    }return PanGR;
}

-(void)setPanGR:(UIPanGestureRecognizer *)panGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_panGR, panGR)
}
#pragma mark —— Prop_strong()JobsSEL_IMP *panGR_SelImp;
JobsKey(_panGR_SelImp)
@dynamic panGR_SelImp;
-(JobsSEL_IMP *)panGR_SelImp{
    JobsSEL_IMP *PanGR_SelImp = Jobs_getAssociatedObject(_panGR_SelImp);
    if (!PanGR_SelImp) {
        PanGR_SelImp = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_panGR_SelImp, PanGR_SelImp)
    }return PanGR_SelImp;
}

-(void)setPanGR_SelImp:(JobsSEL_IMP *)panGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_panGR_SelImp, panGR_SelImp)
}

@end
