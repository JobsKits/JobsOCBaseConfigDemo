//
//  JobsWeakAssociation.m
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsWeakAssociation.h"

void JobsSetAssociatedWeakObject(id object, const void *key, id value) {
    if (!object || !key) {
        return;
    }
    NSHashTable *holder = nil;
    if (value) {
        holder = [NSHashTable weakObjectsHashTable];
        [holder addObject:value];
    }
    objc_setAssociatedObject(object, key, holder, OBJC_ASSOCIATION_RETAIN);
}

id JobsGetAssociatedWeakObject(id object, const void *key) {
    if (!object || !key) {
        return nil;
    }
    NSHashTable *holder = objc_getAssociatedObject(object, key);
    return [holder isKindOfClass:NSHashTable.class] ? holder.anyObject : nil;
}
