//
//  JobsDecorationModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsDecorationModel+DSL.h"

@implementation JobsDecorationModel (DSL)

#pragma mark —— 来自 JobsDecorationModel
-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(Class data))byCls{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nonnull(Class data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(NSString * data))bySubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(id data))byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsDecorationModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

@end
