//
//  JobsLocker.m
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsLocker.h"

@interface JobsLocker () {
    pthread_mutex_t _pthreadMutex;
    os_unfair_lock _unfairLock;
    dispatch_semaphore_t _semaphore;
}

Prop_strong(nullable)NSLock *normalLock;
Prop_strong(nullable)NSRecursiveLock *recursiveLockInternal;
Prop_assign(readwrite)JobsLockerType type;

@end

@implementation JobsLocker
#pragma mark —— Life Cycle

- (instancetype)initWithType:(JobsLockerType)type {
    self = [super init];
    if (self) {
        _type = type;
        switch (type) {
            /// 处理 JobsLockerTypeNSLock 分支
            case JobsLockerTypeNSLock: {
                _normalLock = jobsMakeLock(^(NSLock *object){});
            } break;
            /// 处理 JobsLockerTypeRecursiveLock 分支
            case JobsLockerTypeRecursiveLock: {
                _recursiveLockInternal = [[NSRecursiveLock alloc] init];
            } break;
            /// 处理 JobsLockerTypePThreadMutex 分支
            case JobsLockerTypePThreadMutex: {
                int result = pthread_mutex_init(&_pthreadMutex, NULL);
                NSAssert(result == 0, @"pthread_mutex_init failed: %d", result);
            } break;
            /// 处理 JobsLockerTypeUnfairLock 分支
            case JobsLockerTypeUnfairLock: {
                _unfairLock = OS_UNFAIR_LOCK_INIT;
            } break;
            /// 处理 JobsLockerTypeSemaphore 分支
            case JobsLockerTypeSemaphore: {
                _semaphore = dispatch_semaphore_create(1);
            } break;
        }
    };return self;
}

- (void)dealloc {
    if (_type == JobsLockerTypePThreadMutex) {
        pthread_mutex_destroy(&_pthreadMutex);
    }
}

#pragma mark —— Factory

+ (instancetype)lock {
    return [[self alloc] initWithType:JobsLockerTypeNSLock];
}

+ (instancetype)recursiveLock {
    return [[self alloc] initWithType:JobsLockerTypeRecursiveLock];
}

+ (JobsRetIDByVoidBlock _Nonnull)pthreadLock {
    return ^id{
        return [[self alloc] initWithType:JobsLockerTypePThreadMutex];
    };
}

+ (JobsRetIDByVoidBlock _Nonnull)unfairLock {
    return ^id{
        return [[self alloc] initWithType:JobsLockerTypeUnfairLock];
    };
}

+ (JobsRetIDByVoidBlock _Nonnull)semaphoreLock {
    return ^id{
        return [[self alloc] initWithType:JobsLockerTypeSemaphore];
    };
}

#pragma mark —— Public

-(jobsBydispatch_block_tBlock _Nonnull)withLock{
    @jobs_weakify(self)
    return ^(NS_NOESCAPE dispatch_block_t block){
        @jobs_strongify(self)
        if (!self) return;
        if (!block) return;
        [self lock];
        @try {
            block();
        } @finally {
            [self unlock]();
        }
    };
}

- (JobsRetBOOLByVoidBlock _Nonnull)tryLock {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        switch (self.type) {
            /// 处理 JobsLockerTypeNSLock 分支
            case JobsLockerTypeNSLock:
                return [self.normalLock tryLock];
            /// 处理 JobsLockerTypeRecursiveLock 分支
            case JobsLockerTypeRecursiveLock:
                return [self.recursiveLockInternal tryLock];
            /// 处理 JobsLockerTypePThreadMutex 分支
            case JobsLockerTypePThreadMutex:
                return pthread_mutex_trylock(&_pthreadMutex) == 0;
            /// 处理 JobsLockerTypeUnfairLock 分支
            case JobsLockerTypeUnfairLock:
                return os_unfair_lock_trylock(&_unfairLock);
            /// 处理 JobsLockerTypeSemaphore 分支
            case JobsLockerTypeSemaphore:
                return dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_NOW) == 0;
        }
    };
}

- (void)lock {
    switch (self.type) {
        /// 处理 JobsLockerTypeNSLock 分支
        case JobsLockerTypeNSLock:
            [self.normalLock lock];
            break;
        /// 处理 JobsLockerTypeRecursiveLock 分支
        case JobsLockerTypeRecursiveLock:
            [self.recursiveLockInternal lock];
            break;
        /// 处理 JobsLockerTypePThreadMutex 分支
        case JobsLockerTypePThreadMutex:
            pthread_mutex_lock(&_pthreadMutex);
            break;
        /// 处理 JobsLockerTypeUnfairLock 分支
        case JobsLockerTypeUnfairLock:
            os_unfair_lock_lock(&_unfairLock);
            break;
        /// 处理 JobsLockerTypeSemaphore 分支
        case JobsLockerTypeSemaphore:
            dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
            break;
    }
}

- (jobsByVoidBlock _Nonnull)unlock {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        switch (self.type) {
            /// 处理 JobsLockerTypeNSLock 分支
            case JobsLockerTypeNSLock:
                [self.normalLock unlock];
                break;
            /// 处理 JobsLockerTypeRecursiveLock 分支
            case JobsLockerTypeRecursiveLock:
                [self.recursiveLockInternal unlock];
                break;
            /// 处理 JobsLockerTypePThreadMutex 分支
            case JobsLockerTypePThreadMutex:
                pthread_mutex_unlock(&_pthreadMutex);
                break;
            /// 处理 JobsLockerTypeUnfairLock 分支
            case JobsLockerTypeUnfairLock:
                os_unfair_lock_unlock(&_unfairLock);
                break;
            /// 处理 JobsLockerTypeSemaphore 分支
            case JobsLockerTypeSemaphore:
                dispatch_semaphore_signal(_semaphore);
                break;
        }
    };
}

@end
