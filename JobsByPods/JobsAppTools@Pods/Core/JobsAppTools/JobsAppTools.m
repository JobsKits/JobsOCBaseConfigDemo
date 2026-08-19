//
//  JobsAppTools.m
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppTools.h"
#import <JobsAppTools/NSObject+AppTools.h>

@interface JobsAppTools ()

Prop_strong()UIWindow *appDelegateWindow;
Prop_strong()UIWindow *sceneDelegateWindow;

@end

@implementation JobsAppTools
#pragma mark —— 初始化方法
static JobsAppTools *JobsAppToolsInstance = nil;
static dispatch_once_t JobsAppToolsOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsAppTools.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&JobsAppToolsOnceToken, ^{
            JobsAppToolsInstance = [super allocWithZone:NULL].init;
        });return JobsAppToolsInstance;
    };
}
/// 单例的销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsAppTools.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        JobsAppToolsOnceToken = 0;
        JobsAppToolsInstance = nil;
    };
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return (((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsAppTools.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager)))();
}
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
}
/// 根据 x 和 y 的绝对值判断主方向
-(JobsRetStrByCGPointBlock _Nonnull)directionByTranslation{
    return ^__kindof NSString *_Nullable(CGPoint translation){
        if (fabs(translation.x) > fabs(translation.y)) {
            return translation.x > 0 ? @"右滑" : @"左滑";// 水平方向
        } else {
            return translation.y > 0 ? @"下滑" : @"上滑";// 垂直方向
        }
    };
}

-(JobsRetNSIntegerByPointBlock _Nonnull)directionByPoint{
    return ^JobsDirectionType(CGPoint translation){
        if (fabs(translation.x) > fabs(translation.y)) {
            return translation.x > 0 ? JobsDirectionRight : JobsDirectionLeft;// 水平方向
        } else {
            return translation.y > 0 ? JobsDirectionDown : JobsDirectionUp;// 垂直方向
        }
    };
}

-(JobsRetJobsAppToolsByDeviceOrientationBlock _Nonnull)byJobsDeviceOrientation{
    @jobs_weakify(self)
    return ^__kindof JobsAppTools *_Nullable(DeviceOrientation data){
        @jobs_strongify(self)
        [self setJobsDeviceOrientation:data];
        return self;
    };
}

-(JobsRetJobsAppToolsByUIInterfaceOrientationBlock _Nonnull)byCurrentInterfaceOrientation{
    @jobs_weakify(self)
    return ^__kindof JobsAppTools *_Nullable(UIInterfaceOrientation data){
        @jobs_strongify(self)
        [self setCurrentInterfaceOrientation:data];
        return self;
    };
}

-(JobsRetJobsAppToolsByUIInterfaceOrientationMaskBlock _Nonnull)byCurrentInterfaceOrientationMask{
    @jobs_weakify(self)
    return ^__kindof JobsAppTools *_Nullable(UIInterfaceOrientationMask data){
        @jobs_strongify(self)
        [self setCurrentInterfaceOrientationMask:data];
        return self;
    };
}

@end
