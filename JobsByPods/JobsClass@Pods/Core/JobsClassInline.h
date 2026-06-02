//
//  JobsClassInline.h
//  JobsClass
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCLASSINLINE_F0BE9DD3E1
#define JOBS_HEADER_GUARD_JOBSCLASSINLINE_F0BE9DD3E1

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

#pragma mark —— 打印某个类：可以精确的打印具体的类，包括父类
/// 返回并打印成员变量列表及其值
NS_INLINE NSMutableArray<NSString *> *printIvarListByClass(Class cls) {
    unsigned int count;
    NSMutableArray<NSString *> *tempDataMutArr = NSMutableArray.array;
    Ivar *ivarList = class_copyIvarList(cls, &count);
    /// 创建一个默认对象的实例
    id instance = [[cls alloc] init];
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        id value = object_getIvar(instance, myIvar); // 获取对应的值
        // 打印成员变量名和对应的值
        JobsLog(@"ivar(%d) : %@ = %@", i, [NSString stringWithUTF8String:ivarName], value);
        [tempDataMutArr addObject:[NSString stringWithFormat:@"%s: %@", ivarName, value]];
    }free(ivarList);
    return tempDataMutArr;
}
/// 返回并打印属性列表及其值
NS_INLINE NSMutableArray<NSString *> *printPropertyListByClass(Class cls) {
    unsigned int count;
    NSMutableArray<NSString *> *tempDataMutArr = NSMutableArray.array;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    /// 创建一个默认对象的实例
    id instance = [[cls alloc] init];
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSString *key = [NSString stringWithUTF8String:propertyName];
        Ivar ivar = class_getInstanceVariable(cls, propertyName);
        if (ivar) {
            /// 这里本来可以使用 valueForKey
            /// 但是如果没有实现协议里面定义的属性的getter方法（@dynamic），会崩溃
            id value = object_getIvar(instance, ivar);
            JobsLog(@"property(%d) : %@ = %@", i, key, value ?: @"(nil)");
            [tempDataMutArr addObject:[NSString stringWithFormat:@"%s: %@", propertyName, value ?: @"(nil)"]];
        } else {
            JobsLog(@"property(%d) : %@ does not exist", i, key);
            [tempDataMutArr addObject:[NSString stringWithFormat:@"%s: (not found)", propertyName]];
        }
    }free(propertyList);
    return tempDataMutArr;
}
/// 返回并打印方法列表
NS_INLINE NSMutableArray<NSString *> *printMethodListByClass(Class cls) {
    unsigned int count;
    NSMutableArray<NSString *> *tempDataMutArr = NSMutableArray.array;
    Method *methodList = class_copyMethodList([cls class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        JobsLog(@"method(%d) : %@", i, NSStringFromSelector(method_getName(method)));
        [tempDataMutArr addObject:NSStringFromSelector(method_getName(method))];
    }free(methodList);
    return tempDataMutArr;
}
/// 返回并打印协议列表
NS_INLINE NSMutableArray<NSString *> *printProtocolListByClass(Class cls) {
    unsigned int count;
    NSMutableArray<NSString *> *tempDataMutArr = NSMutableArray.array;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([cls class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        JobsLog(@"protocol(%d) : %@", i, [NSString stringWithUTF8String:protocolName]);
        [tempDataMutArr addObject:[NSString stringWithUTF8String:protocolName]];
    }free(protocolList);
    return tempDataMutArr;
}
#pragma mark —— 打印某个实例:如果打印其父类，最终还是实际类
/// 返回并打印成员变量列表
NS_INLINE NSMutableArray<NSString *> *printIvarListByObj(id instanceObj) {
    return printIvarListByClass([instanceObj class]);
}
/// 返回并打印属性列表
NS_INLINE NSMutableArray<NSString *> *printPropertyListByObj(id instanceObj) {
    return printPropertyListByClass([instanceObj class]);
}
/// 返回并打印方法列表
NS_INLINE NSMutableArray<NSString *> *printMethodListByObj(id instanceObj) {
    return printMethodListByClass([instanceObj class]);
}
/// 返回并打印协议列表
NS_INLINE NSMutableArray<NSString *> *printProtocolListByObj(id instanceObj) {
    return printProtocolListByClass([instanceObj class]);
}
#pragma mark —— 其他
/// 判断一个父类是否包含某个方法（包含私有方法）
NS_INLINE BOOL jobsClassisContainsSuperMethod(Class cls, NSString *methodName) {
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList(cls, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        SEL methodNameSEL = method_getName(method);
        if ([methodName isEqualToString:NSStringFromSelector(methodNameSEL)]) {
            free(methods);
            return YES;
        }
    }free(methods);
    return NO;
}

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCLASSINLINE_F0BE9DD3E1 */
