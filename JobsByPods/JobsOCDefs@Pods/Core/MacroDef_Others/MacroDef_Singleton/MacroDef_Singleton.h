//
//  MacroDef_Singleton.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef SingletonMacro_h
#define SingletonMacro_h

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
/// 基于 dispatch_once 的单例宏
#define DEFINE_SHARED_INSTANCE_USING_DISPATCH_ONCE \
    + (instancetype)sharedManager { \
        static dispatch_once_t onceToken; \
        static id sharedManager = nil; \
        dispatch_once(&onceToken, ^{ \
            sharedManager = [[self alloc] init]; \
        }); \
        return sharedManager; \
    } \
    + (JobsRetIDByVoidBlock _Nonnull)jobsSharedManager { \
        return ^id{ \
            return [self sharedManager]; \
        }; \
    } \
    + (void)destroyInstance { \
        sharedManager = nil; \
        onceToken = 0; \
    } \
    + (instancetype)allocWithZone:(struct _NSZone *)zone { \
        return [self sharedManager]; \
    } \
    - (instancetype)copyWithZone:(NSZone *)zone { \
        return self; \
    } \
    - (instancetype)mutableCopyWithZone:(NSZone *)zone { \
        return self; \
    }

#define DECLARE_SHARED_INSTANCE \
    + (instancetype)sharedManager; \
    + (JobsRetIDByVoidBlock _Nonnull)jobsSharedManager; \
    + (void)destroyInstance;

#define IMPLEMENT_SHARED_INSTANCE_USING_DISPATCH_ONCE(CLASSNAME) \
    @implementation CLASSNAME \
    DEFINE_SHARED_INSTANCE_USING_DISPATCH_ONCE \
    @end
/// 基于 @synchronized 的单例宏
#define DEFINE_SHARED_INSTANCE_USING_SYNCHRONIZED \
    + (instancetype)sharedManager { \
        @synchronized (self) { \
            if (sharedManager == nil) { \
                sharedManager = [[self alloc] init]; \
            } \
        } \
        return sharedManager; \
    } \
    + (JobsRetIDByVoidBlock _Nonnull)jobsSharedManager { \
        return ^id{ \
            return [self sharedManager]; \
        }; \
    } \
    + (void)destroyInstance { \
        @synchronized (self) { \
            sharedManager = nil; \
        } \
    } \
    + (instancetype)allocWithZone:(struct _NSZone *)zone { \
        return [self sharedManager]; \
    } \
    - (instancetype)copyWithZone:(NSZone *)zone { \
        return self; \
    } \
    - (instancetype)mutableCopyWithZone:(NSZone *)zone { \
        return self; \
    }

#define IMPLEMENT_SHARED_INSTANCE_USING_SYNCHRONIZED(CLASSNAME) \
    static CLASSNAME *sharedManager = nil; \
    @implementation CLASSNAME \
    DEFINE_SHARED_INSTANCE_USING_SYNCHRONIZED \
    @end

#endif /* SingletonMacro_h */
