//
//  NSNotificationKeyboardModel.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSNotificationKeyboardModel.h"

@implementation NSNotificationKeyboardModel
/**
 关于键盘弹起：
 1、建议用RAC进行键盘管理，因为过滤字符比如emoji字符会很难处理
    1.1、关注：@implementation UITextField (Extra) -(void)jobsTextFieldEventFilterBlock:(JobsReturnBOOLByIDBlock)filterBlock subscribeNextBlock:(jobsByIDBlock)subscribeNextBlock；
    1.2、RAC 键盘管理当“注册键盘事件”的时候会执行一次RAC键盘监听方法
 2、键盘弹起会执行-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField；
 */
@end
