//
//  NSObject+Extra.m
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//

#import "NSObject+Extra.h"

JobsKey(JobsOCDSLNSObjectWeakTargetKey)
@implementation NSObject (Extra)

@dynamic weak_target;

-(id)weak_target{
    id target = Jobs_getAssociatedObject(JobsOCDSLNSObjectWeakTargetKey);
    return target ?: self;
}

-(void)setWeak_target:(id)weak_target{
    Jobs_setAssociatedASSIGN(JobsOCDSLNSObjectWeakTargetKey, weak_target)
}

@end
