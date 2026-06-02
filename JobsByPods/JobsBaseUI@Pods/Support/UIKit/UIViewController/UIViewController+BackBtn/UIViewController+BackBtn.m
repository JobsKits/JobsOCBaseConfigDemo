//
//  UIViewController+BackBtn.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BackBtn.h"
#import <objc/message.h>

@implementation UIViewController (BackBtn)
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)backBtnClickEvent{
    @jobs_weakify(self)
    return ^(UIButton *_Nullable sender) {
        @jobs_strongify(self)
        SEL selector = NSSelectorFromString(@"jobsBackBtnClickEvent");
        if ([self respondsToSelector:selector]) {
            jobsByBtnBlock block = ((jobsByBtnBlock (*)(id, SEL))objc_msgSend)(self, selector);
            if (block) block(sender);
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    };
}

@end
