//
//  PhilippinesModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "PhilippinesModel+DSL.h"

@implementation PhilippinesModel (DSL)

#pragma mark —— 来自 PhilippinesModel
-(__kindof PhilippinesModel *_Nonnull (^ _Nonnull)(NSInteger data))byState_id{
    @jobs_weakify(self)
    return ^__kindof PhilippinesModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.state_id = data;
        return self;
    };
}

-(__kindof PhilippinesModel *_Nonnull (^ _Nonnull)(NSString * data))byState_name{
    @jobs_weakify(self)
    return ^__kindof PhilippinesModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.state_name = data;
        return self;
    };
}

@end
