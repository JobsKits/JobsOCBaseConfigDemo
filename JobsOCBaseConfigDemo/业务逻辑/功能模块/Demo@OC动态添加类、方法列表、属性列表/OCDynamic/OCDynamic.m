//
//  OCDynamic.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "OCDynamic.h"

@implementation OCDynamic
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        self.invokeIMP();
        self.InvokeIMP();
    };return self;
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    JobsRetBOOLBySELBlock action = ((JobsRetBOOLBySELBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(OCDynamic.class, @selector(jobsResolveInstanceMethod)))(self, @selector(jobsResolveInstanceMethod));
    return action ? action(sel) : NO;
}

+(JobsRetBOOLBySELBlock _Nonnull)jobsResolveInstanceMethod{
    return ^BOOL(SEL sel){
        if (sel == @selector(test)) {
            Method method = class_getInstanceMethod(self, @selector(instanceMethod));
            /**
             方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
             注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
             */
            class_addMethod(self,/// 第一个参数是在哪个类中添加方法
                            sel,/// 第二个参数是所添加方法的编号SEL
                            method_getImplementation(method),/// 第三个参数是所添加方法的函数实现的指针IMP
                            method_getTypeEncoding(method));/// 第四个参数是所添加方法的签名
            return YES;
        };return [super resolveInstanceMethod:sel];
    };
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    JobsRetBOOLBySELBlock action = ((JobsRetBOOLBySELBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(OCDynamic.class, @selector(jobsResolveClassMethod)))(self, @selector(jobsResolveClassMethod));
    return action ? action(sel) : NO;
}

+(JobsRetBOOLBySELBlock _Nonnull)jobsResolveClassMethod{
    return ^BOOL(SEL sel){
        if (sel == @selector(Test)) {
            Method method = class_getClassMethod(object_getClass(self.class), @selector(classMethod));
            /**
             方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
             注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
             */
            class_addMethod(object_getClass(self.class),/// 第一个参数是在哪个类中添加方法
                            sel,/// 第二个参数是所添加方法的编号SEL
                            method_getImplementation(method),/// 第三个参数是所添加方法的函数实现的指针IMP
                            method_getTypeEncoding(method));/// 第四个参数是所添加方法的签名
            return YES;
        };return [super resolveClassMethod:sel];
    };
}

-(void)instanceMethod{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(OCDynamic.class, @selector(jobsInstanceMethod)))(self, @selector(jobsInstanceMethod));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsInstanceMethod{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"");
    };
}

+(void)classMethod{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(OCDynamic.class, @selector(jobsClassMethod)))(self, @selector(jobsClassMethod));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsClassMethod{
    return ^{
        JobsLog(@"");
    };
}
#pragma mark —— IMP调用实例方法
-(jobsByVoidBlock _Nonnull)invokeIMP{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        SEL selector = NSSelectorFromString(@"test:");
    //    IMP imp = [self methodForSelector:selector];
        IMP imp = [OCDynamic instanceMethodForSelector:selector];
        id (*func)(id, SEL, id) = (void *)imp;
        func(self, selector,@"Jobs");
    };
}

-(void)test:(NSString *)testStr{
    jobsByStrBlock action = ((jobsByStrBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(OCDynamic.class, @selector(jobsTestByStr)))(self, @selector(jobsTestByStr));
    if (action) action(testStr);
}

-(jobsByStrBlock _Nonnull)jobsTestByStr{
    @jobs_weakify(self)
    return ^(NSString * testStr){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"%@",testStr);
    };
}
#pragma mark —— IMP调用类方法
-(jobsByVoidBlock _Nonnull)InvokeIMP{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        SEL selector = NSSelectorFromString(@"Test:");
        IMP imp = [OCDynamic methodForSelector:selector];
        id (*func)(Class, SEL, id) = (void *)imp;
        func(OCDynamic.class, selector,@"Jobs");
    };
}

+(void)Test:(NSString *)testStr{
    jobsByStrBlock action = ((jobsByStrBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(OCDynamic.class, @selector(jobsTestByStr)))(self, @selector(jobsTestByStr));
    if (action) action(testStr);
}

+(jobsByStrBlock _Nonnull)jobsTestByStr{
    return ^(NSString * testStr){
        JobsLog(@"%@",testStr);
    };
}

+(void)Test{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(OCDynamic.class, @selector(jobsTest)))(self, @selector(jobsTest));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsTest{
    return ^{
        JobsLog(@"");
    };
}

-(jobsByVoidBlock _Nonnull)jobsTest{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self test];
    };
}

@end
