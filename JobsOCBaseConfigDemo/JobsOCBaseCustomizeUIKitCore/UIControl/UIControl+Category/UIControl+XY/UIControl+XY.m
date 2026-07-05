//
//  UIControl+XY.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIControl+XY.h"

@implementation UIControl (XY)
JobsKey(_uxy_acceptEventInterval)
@dynamic uxy_acceptEventInterval;
/// 时间间隔
- (NSTimeInterval)uxy_acceptEventInterval{
    return [Jobs_getAssociatedObject(_uxy_acceptEventInterval) doubleValue];
}

- (void)setUxy_acceptEventInterval:(NSTimeInterval)uxy_acceptEventInterval{
    Jobs_setAssociatedRETAIN_NONATOMIC(_uxy_acceptEventInterval, @(uxy_acceptEventInterval))
}
/// 是否响应事件的标志位
JobsKey(_uxy_ignoreEvent)
-(BOOL)uxy_ignoreEvent{
    return [Jobs_getAssociatedObject(_uxy_ignoreEvent) boolValue];
}

-(void)setUxy_ignoreEvent:(BOOL)uxy_ignoreEvent{
    Jobs_setAssociatedRETAIN_NONATOMIC(_uxy_ignoreEvent, @(uxy_ignoreEvent))
}

+(void)load{
    //将系统的sendAction方法和自己实现的方法进行互换
    Method a = class_getInstanceMethod(self,@selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self,@selector(__uxy_sendAction:to:forEvent:));
    method_exchangeImplementations(a,b);
}
/// 点击后会先进入这里
- (void)__uxy_sendAction:(SEL)action
                      to:(id)target
                forEvent:(UIEvent *)event{
    if (self.uxy_ignoreEvent) return;//根据状态判断是否继续执行
    if (self.uxy_acceptEventInterval > 0){
        self.uxy_ignoreEvent = YES;
        //周期性清空标志位
        [self performSelector:@selector(setUxy_ignoreEvent:)
                   withObject:@(NO)
                   afterDelay:self.uxy_acceptEventInterval];
    }
    /// 这里其实是系统的原来的sendAction to方法。
    [self __uxy_sendAction:action
                        to:target
                  forEvent:event];
}

@end
