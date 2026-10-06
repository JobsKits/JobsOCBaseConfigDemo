//
//  JobsOCPatchMgr.m
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCPatchMgr.h"

static NSMutableDictionary<NSString *, NSMutableDictionary *> *JobsPatchSlots;
static NSMutableDictionary<NSString *, NSString *> *JobsPatchIdentifiers;

static void JobsPatchPrepareRegistry(void) {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        JobsPatchSlots = [NSMutableDictionary dictionary];
        JobsPatchIdentifiers = [NSMutableDictionary dictionary];
    });
}

static NSString *JobsPatchKey(Class cls, SEL selector) {
    return [NSString stringWithFormat:@"%@|%@", NSStringFromClass(cls), NSStringFromSelector(selector)];
}

/// 进程生命周期内有效的 C IMP：回滚不释放 trampoline，正在分派的调用仍有安全落点。
static id JobsPayloadPatchDispatch(id target, SEL selector) {
    NSDictionary *payload = nil;
    IMP original = NULL;
    JobsPatchPrepareRegistry();
    @synchronized (JobsOCPatchMgr.class) {
        for (Class cls = object_getClass(target); cls; cls = class_getSuperclass(cls)) {
            NSDictionary *slot = JobsPatchSlots[JobsPatchKey(cls, selector)];
            if (!slot) {
                continue;
            }
            if ([slot[@"active"] boolValue]) {
                payload = slot[@"payload"];
            } else {
                original = (IMP)[slot[@"original"] pointerValue];
            }
            break;
        }
    }
    if (payload) {
        return payload;
    }
    if (original && original != (IMP)JobsPayloadPatchDispatch) {
        return ((id (*)(id, SEL))original)(target, selector);
    }
    return nil;
}

@implementation JobsOCPatchMgr

+(JobsRetJobsOCPatchMgrByVoidBlock _Nonnull)shared {
    return ^JobsOCPatchMgr * {
        static JobsOCPatchMgr *manager;
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            manager = JobsOCPatchMgr.new;
        });
        return manager;
    };
}

-(JobsRetBOOLByJobsOCPatchModelBlock _Nonnull)installPayloadPatch {
    @jobs_weakify(self)
    return ^BOOL(JobsOCPatchModel *patch) {
        @jobs_strongify(self)
        if (!self || ![patch isKindOfClass:JobsOCPatchModel.class] ||
            !patch.identifier.length || !patch.targetCls || !patch.selector ||
            (patch.payload && ![patch.payload isKindOfClass:NSDictionary.class])) {
            return NO;
        }
        NSString *name = NSStringFromSelector(patch.selector);
        for (NSString *family in @[@"alloc", @"new", @"copy", @"mutableCopy", @"init"]) {
            if ([name hasPrefix:family] && (name.length == family.length ||
                ![[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[name characterAtIndex:family.length]])) {
                return NO;
            }
        }
        Method method = class_getInstanceMethod(patch.targetCls, patch.selector);
        if (!method) {
            return NO;
        }
        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:method_getTypeEncoding(method)];
        if (signature.numberOfArguments != 2 || signature.methodReturnType[0] != '@' || signature.methodReturnType[1] == '?') {
            return NO;
        }
        JobsPatchPrepareRegistry();
        @synchronized (JobsOCPatchMgr.class) {
            NSString *key = JobsPatchKey(patch.targetCls, patch.selector);
            NSString *existingKey = JobsPatchIdentifiers[patch.identifier];
            NSMutableDictionary *slot = JobsPatchSlots[key];
            if (existingKey && ![existingKey isEqualToString:key]) {
                return NO;
            }
            if ([slot[@"active"] boolValue]) {
                if (![slot[@"identifier"] isEqualToString:patch.identifier] ||
                    method_getImplementation(method) != (IMP)JobsPayloadPatchDispatch) {
                    return NO;
                }
                slot[@"payload"] = [patch.payload copy] ?: @{};
                return YES;
            }
            IMP original = method_getImplementation(method);
            /// 继承了正在生效的同类补丁时不再叠层，避免恢复 trampoline 到自身。
            if (original == (IMP)JobsPayloadPatchDispatch) {
                return NO;
            }
            class_addMethod(patch.targetCls, patch.selector, original, method_getTypeEncoding(method));
            method = class_getInstanceMethod(patch.targetCls, patch.selector);
            slot = [@{@"identifier": [patch.identifier copy], @"class": patch.targetCls,
                      @"selector": NSStringFromSelector(patch.selector),
                      @"original": [NSValue valueWithPointer:(const void *)original],
                      @"payload": [patch.payload copy] ?: @{}, @"active": @YES} mutableCopy];
            JobsPatchSlots[key] = slot;
            JobsPatchIdentifiers[patch.identifier] = key;
            method_setImplementation(method, (IMP)JobsPayloadPatchDispatch);
            return YES;
        }
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)rollbackPatchByIdentifier {
    @jobs_weakify(self)
    return ^BOOL(NSString *identifier) {
        @jobs_strongify(self)
        if (!self || !identifier.length) {
            return NO;
        }
        JobsPatchPrepareRegistry();
        @synchronized (JobsOCPatchMgr.class) {
            NSString *key = JobsPatchIdentifiers[identifier];
            NSMutableDictionary *slot = key ? JobsPatchSlots[key] : nil;
            if (!slot) {
                return NO;
            }
            Method method = class_getInstanceMethod(slot[@"class"], NSSelectorFromString(slot[@"selector"]));
            if (!method || method_getImplementation(method) != (IMP)JobsPayloadPatchDispatch) {
                return NO;
            }
            IMP original = (IMP)[slot[@"original"] pointerValue];
            method_setImplementation(method, original);
            slot[@"active"] = @NO;
            [slot removeObjectForKey:@"payload"];
            [JobsPatchIdentifiers removeObjectForKey:identifier];
            return YES;
        }
    };
}

-(jobsByVoidBlock _Nonnull)rollbackAllPatches {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        JobsPatchPrepareRegistry();
        @synchronized (JobsOCPatchMgr.class) {
            for (NSString *identifier in [JobsPatchIdentifiers.allKeys copy]) {
                self.rollbackPatchByIdentifier(identifier);
            }
        }
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)containsPatchByIdentifier {
    @jobs_weakify(self)
    return ^BOOL(NSString *identifier) {
        @jobs_strongify(self)
        if (!self || !identifier.length) {
            return NO;
        }
        JobsPatchPrepareRegistry();
        @synchronized (JobsOCPatchMgr.class) {
            return JobsPatchIdentifiers[identifier] != nil;
        }
    };
}

@end
