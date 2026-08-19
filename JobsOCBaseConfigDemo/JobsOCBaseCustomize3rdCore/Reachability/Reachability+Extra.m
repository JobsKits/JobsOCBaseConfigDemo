//
//  Reachability+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2024年11月25日，星期一.
//

#import "Reachability+Extra.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN Reachability
@interface Reachability (JobsPropertyDSLSetterAutogen_dc5eecbb15)
-(void)setReachableOnWWAN:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END Reachability

@implementation Reachability (Extra)

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN Reachability
-(JobsRetReachabilityByBOOLBlock _Nonnull)byReachableOnWWAN{
    @jobs_weakify(self)
    return ^__kindof Reachability * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setReachableOnWWAN:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END Reachability
@end
