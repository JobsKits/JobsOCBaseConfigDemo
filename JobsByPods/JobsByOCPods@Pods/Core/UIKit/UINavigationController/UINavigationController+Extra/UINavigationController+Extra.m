//
//  UINavigationController+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UINavigationController+Extra.h"

@implementation UINavigationController (Extra)
+(JobsRetNavCtrByVCBlock _Nonnull)initBy{
    @jobs_weakify(self)
    return ^__kindof UINavigationController *_Nullable(__kindof UIViewController *_Nonnull vc){
        @jobs_strongify(self)
        if([vc isKindOfClass:UINavigationController.class]){
            return (UINavigationController *)vc;
        }else{
            return [self.class.alloc initWithRootViewController:vc];
        }
    };
}

-(UIViewController *)rootViewController{
    return self.viewControllers.firstObject;
}

-(jobsByNSIntegerBlock _Nonnull)navDirectionBy{
    @jobs_weakify(self)
    return ^(NSInteger data){
        @jobs_strongify(self)
        [JobsNavigationTransitionMgr setDirection:(JobsDirectionType)data forNavigationController:self];
    };
}

-(JobsRetNavCtrByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UINavigationController *_Nullable(id <UINavigationControllerDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

@end
