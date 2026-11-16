//
//  DebugLogDescription.m
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DebugLogDescription.h"

#if DEBUG
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


static BOOL JobsDebugJSONIsSafe(id object, NSHashTable *ancestors, NSUInteger depth) {
    if (depth > 64) {
        return NO;
    }
    if ([object isKindOfClass:NSString.class] ||
        [object isKindOfClass:NSNumber.class] ||
        object == NSNull.null) {
        return YES;
    }
    BOOL dictionary = [object isKindOfClass:NSDictionary.class];
    if (!dictionary && ![object isKindOfClass:NSArray.class]) {
        return NO;
    }
    if ([ancestors containsObject:object]) {
        return NO;
    }
    [ancestors addObject:object];
    BOOL valid = YES;
    for (id keyOrValue in object) {
        id value = keyOrValue;
        if (dictionary) {
            if (![keyOrValue isKindOfClass:NSString.class]) {
                valid = NO;
                break;
            }
            value = [object objectForKey:keyOrValue];
        }
        if (!JobsDebugJSONIsSafe(value, ancestors, depth + 1)) {
            valid = NO;
            break;
        }
    }
    [ancestors removeObject:object];
    return valid;
}

@implementation NSObject (DebugDescription)

+(jobsByVoidBlock _Nonnull)redirectNSlogToDocumentFolder {
    return ^{
        if (isatty(STDOUT_FILENO)) {
            return;
        }
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSString *directory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
            if (!directory.length) {
                return;
            }
            NSDateFormatter *formatter = NSDateFormatter.new;
            formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
            formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
            NSString *name = [[formatter stringFromDate:NSDate.date] stringByAppendingPathExtension:@"log"];
            NSString *path = [directory stringByAppendingPathComponent:name];
            const char *filePath = path.fileSystemRepresentation;
            if (!filePath) {
                return;
            }
            int file = open(filePath, O_CREAT | O_WRONLY | O_APPEND, 0600);
            if (file < 0) {
                return;
            }
            fflush(stdout);
            fflush(stderr);
            if (dup2(file, STDOUT_FILENO) >= 0) {
                dup2(file, STDERR_FILENO);
            }
            close(file);
        });
    };
}

-(JobsRetStrByVoidBlock _Nonnull)convertToJsonString {
    @jobs_weakify(self)
    return ^NSString * _Nullable {
        @jobs_strongify(self)
        if (!self || (![self isKindOfClass:NSArray.class] && ![self isKindOfClass:NSDictionary.class])) {
            return nil;
        }
        @try {
            NSHashTable *ancestors = [NSHashTable hashTableWithOptions:NSPointerFunctionsObjectPointerPersonality];
            if (!JobsDebugJSONIsSafe(self, ancestors, 0) || ![NSJSONSerialization isValidJSONObject:self]) {
                return nil;
            }
            NSJSONWritingOptions options = NSJSONWritingPrettyPrinted;
            if (@available(iOS 11.0, *)) {
                options |= NSJSONWritingSortedKeys;
            }
            NSError *error = nil;
            NSData *data = [NSJSONSerialization dataWithJSONObject:self options:options error:&error];
            if (!data || error) {
                return nil;
            }
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        } @catch (NSException *exception) {
            return nil;
        }
    };
}

@end

@implementation NSDictionary (DebugDescription)

+(void)load {
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JobsDebugMethodSwizzle(NSDictionary.class, @selector(descriptionWithLocale:), @selector(printlog_descriptionWithLocale:));
        JobsDebugMethodSwizzle(NSDictionary.class, @selector(descriptionWithLocale:indent:), @selector(printlog_descriptionWithLocale:indent:));
        JobsDebugMethodSwizzle(NSDictionary.class, @selector(debugDescription), @selector(printlog_debugDescription));
    });
#endif
}

-(NSString *)printlog_descriptionWithLocale:(id)locale {
    NSString *json = self.convertToJsonString();
    if (json) {
        return json;
    }
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    return [self printlog_descriptionWithLocale:locale];
#else
    return [self descriptionWithLocale:locale];
#endif
}

-(NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *json = self.convertToJsonString();
    if (json) {
        return json;
    }
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    return [self printlog_descriptionWithLocale:locale indent:level];
#else
    return [self descriptionWithLocale:locale indent:level];
#endif
}

-(NSString *)printlog_debugDescription {
    NSString *json = self.convertToJsonString();
    if (json) {
        return json;
    }
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    return [self printlog_debugDescription];
#else
    return self.debugDescription;
#endif
}

-(JobsRetStrByIDBlock _Nonnull)jobsPrintlog_descriptionWithLocale {
    @jobs_weakify(self)
    return ^NSString * _Nullable(id locale) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        return [self printlog_descriptionWithLocale:locale];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)jobsPrintlog_debugDescription {
    @jobs_weakify(self)
    return ^NSString * _Nullable {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        return [self printlog_debugDescription];
    };
}

@end

@implementation NSArray (DebugDescription)

+(void)load {
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JobsDebugMethodSwizzle(NSArray.class, @selector(descriptionWithLocale:), @selector(printlog_descriptionWithLocale:));
        JobsDebugMethodSwizzle(NSArray.class, @selector(descriptionWithLocale:indent:), @selector(printlog_descriptionWithLocale:indent:));
        JobsDebugMethodSwizzle(NSArray.class, @selector(debugDescription), @selector(printlog_debugDescription));
    });
#endif
}

-(NSString *)printlog_descriptionWithLocale:(id)locale {
    NSString *json = self.convertToJsonString();
    if (json) {
        return json;
    }
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    return [self printlog_descriptionWithLocale:locale];
#else
    return [self descriptionWithLocale:locale];
#endif
}

-(NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *json = self.convertToJsonString();
    if (json) {
        return json;
    }
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    return [self printlog_descriptionWithLocale:locale indent:level];
#else
    return [self descriptionWithLocale:locale indent:level];
#endif
}

-(NSString *)printlog_debugDescription {
    NSString *json = self.convertToJsonString();
    if (json) {
        return json;
    }
#if JOBS_ENABLE_COLLECTION_LOG_SWIZZLE
    return [self printlog_debugDescription];
#else
    return self.debugDescription;
#endif
}

-(JobsRetStrByIDBlock _Nonnull)jobsPrintlog_descriptionWithLocale {
    @jobs_weakify(self)
    return ^NSString * _Nullable(id locale) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        return [self printlog_descriptionWithLocale:locale];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)jobsPrintlog_debugDescription {
    @jobs_weakify(self)
    return ^NSString * _Nullable {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        return [self printlog_debugDescription];
    };
}

@end

#endif
