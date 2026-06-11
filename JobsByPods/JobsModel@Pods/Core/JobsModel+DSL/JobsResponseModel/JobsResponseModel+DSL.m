//
//  JobsResponseModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsResponseModel+DSL.h"

@implementation JobsResponseModel (DSL)

#pragma mark —— 来自 JobsResponseModel
-(__kindof JobsResponseModel *_Nonnull (^ _Nonnull)(HTTPResponseCode data))byCode{
    @jobs_weakify(self)
    return ^__kindof JobsResponseModel *_Nonnull(HTTPResponseCode data) {
        @jobs_strongify(self)
        self.code = data;
        return self;
    };
}

-(__kindof JobsResponseModel *_Nonnull (^ _Nonnull)(NSString * data))byMsg{
    @jobs_weakify(self)
    return ^__kindof JobsResponseModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.msg = data;
        return self;
    };
}

-(__kindof JobsResponseModel *_Nonnull (^ _Nonnull)(id data))byData{
    @jobs_weakify(self)
    return ^__kindof JobsResponseModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

@end
