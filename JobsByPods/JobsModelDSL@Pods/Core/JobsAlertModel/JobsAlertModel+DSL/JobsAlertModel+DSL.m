//
//  JobsAlertModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsAlertModel+DSL.h"

@implementation JobsAlertModel (DSL)

-(JobsRetJobsAlertModelByStrBlock _Nonnull)byAlertControllerTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.alertControllerTitle = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByStrBlock _Nonnull)byMessage{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.message = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByUIAlertControllerStyleBlock _Nonnull)byPreferredStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(UIAlertControllerStyle data) {
        @jobs_strongify(self)
        self.preferredStyle = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByStrBlock _Nonnull)byAlertActionTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.alertActionTitle = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByUIAlertActionStyleBlock _Nonnull)byAlertActionStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(UIAlertActionStyle data) {
        @jobs_strongify(self)
        self.alertActionStyle = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByJobsByAlertActionBlockBlock _Nonnull)byAlertActionBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(jobsByAlertActionBlock _Nullable data) {
        @jobs_strongify(self)
        self.alertActionBlock = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByStrBlock _Nonnull)byCancelAlertActionTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.cancelAlertActionTitle = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByUIAlertActionStyleBlock _Nonnull)byCancelAlertActionStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(UIAlertActionStyle data) {
        @jobs_strongify(self)
        self.cancelAlertActionStyle = data;
        return self;
    };
}

-(JobsRetJobsAlertModelByJobsByAlertActionBlockBlock _Nonnull)byCancelAlertActionBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nullable(jobsByAlertActionBlock _Nullable data) {
        @jobs_strongify(self)
        self.cancelAlertActionBlock = data;
        return self;
    };
}

@end
