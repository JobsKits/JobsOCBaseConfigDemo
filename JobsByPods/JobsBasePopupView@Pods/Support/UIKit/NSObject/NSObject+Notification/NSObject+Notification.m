//
//  NSObject+Notification.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Notification.h"

@implementation NSObject (Notification)
/// 接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
                     block:(jobsByTwoIDBlock _Nullable)block{
    @jobs_weakify(self)
    [JobsNotificationCenter addObserver:self
                               selector:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                     id _Nullable arg) {
        @jobs_strongify(self)
        if (block) block(self, arg);
        return nil;
    }, MethodName(self), self) name:notificationName object:nil];
}

@end
