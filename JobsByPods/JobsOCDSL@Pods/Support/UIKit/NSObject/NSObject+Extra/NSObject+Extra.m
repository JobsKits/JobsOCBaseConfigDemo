//
//  NSObject+Extra.m
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "NSObject+Extra.h"
#import <JobsOCRuntimeKits/JobsWeakAssociation.h>

@implementation NSObject (Extra)
@dynamic weak_target;

-(id)weak_target{
    return JobsGetAssociatedWeakObject(self, @selector(weak_target));
}

-(void)setWeak_target:(id)weak_target{
    JobsSetAssociatedWeakObject(self, @selector(weak_target), weak_target);
}

-(JobsRetIDByIDBlock _Nonnull)byWeak_target{
    @jobs_weakify(self)
    return ^id(id _Nullable target){
        @jobs_strongify(self)
        [self setWeak_target:target];
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byInternationalizationKEY{
    @jobs_weakify(self)
    return ^id(id _Nullable internationalizationKEY){
        @jobs_strongify(self)
        [(id<BaseProtocol>)self setInternationalizationKEY:internationalizationKEY];
        return self;
    };
}

@end
