//
//  IncomeSourceModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "IncomeSourceModel+DSL.h"

@implementation IncomeSourceModel (DSL)

-(JobsRetIncomeSourceModelByStrBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof IncomeSourceModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetIncomeSourceModelByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof IncomeSourceModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

@end
