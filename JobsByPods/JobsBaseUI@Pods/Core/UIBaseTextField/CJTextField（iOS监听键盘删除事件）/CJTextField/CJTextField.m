//
//  CJTextField.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CJTextField.h"

#import <JobsBaseUI/UITextField+Extra.h>

@implementation CJTextField
-(void)deleteBackward{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CJTextField.class, @selector(jobsDeleteBackward)))(self, @selector(jobsDeleteBackward));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsDeleteBackward{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super deleteBackward];
        if ([self.cj_delegate respondsToSelector:@selector(cjTextFieldDeleteBackward)]) {
            self.cj_delegate.cjTextFieldDeleteBackward(self);
        }
    };
}
/// 在iOS8.0到iOS8.2的系统中，deleteBackward方法不响应了！！！但是iOS8之前和iOS8.3及之后是可以响应的。
/// 下列代码解决这个问题
-(JobsRetBOOLByUITextFieldBlock _Nonnull)keyboardInputShouldDelete{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        BOOL shouldDelete = YES;
        if ([UITextField instancesRespondToSelector:_cmd]) {
            BOOL (*keyboardInputShouldDelete)(id, SEL, UITextField *) = (BOOL (*)(id, SEL, UITextField *))[UITextField instanceMethodForSelector:_cmd];
            if (keyboardInputShouldDelete) {
                shouldDelete = keyboardInputShouldDelete(self, _cmd, textField);
            }
        }
        if (!textField.text.length &&
            (self.deviceSystemVersion().intValue == 8) &&
            (self.deviceSystemVersion().floatValue < 8.3f)) {
            [self deleteBackward];
        };return shouldDelete;
    };
}

@end
