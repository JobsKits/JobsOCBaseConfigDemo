//
//  JobsDebugEnvironment.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugEnvironment.h"

#if DEBUG
@implementation JobsDebugEnvironment

-(instancetype)init {
    if (self = [super init]) {
        _title = @"";
        _identifier = @"";
        _baseURL = @"";
    }
    return self;
}

-(JobsRetDebugEnvironmentByStringBlock _Nonnull)byIdentifier {
    @jobs_weakify(self)
    return ^JobsDebugEnvironment *(NSString * value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_identifier = value.copy ?: @"";
        return self;
    };
}

-(JobsRetDebugEnvironmentByStringBlock _Nonnull)byTitle {
    @jobs_weakify(self)
    return ^JobsDebugEnvironment *(NSString * value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_title = value.copy ?: @"";
        return self;
    };
}

-(JobsRetDebugEnvironmentByStringBlock _Nonnull)byBaseURL {
    @jobs_weakify(self)
    return ^JobsDebugEnvironment *(NSString * value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_baseURL = value.copy ?: @"";
        return self;
    };
}

@end
#endif

