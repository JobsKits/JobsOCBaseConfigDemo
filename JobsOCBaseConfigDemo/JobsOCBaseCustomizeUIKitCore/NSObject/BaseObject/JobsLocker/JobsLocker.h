//
//  JobsLocker.h
//  JobsLocker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <pthread.h> // 提供 POSIX 线程接口，用于底层多线程控制、线程同步和并发处理。
#import <Foundation/Foundation.h>
#import <os/lock.h> // 提供系统级高性能锁，如 os_unfair_lock，适合轻量级同步场景。
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

#ifndef JobsLockerTypeDefine
#define JobsLockerTypeDefine

typedef NS_ENUM(NSUInteger, JobsLockerType) {
    /// Foundation 普通互斥锁
    JobsLockerTypeNSLock = 0,
    /// 可重入递归锁
    JobsLockerTypeRecursiveLock,
    /// pthread 互斥锁
    JobsLockerTypePThreadMutex,
    /// Apple 推荐的轻量级低开销锁
    JobsLockerTypeUnfairLock,
    /// 基于信号量的互斥控制
    JobsLockerTypeSemaphore,
};

#endif /* JobsLockerType_h */

@interface JobsLocker : NSObject

Prop_assign(readonly)JobsLockerType type;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
/// 指定锁类型初始化
-(instancetype)initWithType:(JobsLockerType)type NS_DESIGNATED_INITIALIZER;
/// NSLock
+(instancetype)lock;
/// NSRecursiveLock
+(instancetype)recursiveLock;
/// pthread_mutex
+(instancetype)pthreadLock;
/// os_unfair_lock
+(instancetype)unfairLock;
/// dispatch_semaphore
+(instancetype)semaphoreLock;
/// 加锁执行，执行完成后自动解锁
-(void)withLock:(NS_NOESCAPE dispatch_block_t)block;
/// 尝试加锁，成功返回 YES，失败返回 NO
-(BOOL)tryLock;
/// 手动加锁
-(void)lock;
/// 手动解锁
-(void)unlock;

@end

NS_ASSUME_NONNULL_END
