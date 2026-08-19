//
//  UIViewController+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+Extra.h"

@implementation UIViewController (Extra)
-(JobsRetVCByBOOLBlock _Nonnull)byFdInteractivePopDisabled{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.fd_interactivePopDisabled = data;
        return self;
    };
}
-(void)make:(MASConstraintMaker *)make topOffset:(CGFloat)topOffset{
//    JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape
    if(self.navBar && !self.setupNavigationBarHidden) {
        make.top.equalTo(((UIView *)self.navBar).mas_bottom).offset(topOffset);
    }else if (self.gk_navigationBar && !self.gk_statusBarHidden && !self.setupNavigationBarHidden){
        make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(topOffset);
    }else{
        make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil) + topOffset);
    }
}

-(JobsRetVCByVCBlock _Nonnull)addChildViewController{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(__kindof UIViewController *_Nonnull vc){
        @jobs_strongify(self)
        [self addChildViewController:vc];
        return self;
    };
}
/// 将自身用导航控制器进行包裹（如果自身就是导航控制器就什么也不做的返回）
-(JobsRetNavCtrByVoidBlock _Nonnull)navCtrl{
    @jobs_weakify(self)
    return ^UINavigationController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        if([self isKindOfClass:UINavigationController.class]){
            return (UINavigationController *)self;
        }else{
            return [UINavigationController.alloc initWithRootViewController:self];
        }
    };
}
/// 关闭系统自带的右滑关闭手势
-(jobsByVoidBlock _Nonnull)clzPopGesture{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.navigationController.interactivePopGestureRecognizer
            .byEnabled(NO)
            .byDelegate(nil);
        self.byFdInteractivePopDisabled(YES);
    };
}
/// 打开系统自带的右滑关闭手势
-(jobsByIDBlock _Nonnull)openPopGestureBy{
    @jobs_weakify(self)
    return ^(id <UIGestureRecognizerDelegate>_Nullable data){
        @jobs_strongify(self)
        self.navigationController.interactivePopGestureRecognizer
            .byEnabled(YES)
            .byDelegate(data);
        self.byFdInteractivePopDisabled(NO);
    };
}

@end
