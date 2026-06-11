//
//  PhilippinesIDTypeModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "PhilippinesIDTypeModel+DSL.h"

@implementation PhilippinesIDTypeModel (DSL)

#pragma mark —— 来自 PhilippinesIDTypeModel
-(__kindof PhilippinesIDTypeModel *_Nonnull (^ _Nonnull)(NSInteger data))byID{
    @jobs_weakify(self)
    return ^__kindof PhilippinesIDTypeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(__kindof PhilippinesIDTypeModel *_Nonnull (^ _Nonnull)(NSString * data))byName{
    @jobs_weakify(self)
    return ^__kindof PhilippinesIDTypeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

@end
