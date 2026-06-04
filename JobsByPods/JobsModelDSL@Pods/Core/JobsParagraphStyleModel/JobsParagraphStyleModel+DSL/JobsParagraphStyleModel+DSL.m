//
//  JobsParagraphStyleModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsParagraphStyleModel+DSL.h"

@implementation JobsParagraphStyleModel (DSL)

-(JobsRetJobsParagraphStyleModelByIDBlock _Nonnull)byValue{
    @jobs_weakify(self)
    return ^__kindof JobsParagraphStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.value = data;
        return self;
    };
}

-(JobsRetJobsParagraphStyleModelByNSRangeBlock _Nonnull)byRange{
    @jobs_weakify(self)
    return ^__kindof JobsParagraphStyleModel *_Nullable(NSRange data) {
        @jobs_strongify(self)
        self.range = data;
        return self;
    };
}

@end
