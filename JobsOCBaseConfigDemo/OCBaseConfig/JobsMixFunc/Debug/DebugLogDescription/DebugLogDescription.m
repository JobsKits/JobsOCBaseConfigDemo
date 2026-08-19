//
//  DebugLogDescription.m
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DebugLogDescription.h"

#ifdef DEBUG
/// 同一个类的方法交换
void JobsDebugMethodSwizzle(Class _Nonnull c,
                            SEL _Nonnull _orig,
                            SEL _Nonnull _new) {
    Method origMethod = class_getInstanceMethod(c, _orig);
    Method newMethod = class_getInstanceMethod(c, _new);
    if (!origMethod || !newMethod) return;
    if (class_addMethod(c,
                        _orig,
                        method_getImplementation(newMethod),
                        method_getTypeEncoding(newMethod))) {
        class_replaceMethod(c,
                            _new,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

#pragma mark —— 打印model的内部属性内容
@implementation NSObject (DebugDescription)
+(jobsByVoidBlock _Nonnull)redirectNSlogToDocumentFolder{
    return ^{
        //如果已经连接Xcode调试则不输出到文件
        if(isatty(STDOUT_FILENO)) return;
        NSString *logFilePath = [self.documentsDir() stringByAppendingPathComponent:JobsFormattedString(@"%@.log",[jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
            data.byDateFormat(@"yyyy-MM-dd HH:mm:ss");
        }) stringFromDate:NSDate.date])];
        // 先删除已经存在的文件
        [NSFileManager.defaultManager removeItemAtPath:logFilePath error:nil];
        // 将log输入到文件
        freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
        freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    };
}
/// debugDescription方法只会在调试po的时候调用，而在代码中打印不会调用
//- (NSString *)debugDescription {
//    //判断是否时NSArray 或者NSDictionary NSNumber 如果是的话直接返回 debugDescription
//    if ([self isKindOfClass:NSArray.class] ||
//        [self isKindOfClass:NSDictionary.class] ||
//        [self isKindOfClass:NSString.class] ||
//        [self isKindOfClass:NSNumber.class]) {
//        return [self debugDescription];
//    }
//    //声明一个字典
//    NSMutableDictionary *dictionary = NSMutableDictionary.dictionary;
//    //得到当前class的所有属性
//    uint count;
//    objc_property_t *properties = class_copyPropertyList(self.class, &count);
//    //循环并用KVC得到每个属性的值
//    for (int i = 0; i<count; i++) {
//        objc_property_t property = properties[i];
//        NSString *name = @(property_getName(property));
//        id value = @"nil";
//        @try {
//            value = self.valueForKey(name) ?: @"nil"; //默认值为nil字符串
//        }
//        @catch (NSException *exception) {
//            JobsLog(@"Exception: %@", exception);
//            value = @"nil"; // or handle the exception as needed
//        }
//        [dictionary setObject:value forKey:name];//装载到字典里
//    }
//    //释放
//    free(properties);
//    //return
//    return [NSString stringWithFormat:@"<%@: %p> -- %@",self.class,self,dictionary];
//}
/// 将obj转换成json字符串。如果失败则返回nil.
-(JobsRetStrByVoidBlock _Nonnull)convertToJsonString {
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        //先判断是否能转化为JSON格式
        if (![NSJSONSerialization isValidJSONObject:self]) return nil;
        NSError *error = nil;
        NSJSONWritingOptions jsonOptions = NSJSONWritingPrettyPrinted;
        if (@available(iOS 11.0, *)) {
            //11.0之后，可以将JSON按照key排列后输出，看起来会更舒服
            jsonOptions = NSJSONWritingPrettyPrinted | NSJSONWritingSortedKeys;
        }
        //核心代码，字典转化为有格式输出的JSON字符串
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if(error) {
            JobsLog(@"error = %@",error.description);
            if (!jsonData) return nil;
            return nil;
        }NSString *jsonString = jsonData.jobsStringByUTF8Encoding();
        return jsonString;
    };
}

@end
#pragma mark —— 打印NSDictionary相关子类的内容
@implementation NSDictionary (DebugDescription)
//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)printlog_descriptionWithLocale:(id)locale{
    JobsRetStrByIDBlock action = ((JobsRetStrByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSDictionary.class, @selector(jobsPrintlog_descriptionWithLocale)))(self, @selector(jobsPrintlog_descriptionWithLocale));
    return action ? action(locale) : nil;
}

-(JobsRetStrByIDBlock _Nonnull)jobsPrintlog_descriptionWithLocale{
    @jobs_weakify(self)
    return ^NSString *(id locale){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.convertToJsonString() ? : [self printlog_descriptionWithLocale:locale];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
    };
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return self.convertToJsonString() ? : [self printlog_descriptionWithLocale:locale indent:level];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)printlog_debugDescription{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSDictionary.class, @selector(jobsPrintlog_debugDescription)))(self, @selector(jobsPrintlog_debugDescription));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsPrintlog_debugDescription{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.convertToJsonString() ? : self.printlog_debugDescription;/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
    };
}
//在load方法中完成方法交换
+ (void)load {
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JobsDebugMethodSwizzle(self.class,
                               @selector(descriptionWithLocale:),
                               @selector(printlog_descriptionWithLocale:));
        JobsDebugMethodSwizzle(self.class,
                               @selector(descriptionWithLocale:indent:),
                               @selector(printlog_descriptionWithLocale:indent:));
        JobsDebugMethodSwizzle(self.class,
                               @selector(debugDescription),
                               @selector(printlog_debugDescription));
    });
}

@end
#pragma mark —— 打印NSArray相关子类的内容
@implementation NSArray (DebugDescription)
//在load方法中完成方法交换
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JobsDebugMethodSwizzle(self.class,
                               @selector(descriptionWithLocale:),
                               @selector(printlog_descriptionWithLocale:));
        JobsDebugMethodSwizzle(self.class,
                               @selector(descriptionWithLocale:indent:),
                               @selector(printlog_descriptionWithLocale:indent:));
        JobsDebugMethodSwizzle(self.class,
                               @selector(debugDescription),
                               @selector(printlog_debugDescription));
    });
}
//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)printlog_descriptionWithLocale:(id)locale{
    JobsRetStrByIDBlock action = ((JobsRetStrByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSArray.class, @selector(jobsPrintlog_descriptionWithLocale)))(self, @selector(jobsPrintlog_descriptionWithLocale));
    return action ? action(locale) : nil;
}

-(JobsRetStrByIDBlock _Nonnull)jobsPrintlog_descriptionWithLocale{
    @jobs_weakify(self)
    return ^NSString *(id locale){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.convertToJsonString() ? : [self printlog_descriptionWithLocale:locale];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
    };
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return self.convertToJsonString() ? : [self printlog_descriptionWithLocale:locale indent:level];/// 转换成JSON格式字符串，如果无法转换，就使用原先的格式;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)printlog_debugDescription{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSArray.class, @selector(jobsPrintlog_debugDescription)))(self, @selector(jobsPrintlog_debugDescription));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsPrintlog_debugDescription{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.convertToJsonString() ? : self.printlog_debugDescription;
    };
}

@end

#endif
