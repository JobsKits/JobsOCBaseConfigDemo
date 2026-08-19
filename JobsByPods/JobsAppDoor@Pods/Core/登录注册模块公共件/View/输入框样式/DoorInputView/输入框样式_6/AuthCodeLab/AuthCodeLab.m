//
//  AuthCodeLab.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AuthCodeLab.h"

@interface AuthCodeLab ()

@end

@implementation AuthCodeLab
- (instancetype)init{
    if (self = [super init]) {
        self.byUserInteractionEnabled(YES);
        self.requestAuthCode();
    };return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(AuthCodeLab.class, @selector(requestAuthCode)))(self, @selector(requestAuthCode)))();
}
// 获取验证码
-(jobsByVoidBlock _Nonnull)requestAuthCode{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    };
}

@end
