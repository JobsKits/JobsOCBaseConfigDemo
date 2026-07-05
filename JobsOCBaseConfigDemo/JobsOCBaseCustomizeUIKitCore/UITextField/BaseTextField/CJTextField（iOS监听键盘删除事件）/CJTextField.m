//
//  CJTextField.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CJTextField.h"
#import "UITextField+Extra.h"

@implementation CJTextField

-(void)deleteBackward{
    [super deleteBackward];
    if ([self.cj_delegate respondsToSelector:@selector(cjTextFieldDeleteBackward)]) {
        self.cj_delegate.cjTextFieldDeleteBackward(self);
    }
}
/// 在iOS8.0到iOS8.2的系统中，deleteBackward方法不响应了！！！但是iOS8之前和iOS8.3及之后是可以响应的。
/// 下列代码解决这个问题
-(BOOL)keyboardInputShouldDelete:(UITextField *)textField{
    BOOL shouldDelete = YES;
    if ([UITextField instancesRespondToSelector:_cmd]) {
        BOOL (*keyboardInputShouldDelete)(id, SEL, UITextField *) = (BOOL (*)(id, SEL, UITextField *))[UITextField instanceMethodForSelector:_cmd];
        if (keyboardInputShouldDelete) {
            shouldDelete = keyboardInputShouldDelete(self, _cmd, textField);
        }
    }
    if (!textField.text.length &&
        (self.deviceSystemVersion.intValue == 8) &&
        (self.deviceSystemVersion.floatValue < 8.3f)) {
        [self deleteBackward];
    };return shouldDelete;
}

@end
