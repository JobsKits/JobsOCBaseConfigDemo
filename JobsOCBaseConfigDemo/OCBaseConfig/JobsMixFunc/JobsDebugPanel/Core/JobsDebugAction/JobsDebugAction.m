//
//  JobsDebugAction.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugAction.h"

#if DEBUG
@implementation JobsDebugAction

-(instancetype)init {
    if (self = [super init]) {
        _title = @"";
    }
    return self;
}

-(JobsRetDebugActionByStringBlock _Nonnull)byTitle {
    @jobs_weakify(self)
    return ^JobsDebugAction *(NSString * value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_title = value.copy ?: @"";
        return self;
    };
}

-(JobsRetDebugActionByImageBlock _Nonnull)byImage {
    @jobs_weakify(self)
    return ^JobsDebugAction *(UIImage * value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_image = value;
        return self;
    };
}

-(JobsRetDebugActionByHandlerBlock _Nonnull)byAction {
    @jobs_weakify(self)
    return ^JobsDebugAction *(JobsDebugActionHandler value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_handler = [value copy];
        return self;
    };
}

@end
#endif
