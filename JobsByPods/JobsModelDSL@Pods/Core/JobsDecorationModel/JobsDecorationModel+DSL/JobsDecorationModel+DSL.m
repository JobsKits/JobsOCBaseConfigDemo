//
//  JobsDecorationModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsDecorationModel+DSL.h"

@implementation JobsDecorationModel (DSL)

-(JobsRetJobsDecorationModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nullable(Class _Nullable data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(JobsRetJobsDecorationModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetJobsDecorationModelByStrBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(JobsRetJobsDecorationModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

@end
