//
//  JobsParagraphStyleModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsParagraphStyleModel+DSL.h"

@implementation JobsParagraphStyleModel (DSL)

#pragma mark —— 来自 JobsParagraphStyleModel
-(__kindof JobsParagraphStyleModel *_Nonnull (^ _Nonnull)(id data))byValue{
    @jobs_weakify(self)
    return ^__kindof JobsParagraphStyleModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.value = data;
        return self;
    };
}

-(__kindof JobsParagraphStyleModel *_Nonnull (^ _Nonnull)(NSRange data))byRange{
    @jobs_weakify(self)
    return ^__kindof JobsParagraphStyleModel *_Nonnull(NSRange data) {
        @jobs_strongify(self)
        self.range = data;
        return self;
    };
}

@end
