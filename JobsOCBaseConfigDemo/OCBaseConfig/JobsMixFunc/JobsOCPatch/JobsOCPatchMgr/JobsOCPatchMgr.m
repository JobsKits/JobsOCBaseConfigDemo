//
//  JobsOCPatchMgr.m
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCPatchMgr.h"

@interface JobsOCPatchRecord : NSObject

Prop_copy()NSString *identifier;
Prop_assign()Class targetCls;
Prop_assign()SEL selector;
Prop_assign()IMP originalIMP;
Prop_assign()IMP patchIMP;

-(JobsRetJobsOCPatchRecordByStrBlock _Nonnull)byIdentifier;
-(JobsRetJobsOCPatchRecordByIDBlock _Nonnull)byTargetCls;
-(JobsRetJobsOCPatchRecordBySELBlock _Nonnull)bySelector;
-(JobsRetJobsOCPatchRecordByIMPBlock _Nonnull)byOriginalIMP;
-(JobsRetJobsOCPatchRecordByIMPBlock _Nonnull)byPatchIMP;

@end

@implementation JobsOCPatchRecord

-(JobsRetJobsOCPatchRecordByStrBlock _Nonnull)byIdentifier{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchRecord *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.identifier = data;
        return self;
    };
}

-(JobsRetJobsOCPatchRecordByIDBlock _Nonnull)byTargetCls{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchRecord *_Nullable(Class _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.targetCls = data;
        return self;
    };
}

-(JobsRetJobsOCPatchRecordBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchRecord *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.selector = data;
        return self;
    };
}

-(JobsRetJobsOCPatchRecordByIMPBlock _Nonnull)byOriginalIMP{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchRecord *_Nullable(IMP _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.originalIMP = data;
        return self;
    };
}

-(JobsRetJobsOCPatchRecordByIMPBlock _Nonnull)byPatchIMP{
    @jobs_weakify(self)
    return ^__kindof JobsOCPatchRecord *_Nullable(IMP _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.patchIMP = data;
        return self;
    };
}

@end

@interface JobsOCPatchMgr ()

Prop_strong()NSMutableDictionary<NSString *, JobsOCPatchRecord *> *records;

@end

@implementation JobsOCPatchMgr
+(JobsRetJobsOCPatchMgrByVoidBlock _Nonnull)shared{
    return ^JobsOCPatchMgr *{
        static JobsOCPatchMgr *mgr = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            mgr = JobsOCPatchMgr.new;
        });return mgr;
    };
}

-(JobsRetBOOLByJobsOCPatchModelBlock _Nonnull)installPayloadPatch{
    @jobs_weakify(self)
    return ^BOOL(JobsOCPatchModel * patch){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (![patch isKindOfClass:JobsOCPatchModel.class]) return NO;
        if (!patch.identifier.length || !patch.targetCls || !patch.selector) return NO;
        self.rollbackPatchByIdentifier(patch.identifier);
        Method method = class_getInstanceMethod(patch.targetCls, patch.selector);
        if (!method) return NO;
        NSDictionary *payload = [patch.payload copy] ? : @{};
        IMP originalIMP = method_getImplementation(method);
        id block = ^NSDictionary *(__unused id target) {
            return payload;
        };
        IMP patchIMP = imp_implementationWithBlock(block);
        method_setImplementation(method, patchIMP);
        JobsOCPatchRecord *record = JobsOCPatchRecord.new
            .byIdentifier(patch.identifier)
            .byTargetCls(patch.targetCls)
            .bySelector(patch.selector)
            .byOriginalIMP(originalIMP)
            .byPatchIMP(patchIMP);
        self.records[patch.identifier] = record;
        return YES;
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)rollbackPatchByIdentifier{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (!identifier.length) return NO;
        JobsOCPatchRecord *record = self.records[identifier];
        if (!record) return NO;
        Method method = class_getInstanceMethod(record.targetCls, record.selector);
        if (method && record.originalIMP) method_setImplementation(method, record.originalIMP);
        if (record.patchIMP) imp_removeBlock(record.patchIMP);
        [self.records removeObjectForKey:identifier];
        return YES;
    };
}

-(jobsByVoidBlock _Nonnull)rollbackAllPatches{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray<NSString *> *identifiers = self.records.allKeys.copy;
        for (NSString *identifier in identifiers) {
            self.rollbackPatchByIdentifier(identifier);
        }
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)containsPatchByIdentifier{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (!identifier.length) return NO;
        return self.records[identifier] != nil;
    };
}

-(NSMutableDictionary<NSString *,JobsOCPatchRecord *> *)records{
    if (!_records) {
        _records = NSMutableDictionary.dictionary;
    };return _records;
}

@end
