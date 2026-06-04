//
//  PhilippinesModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "PhilippinesModel+DSL.h"

@implementation PhilippinesModel (DSL)

-(JobsRetPhilippinesModelByNSIntegerBlock _Nonnull)byState_id{
    @jobs_weakify(self)
    return ^__kindof PhilippinesModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.state_id = data;
        return self;
    };
}

-(JobsRetPhilippinesModelByStrBlock _Nonnull)byState_name{
    @jobs_weakify(self)
    return ^__kindof PhilippinesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.state_name = data;
        return self;
    };
}

-(JobsRetPhilippinesModelByStrBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof PhilippinesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetPhilippinesModelByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof PhilippinesModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}
@end
