//
//  UIGestureRecognizer+ReactiveCocoaProtected.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIGestureRecognizer+ReactiveCocoaProtected.h"

@implementation UIGestureRecognizer (ReactiveCocoaProtected)
#pragma mark —— Prop_strong()RACGestureRecognizerActionHandler *rac_gestureHandler;
JobsKey(_rac_gestureHandler)
@dynamic rac_gestureHandler;
-(RACGestureRecognizerActionHandler *)rac_gestureHandler{
    return Jobs_getAssociatedObject(_rac_gestureHandler);
}

-(void)setRac_gestureHandler:(RACGestureRecognizerActionHandler *)rac_gestureHandler{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rac_gestureHandler, rac_gestureHandler);
}
#pragma mark —— Prop_strong()RACSubject *rac_subject;
JobsKey(_rac_subject)
@dynamic rac_subject;
-(RACSubject *)rac_subject{
    return Jobs_getAssociatedObject(_rac_subject);
}

-(void)setRac_subject:(RACSubject *)rac_subject{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rac_subject, rac_subject);
}

@end
