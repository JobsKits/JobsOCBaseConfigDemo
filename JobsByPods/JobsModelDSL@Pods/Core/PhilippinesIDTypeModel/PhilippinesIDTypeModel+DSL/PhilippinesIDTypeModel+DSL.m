//
//  PhilippinesIDTypeModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "PhilippinesIDTypeModel+DSL.h"

@implementation PhilippinesIDTypeModel (DSL)

-(JobsRetPhilippinesIDTypeModelByNSIntegerBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof PhilippinesIDTypeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetPhilippinesIDTypeModelByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof PhilippinesIDTypeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}
@end
