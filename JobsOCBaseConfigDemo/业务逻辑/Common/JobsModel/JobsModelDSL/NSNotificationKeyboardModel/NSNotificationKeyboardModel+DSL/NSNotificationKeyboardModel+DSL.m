//
//  NSNotificationKeyboardModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "NSNotificationKeyboardModel+DSL.h"

@implementation NSNotificationKeyboardModel (DSL)

-(JobsRetNSNotificationKeyboardModelByFrameBlock _Nonnull)byBeginFrame{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.beginFrame = data;
        return self;
    };
}

-(JobsRetNSNotificationKeyboardModelByFrameBlock _Nonnull)byEndFrame{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.endFrame = data;
        return self;
    };
}

-(JobsRetNSNotificationKeyboardModelByCGFloatBlock _Nonnull)byKeyboardOffsetY{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.keyboardOffsetY = data;
        return self;
    };
}

-(JobsRetNSNotificationKeyboardModelByStrBlock _Nonnull)byNotificationName{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.notificationName = data;
        return self;
    };
}

-(JobsRetNSNotificationKeyboardModelByDicBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nullable(NSDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetNSNotificationKeyboardModelByIDBlock _Nonnull)byAnObject{
    @jobs_weakify(self)
    return ^__kindof NSNotificationKeyboardModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.anObject = data;
        return self;
    };
}

@end
