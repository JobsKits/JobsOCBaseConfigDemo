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

@end

@implementation JobsOCPatchRecord

@end

@interface JobsOCPatchMgr ()

Prop_strong()NSMutableDictionary<NSString *, JobsOCPatchRecord *> *records;

@end

@implementation JobsOCPatchMgr

+(instancetype)shared{
    static JobsOCPatchMgr *mgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = JobsOCPatchMgr.new;
    });return mgr;
}

-(BOOL)installPayloadPatch:(JobsOCPatchModel *)patch{
    if (![patch isKindOfClass:JobsOCPatchModel.class]) return NO;
    if (!patch.identifier.length || !patch.targetCls || !patch.selector) return NO;
    [self rollbackPatchByIdentifier:patch.identifier];
    Method method = class_getInstanceMethod(patch.targetCls, patch.selector);
    if (!method) return NO;
    NSDictionary *payload = [patch.payload copy] ? : @{};
    IMP originalIMP = method_getImplementation(method);
    id block = ^NSDictionary *(__unused id target) {
        return payload;
    };
    IMP patchIMP = imp_implementationWithBlock(block);
    method_setImplementation(method, patchIMP);
    JobsOCPatchRecord *record = JobsOCPatchRecord.new;
    record.identifier = patch.identifier;
    record.targetCls = patch.targetCls;
    record.selector = patch.selector;
    record.originalIMP = originalIMP;
    record.patchIMP = patchIMP;
    self.records[patch.identifier] = record;
    return YES;
}

-(BOOL)rollbackPatchByIdentifier:(NSString *)identifier{
    if (!identifier.length) return NO;
    JobsOCPatchRecord *record = self.records[identifier];
    if (!record) return NO;
    Method method = class_getInstanceMethod(record.targetCls, record.selector);
    if (method && record.originalIMP) method_setImplementation(method, record.originalIMP);
    if (record.patchIMP) imp_removeBlock(record.patchIMP);
    [self.records removeObjectForKey:identifier];
    return YES;
}

-(void)rollbackAllPatches{
    NSArray<NSString *> *identifiers = self.records.allKeys.copy;
    for (NSString *identifier in identifiers) {
        [self rollbackPatchByIdentifier:identifier];
    }
}

-(BOOL)containsPatchByIdentifier:(NSString *)identifier{
    if (!identifier.length) return NO;
    return self.records[identifier] != nil;
}

-(NSMutableDictionary<NSString *,JobsOCPatchRecord *> *)records{
    if (!_records) {
        _records = NSMutableDictionary.dictionary;
    };return _records;
}

@end
