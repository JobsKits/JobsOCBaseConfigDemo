//
//  IncomeSourceModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "IncomeSourceModel+DSL.h"

@implementation IncomeSourceModel (DSL)

#pragma mark —— 来自 IncomeSourceModel
-(__kindof IncomeSourceModel *_Nonnull (^ _Nonnull)(NSString * data))byID{
    @jobs_weakify(self)
    return ^__kindof IncomeSourceModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(__kindof IncomeSourceModel *_Nonnull (^ _Nonnull)(NSString * data))byName{
    @jobs_weakify(self)
    return ^__kindof IncomeSourceModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

@end
