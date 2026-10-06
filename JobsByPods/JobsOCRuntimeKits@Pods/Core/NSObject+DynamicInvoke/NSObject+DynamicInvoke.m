//
//  NSObject+DynamicInvoke.m
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+DynamicInvoke.h"

#import <JobsOCRuntimeKits/NSValue+Extra.h>
#import <JobsOCRuntimeKits/NSObject+Algorithm.h>
#import <JobsOCRuntimeKits/NSString+Extra.h>

static const char *JobsInvocationType(const char *type) {
    while (type && *type && strchr("rnNoORV", *type)) {
        type++;
    }
    return type ?: "";
}

static BOOL JobsInvocationFailure(NSError **error, NSString *message) {
    if (error) {
        *error = [NSError errorWithDomain:@"JobsDynamicInvoke" code:1 userInfo:@{NSLocalizedDescriptionKey: message}];
    }
    return NO;
}

static BOOL JobsInvocationSupported(const char *type) {
    type = JobsInvocationType(type);
    return *type && (strchr("v@#:cCsSiIlLqQfdB", *type) || *type == '{');
}

static BOOL JobsInvocationSetArgument(NSInvocation *invocation, NSUInteger index, id value, NSError **error) {
    const char *type = JobsInvocationType([invocation.methodSignature getArgumentTypeAtIndex:index]);
    if (*type == '@') {
        if (type[1] == '?') {
            return JobsInvocationFailure(error, @"Block arguments require a typed API");
        }
        __unsafe_unretained id object = value == NSNull.null ? nil : value;
        [invocation setArgument:&object atIndex:index];
        return YES;
    }
    if (*type == '#') {
        if (value != NSNull.null && !object_isClass(value)) {
            return JobsInvocationFailure(error, @"Expected Class argument");
        }
        Class cls = value == NSNull.null ? Nil : value;
        [invocation setArgument:&cls atIndex:index];
        return YES;
    }
    if (*type == ':') {
        if (![value isKindOfClass:NSString.class] || ![value length]) {
            return JobsInvocationFailure(error, @"Expected selector name");
        }
        SEL selector = NSSelectorFromString(value);
        [invocation setArgument:&selector atIndex:index];
        return YES;
    }
    if (*type == '{') {
        if (![value isKindOfClass:NSValue.class] || strcmp([value objCType], type)) {
            return JobsInvocationFailure(error, @"Expected NSValue with matching structure encoding");
        }
        NSUInteger size = 0;
        NSGetSizeAndAlignment(type, &size, NULL);
        NSMutableData *storage = [NSMutableData dataWithLength:size];
        [value getValue:storage.mutableBytes size:size];
        [invocation setArgument:storage.mutableBytes atIndex:index];
        return YES;
    }
    if (![value isKindOfClass:NSNumber.class]) {
        return JobsInvocationFailure(error, @"Expected NSNumber for scalar argument");
    }
    switch (*type) {
        /// 有符号 8 位整数
        case 'c': {
            char data = [value charValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 无符号 8 位整数
        case 'C': {
            unsigned char data = [value unsignedCharValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 有符号 short
        case 's': {
            short data = [value shortValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 无符号 short
        case 'S': {
            unsigned short data = [value unsignedShortValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 有符号 int
        case 'i': {
            int data = [value intValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 无符号 int
        case 'I': {
            unsigned int data = [value unsignedIntValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 有符号 long
        case 'l': {
            long data = [value longValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 无符号 long
        case 'L': {
            unsigned long data = [value unsignedLongValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 有符号 64 位整数
        case 'q': {
            long long data = [value longLongValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 无符号 64 位整数
        case 'Q': {
            unsigned long long data = [value unsignedLongLongValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 单精度浮点
        case 'f': {
            float data = [value floatValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 双精度浮点
        case 'd': {
            double data = [value doubleValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// C / Objective-C 布尔值
        case 'B': {
            BOOL data = [value boolValue];
            [invocation setArgument:&data atIndex:index];
            break;
        }
        /// 未支持的 ABI 不能按 id 猜测
        default: {
            return JobsInvocationFailure(error, @"Unsupported argument encoding");
        }
    }
    return YES;
}

static const char JobsInvocationOnceKey = 0;

@implementation NSObject (DynamicInvoke)
#pragma mark —— 参数 和 相关调用
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
/// @param targetObj 靶点，方法在哪里
/// @param methodName 不带参数的方法名
+(void)targetObj:(NSObject *_Nonnull)targetObj
callingMethodWithName:(NSString *_Nullable)methodName {
    [NSObject methodName:methodName targetObj:targetObj paramarrays:nil error:nil];
}

-(jobsByStrBlock _Nonnull)callingMethodWithName {
    @jobs_weakify(self)
    return ^(NSString * _Nullable name) {
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [NSObject methodName:name targetObj:self paramarrays:nil error:nil];
    };
}

/// 同一实例、同一 selector 成功执行一次；无效调用不消耗执行机会。
-(jobsByStrBlock _Nonnull)dispatchOnceInvokingWithMethodName {
    @jobs_weakify(self)
    return ^(NSString * _Nullable name) {
        @jobs_strongify(self)
        if (!self || ![name isKindOfClass:NSString.class] || !name.length) {
            return;
        }
        @synchronized (self) {
            NSMutableSet *completed = objc_getAssociatedObject(self, &JobsInvocationOnceKey);
            if (!completed) {
                completed = [NSMutableSet set];
                objc_setAssociatedObject(self, &JobsInvocationOnceKey, completed, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            if ([completed containsObject:name]) {
                return;
            }
            [completed addObject:name];
            NSError *error = nil;
            [NSObject methodName:name targetObj:self paramarrays:nil error:&error];
            if (error) {
                [completed removeObject:name];
            }
        }
    };
}
/// NSInvocation的使用，方法多参数传递
/// @param methodName 方法名
/// @param targetObj 靶点，方法在哪里
/// @param paramarrays 参数数组
+(id)methodName:(NSString *)methodName targetObj:(id)targetObj paramarrays:(NSArray *)arguments {
    return [self methodName:methodName targetObj:targetObj paramarrays:arguments error:nil];
}

+(id)methodName:(NSString *)name targetObj:(id)target paramarrays:(NSArray *)arguments error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    if (!target || ![name isKindOfClass:NSString.class] || !name.length) {
        JobsInvocationFailure(error, @"Missing target or selector");
        return nil;
    }
    for (NSString *family in @[@"alloc", @"new", @"copy", @"mutableCopy", @"init"]) {
        if ([name hasPrefix:family] && (name.length == family.length ||
            ![[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[name characterAtIndex:family.length]])) {
            JobsInvocationFailure(error, @"Ownership method families require a typed API");
            return nil;
        }
    }
    SEL selector = NSSelectorFromString(name);
    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
    NSArray *values = !arguments ? @[] : ([arguments isKindOfClass:NSArray.class] ? arguments : @[arguments]);
    if (!signature || signature.numberOfArguments != values.count + 2 || !JobsInvocationSupported(signature.methodReturnType)) {
        JobsInvocationFailure(error, @"Missing method, incorrect argument count, or unsupported return encoding");
        return nil;
    }
    @try {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:target];
        [invocation setSelector:selector];
        for (NSUInteger index = 0; index < values.count; index++) {
            if (!JobsInvocationSetArgument(invocation, index + 2, values[index], error)) {
                return nil;
            }
        }
        [invocation retainArguments];
        [invocation invoke];
        return [self getMethodReturnValueWithInv:invocation sig:signature];
    } @catch (NSException *exception) {
        JobsInvocationFailure(error, exception.reason ?: @"Invocation failed");
        return nil;
    }
}

/// 获取方法返回值
/// @param inv inv
/// @param sig 方法签名
+(id)getMethodReturnValueWithInv:(NSInvocation *)inv sig:(NSMethodSignature *)sig {
    const char *type = JobsInvocationType(sig.methodReturnType);
    if (!sig.methodReturnLength || *type == 'v' || !JobsInvocationSupported(type)) {
        return nil;
    }
    if (*type == '@' || *type == '#') {
        __unsafe_unretained id object = nil;
        [inv getReturnValue:&object];
        return object;
    }
    NSMutableData *storage = [NSMutableData dataWithLength:sig.methodReturnLength];
    void *buffer = storage.mutableBytes;
    [inv getReturnValue:buffer];
    switch (*type) {
        /// 有符号 8 位整数
        case 'c': {
            return @(*(char *)buffer);
        }
        /// 无符号 8 位整数
        case 'C': {
            return @(*(unsigned char *)buffer);
        }
        /// 有符号 short
        case 's': {
            return @(*(short *)buffer);
        }
        /// 无符号 short
        case 'S': {
            return @(*(unsigned short *)buffer);
        }
        /// 有符号 int
        case 'i': {
            return @(*(int *)buffer);
        }
        /// 无符号 int
        case 'I': {
            return @(*(unsigned int *)buffer);
        }
        /// 有符号 long
        case 'l': {
            return @(*(long *)buffer);
        }
        /// 无符号 long
        case 'L': {
            return @(*(unsigned long *)buffer);
        }
        /// 有符号 64 位整数
        case 'q': {
            return @(*(long long *)buffer);
        }
        /// 无符号 64 位整数
        case 'Q': {
            return @(*(unsigned long long *)buffer);
        }
        /// 单精度浮点
        case 'f': {
            return @(*(float *)buffer);
        }
        /// 双精度浮点
        case 'd': {
            return @(*(double *)buffer);
        }
        /// C / Objective-C 布尔值
        case 'B': {
            return @(*(BOOL *)buffer);
        }
        /// 结构体 / selector 保留其真实编码
        default: {
            return [NSValue valueWithBytes:buffer objCType:type];
        }
    }
}

/// 判断本程序是否存在某个类
+(JobsRetBOOLByStrBlock _Nonnull)judgementAppExistClassWithName{
    return ^BOOL(NSString *_Nullable data){
        return NSClassFromString(data);
    };
}
/// 判断某个实例对象是否存在某个【不带参数的方法】
+(BOOL)judgementObj:(NSObject *_Nonnull)obj
existMethodWithName:(NSString *_Nullable)methodName{
    if (!obj || isNull(methodName)) {
        return NO;
    }else{
        SEL sel = NSSelectorFromString(methodName);
        return [obj respondsToSelector:sel];
    }
}
/// 用block来代替selector
-(JobsRetSELByJobsRetIDByTwoIDBlockBlock _Nonnull)jobsSelectorBlock{
    @jobs_weakify(self)
    return ^SEL _Nullable(JobsRetIDByTwoIDBlock _Nullable selectorBlock){
        @jobs_strongify(self)
        if (!self) {
            return NULL;
        }
        return selectorBlocks(selectorBlock, nil, self);
    };
}
/// 替代系统 @selector(selector) ,用Block的方式调用代码，使得代码逻辑和形式上不割裂
/// 类方法或全局函数，用于添加选择器
/// - Parameters:
///   - block: 最终的执行体
///   - selectorName: 实际调用的方法名（可不填），用于对外输出和定位调用实际使用的方法
///   - target: 执行目标
SEL _Nullable selectorBlocks(JobsRetIDByTwoIDBlock _Nullable block,
                             NSString *_Nullable selectorName,// MethodName(self)
                             NSObject *_Nonnull target) {
    if (!block) {
        toastErr(@"方法不存在,请检查参数".jobsTr());
        return NULL;
    }
    if (!target) {
        toastErr(@"执行目标不存在,请检查参数".jobsTr());
        return NULL;
    }
    NSString *selName = @"selector"
        .add(@"_")
        .add(toStringByID(target.makeSnowflake()))
        .add(@"_")
        .add(selectorName);
    if (![selName hasSuffix:@":"]) selName = selName.add(@":");
    JobsLog(@"selName = %@", selName);
    SEL sel = NSSelectorFromString(selName);
    /// 检查缓存
    static NSMutableDictionary *methodCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        methodCache = NSMutableDictionary.dictionary;
    });
    NSString *cacheKey = NSStringFromClass(target.class)
        .add(@"_")
        .add(selName);
    /**
     方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
     注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
     第一个参数是在哪个类中添加方法
     第二个参数是所添加方法的编号SEL
     第三个参数是所添加方法的函数实现的指针IMP
     第四个参数是所添加方法的签名
     */
    @synchronized (methodCache) {
        NSValue *cachedSelValue = methodCache[cacheKey];
        if (cachedSelValue) {
            SEL cachedSel = cachedSelValue.pointerValue;
            if (class_getInstanceMethod(target.class, cachedSel)) {
                Jobs_setAssociatedCOPY_NONATOMICByTargetRawKey(target, cachedSel, block)
                return cachedSel;
            }
            [methodCache removeObjectForKey:cacheKey];
        }
        /// 检查目标类是否已有该方法
        if (class_getInstanceMethod(target.class, sel)) {
            Jobs_setAssociatedCOPY_NONATOMICByTargetRawKey(target, sel, block)
            methodCache[cacheKey] = NSValue.byPointer(sel);
            JobsLog(@"方法曾经已经被成功添加，再次添加会崩溃");
            return sel;
        }
        /// 动态添加方法
        if (class_addMethod(target.class, sel, (IMP)selectorImp, "v@:@")) {
            Jobs_setAssociatedCOPY_NONATOMICByTargetRawKey(target, sel, block)
            methodCache[cacheKey] = NSValue.byPointer(sel);
        } else if (class_getInstanceMethod(target.class, sel)) {
            Jobs_setAssociatedCOPY_NONATOMICByTargetRawKey(target, sel, block)
            methodCache[cacheKey] = NSValue.byPointer(sel);
        } else {
            [NSException raise:@"添加方法失败".jobsTr()
                        format:@"%@ selectorBlock error", target];
        }
    };return sel;
}
/// 内部调用无需暴露
static void selectorImp(id target, SEL _cmd, id arg) {
    JobsRetIDByTwoIDBlock block = Jobs_getAssociatedObjectByTargetRawKey(target, _cmd);
    if (block) block(target, arg);
}
/// 对 SEL和IMP的统一管理
#pragma mark —— Prop_strong()JobsSEL_IMP *selImp;
JobsKey(_selImp)
@dynamic selImp;
-(JobsSEL_IMP *)selImp{
    JobsSEL_IMP *SelImp = Jobs_getAssociatedObject(_selImp);
    if (!SelImp) {
        SelImp = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_selImp, SelImp)
    };return SelImp;
}

-(void)setSelImp:(JobsSEL_IMP *)selImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_selImp, selImp)
}
#pragma mark —— Prop_copy()NSMutableDictionary *methodCache;
JobsKey(_methodCache)
@dynamic methodCache;
-(NSMutableDictionary<NSString *,NSValue *> *)methodCache{
    NSMutableDictionary *MethodCache = Jobs_getAssociatedObject(_methodCache);
    if (!MethodCache) {
        MethodCache = NSMutableDictionary.dictionary;
        Jobs_setAssociatedCOPY_NONATOMIC(_methodCache, MethodCache)
    };return MethodCache;
}

-(void)setMethodCache:(NSMutableDictionary<NSString *,NSValue *> *)methodCache{
    Jobs_setAssociatedCOPY_NONATOMIC(_methodCache, methodCache)
}
/// 是否存在这样的属性，有则返回
-(JobsRetIDByStrBlock _Nonnull)property {
    @jobs_weakify(self)
    return ^id(NSString *name) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        return [NSObject methodName:name targetObj:self paramarrays:nil error:nil];
    };
}

/// 是否遵从这样的协议？
-(JobsRetBOOLByStrBlock _Nonnull)protocol{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self || ![data isKindOfClass:NSString.class] || !data.length) {
            return NO;
        }
        Protocol *protocol = NSProtocolFromString(data);
        return protocol && [self conformsToProtocol:protocol];
    };
}

@end

@implementation NSInvocation (JobsOCRuntimeKitsDSL)

-(JobsRetInvocationByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof NSInvocation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetInvocationBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof NSInvocation *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

@end
