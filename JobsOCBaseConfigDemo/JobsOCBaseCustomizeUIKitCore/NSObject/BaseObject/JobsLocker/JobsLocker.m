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
            case JobsLockerTypeNSLock: {
                _normalLock = [[NSLock alloc] init];
            } break;

            case JobsLockerTypeRecursiveLock: {
                _recursiveLockInternal = [[NSRecursiveLock alloc] init];
            } break;

            case JobsLockerTypePThreadMutex: {
                int result = pthread_mutex_init(&_pthreadMutex, NULL);
                NSAssert(result == 0, @"pthread_mutex_init failed: %d", result);
            } break;

            case JobsLockerTypeUnfairLock: {
                _unfairLock = OS_UNFAIR_LOCK_INIT;
            } break;

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

+ (instancetype)pthreadLock {
    return [[self alloc] initWithType:JobsLockerTypePThreadMutex];
}

+ (instancetype)unfairLock {
    return [[self alloc] initWithType:JobsLockerTypeUnfairLock];
}

+ (instancetype)semaphoreLock {
    return [[self alloc] initWithType:JobsLockerTypeSemaphore];
}

#pragma mark —— Public

- (void)withLock:(NS_NOESCAPE dispatch_block_t)block {
    if (!block) return;

    [self lock];
    @try {
        block();
    } @finally {
        [self unlock];
    }
}

- (BOOL)tryLock {
    switch (self.type) {
        case JobsLockerTypeNSLock:
            return [self.normalLock tryLock];

        case JobsLockerTypeRecursiveLock:
            return [self.recursiveLockInternal tryLock];

        case JobsLockerTypePThreadMutex:
            return pthread_mutex_trylock(&_pthreadMutex) == 0;

        case JobsLockerTypeUnfairLock:
            return os_unfair_lock_trylock(&_unfairLock);

        case JobsLockerTypeSemaphore:
            return dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_NOW) == 0;
    }
}

- (void)lock {
    switch (self.type) {
        case JobsLockerTypeNSLock:
            [self.normalLock lock];
            break;

        case JobsLockerTypeRecursiveLock:
            [self.recursiveLockInternal lock];
            break;

        case JobsLockerTypePThreadMutex:
            pthread_mutex_lock(&_pthreadMutex);
            break;

        case JobsLockerTypeUnfairLock:
            os_unfair_lock_lock(&_unfairLock);
            break;

        case JobsLockerTypeSemaphore:
            dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
            break;
    }
}

- (void)unlock {
    switch (self.type) {
        case JobsLockerTypeNSLock:
            [self.normalLock unlock];
            break;

        case JobsLockerTypeRecursiveLock:
            [self.recursiveLockInternal unlock];
            break;

        case JobsLockerTypePThreadMutex:
            pthread_mutex_unlock(&_pthreadMutex);
            break;

        case JobsLockerTypeUnfairLock:
            os_unfair_lock_unlock(&_unfairLock);
            break;

        case JobsLockerTypeSemaphore:
            dispatch_semaphore_signal(_semaphore);
            break;
    }
}

@end
