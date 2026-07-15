//
//  MyProxy.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MyProxy.h"

@implementation MyProxy
+(instancetype)proxy {
    MyProxy *proxy = MyProxy.alloc;
    proxy.targets = NSMutableArray.array;
    return proxy;
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    // 查找第一个能响应该方法的 target
    for (id target in self.targets) {
        if ([target respondsToSelector:sel]) {
            return [target methodSignatureForSelector:sel];
        }
    };return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

-(void)forwardInvocation:(NSInvocation *)invocation {
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
}

-(jobsByIDBlock _Nonnull)addTargetBy{
    @jobs_weakify(self)
    return ^(id _Nullable target){
        @jobs_strongify(self)
        self.targets.add(target);
    };
}

-(jobsByIDBlock _Nonnull)addWeakTargetBy{
    @jobs_weakify(self)
    return ^(id _Nullable target){
        @jobs_strongify(self)
        self.weakTargets.add([WeakTarget withTarget:target]);
    };
}

@end
