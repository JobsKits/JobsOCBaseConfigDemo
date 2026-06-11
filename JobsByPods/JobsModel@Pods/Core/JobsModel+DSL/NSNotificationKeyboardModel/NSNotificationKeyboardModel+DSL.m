//
//  NSNotificationKeyboardModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "NSNotificationKeyboardModel+DSL.h"

@implementation NSNotificationKeyboardModel (DSL)

#pragma mark —— 来自 NSNotificationKeyboardModel
-(__kindof NSNotificationKeyboardModel *_Nonnull (^ _Nonnull)(CGRect data))byBeginFrame{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.beginFrame = data;
        return self;
    };
}

-(__kindof NSNotificationKeyboardModel *_Nonnull (^ _Nonnull)(CGRect data))byEndFrame{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.endFrame = data;
        return self;
    };
}

-(__kindof NSNotificationKeyboardModel *_Nonnull (^ _Nonnull)(CGFloat data))byKeyboardOffsetY{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.keyboardOffsetY = data;
        return self;
    };
}

@end
