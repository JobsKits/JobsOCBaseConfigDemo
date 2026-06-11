//
//  NSObject+Extra.m
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//

#import "NSObject+Extra.h"

static const void *JobsOCDSLNSObjectWeakTargetKey = &JobsOCDSLNSObjectWeakTargetKey;

@implementation NSObject (Extra)

@dynamic weak_target;

-(id)weak_target{
    id target = objc_getAssociatedObject(self, JobsOCDSLNSObjectWeakTargetKey);
    return target ?: self;
}

-(void)setWeak_target:(id)weak_target{
    objc_setAssociatedObject(self,
                             JobsOCDSLNSObjectWeakTargetKey,
                             weak_target,
                             OBJC_ASSOCIATION_ASSIGN);
}

@end
