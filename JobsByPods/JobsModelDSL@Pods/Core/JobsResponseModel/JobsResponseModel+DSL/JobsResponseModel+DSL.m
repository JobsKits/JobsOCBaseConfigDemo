//
//  JobsResponseModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsResponseModel+DSL.h"

@implementation JobsResponseModel (DSL)
-(JobsRetJobsResponseModelByHTTPResponseCodeBlock _Nonnull)byCode{
    @jobs_weakify(self)
    return ^__kindof JobsResponseModel *_Nullable(HTTPResponseCode data) {
        @jobs_strongify(self)
        self.code = data;
        return self;
    };
}

-(JobsRetJobsResponseModelByStrBlock _Nonnull)byMsg{
    @jobs_weakify(self)
    return ^__kindof JobsResponseModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.msg = data;
        return self;
    };
}

-(JobsRetJobsResponseModelByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof JobsResponseModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

@end
