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
        self.userInteractionEnabled = YES;
        [self requestAuthCode];
    };return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self requestAuthCode];
}
// 获取验证码
-(void)requestAuthCode{
}

@end
