//
//  UIViewController+JobsPresentTransition.m
//  JobsPresentTransitionMgr
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "UIViewController+JobsPresentTransition.h"

@implementation UIViewController (JobsPresentTransition)

-(JobsPresentTransitionMgr *)jobs_presentViewController:(UIViewController *)presentedViewController{
    return [self jobs_presentViewController:presentedViewController
                                  configure:nil
                                 completion:nil];
}

-(JobsPresentTransitionMgr *)jobs_presentViewController:(UIViewController *)presentedViewController
                                             configure:(jobsByPresentTransitionManagerBlock)configure
                                            completion:(jobsByVoidBlock)completion{
    return [JobsPresentTransitionMgr presentViewController:presentedViewController
                                        fromViewController:self
                                                 configure:configure
                                                completion:completion];
}

@end
