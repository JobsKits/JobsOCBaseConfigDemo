//
//  MyProxy.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MyProxy.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN MyProxy
@interface MyProxy (JobsPropertyDSLSetterAutogen_254acb136a)
-(void)setTargets:(NSMutableArray * _Nullable)data;
-(void)setWeakTargets:(NSMutableArray <WeakTarget *>* _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END MyProxy

@implementation MyProxy
+(JobsRetIDByVoidBlock _Nonnull)proxy {
    return ^id{
        MyProxy *proxy = MyProxy.alloc;
        proxy.byTargets(NSMutableArray.array);
        proxy.byWeakTargets(NSMutableArray.array);
        return proxy;
    };
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    JobsRetNSMethodSignatureBySELBlock action = ((JobsRetNSMethodSignatureBySELBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MyProxy.class, @selector(jobsMethodSignatureForSelector)))(self, @selector(jobsMethodSignatureForSelector));
    return action ? action(sel) : nil;
}

-(JobsRetNSMethodSignatureBySELBlock _Nonnull)jobsMethodSignatureForSelector{
    @jobs_weakify(self)
    return ^NSMethodSignature *(SEL sel){
        @jobs_strongify(self)
        if (!self) return nil;
        // 查找第一个能响应该方法的 target
        for (id target in self.targets) {
            if ([target respondsToSelector:sel]) {
                return [target methodSignatureForSelector:sel];
            }
        };return [NSObject instanceMethodSignatureForSelector:@selector(init)];
    };
}

-(void)forwardInvocation:(NSInvocation *)invocation {
    jobsByNSInvocationBlock action = ((jobsByNSInvocationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MyProxy.class, @selector(jobsForwardInvocation)))(self, @selector(jobsForwardInvocation));
    if (action) action(invocation);
}

-(jobsByNSInvocationBlock _Nonnull)jobsForwardInvocation{
    @jobs_weakify(self)
    return ^(NSInvocation * invocation){
        @jobs_strongify(self)
        if (!self) return;
            SEL sel = invocation.selector;
        #pragma mark —— AOP：调用前
            NSLog(@"⚠️ 将调用方法 %@", NSStringFromSelector(sel));
            /// 向所有目标对象分发调用
            for (id target in self.targets) {
                if ([target respondsToSelector:sel]) {
                    [invocation invokeWithTarget:target];
                }
            }
        #pragma mark —— 这样就避免了代理强引用导致的循环引用问题。
            for (WeakTarget *w in self.weakTargets) {
                id target = w.target;
                if (target && [target respondsToSelector:sel]) {
                    [invocation invokeWithTarget:target];
                }
            }
        #pragma mark —— 参数拦截与修改（AOP）
            if ([NSStringFromSelector(sel) isEqualToString:@"setName:"]) {
                NSString *__unsafe_unretained oldValue;
                [invocation getArgument:&oldValue atIndex:2];
                NSLog(@"🛑 原始参数：%@", oldValue);
                NSString *newVal = [oldValue stringByAppendingString:@" ✅已拦截"];
                [invocation setArgument:&newVal atIndex:2];
            }
            for (WeakTarget *w in self.targets.copy) {
                id target = w.target;
                if (target && [target respondsToSelector:sel]) {
                    [invocation invokeWithTarget:target];
                }
            }
        #pragma mark —— AOP：调用后
            NSLog(@"✅ 方法 %@ 执行完毕", NSStringFromSelector(sel));
    };
}

-(JobsRetMyProxyByIDBlock _Nonnull)addTargetBy{
    @jobs_weakify(self)
    return ^__kindof MyProxy *_Nullable(id _Nullable target){
        @jobs_strongify(self)
        self.targets.add(target);
        return self;
    };
}

-(JobsRetMyProxyByIDBlock _Nonnull)addWeakTargetBy{
    @jobs_weakify(self)
    return ^__kindof MyProxy *_Nullable(id _Nullable target){
        @jobs_strongify(self)
        self.weakTargets.add(WeakTarget.withTarget(target));
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN MyProxy
-(JobsRetMyProxyByNSMutableArrayBlock _Nonnull)byTargets{
    @jobs_weakify(self)
    return ^__kindof MyProxy * _Nullable(NSMutableArray * _Nullable data){
        @jobs_strongify(self)
        [self setTargets:data];
        return self;
    };
}

-(JobsRetMyProxyByNSMutableArrayWeakTargetBlock _Nonnull)byWeakTargets{
    @jobs_weakify(self)
    return ^__kindof MyProxy * _Nullable(NSMutableArray <WeakTarget *>* _Nullable data){
        @jobs_strongify(self)
        [self setWeakTargets:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END MyProxy
@end
