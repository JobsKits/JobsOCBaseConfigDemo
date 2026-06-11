//
//  JobsAlertModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsAlertModel+DSL.h"

@implementation JobsAlertModel (DSL)

#pragma mark —— 来自 JobsAlertModel
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byAlertControllerTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.alertControllerTitle = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byMessage{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.message = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(UIAlertControllerStyle data))byPreferredStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(UIAlertControllerStyle data) {
        @jobs_strongify(self)
        self.preferredStyle = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byAlertActionTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.alertActionTitle = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(UIAlertActionStyle data))byAlertActionStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(UIAlertActionStyle data) {
        @jobs_strongify(self)
        self.alertActionStyle = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(jobsByAlertActionBlock data))byAlertActionBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(jobsByAlertActionBlock data) {
        @jobs_strongify(self)
        self.alertActionBlock = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byCancelAlertActionTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.cancelAlertActionTitle = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(UIAlertActionStyle data))byCancelAlertActionStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(UIAlertActionStyle data) {
        @jobs_strongify(self)
        self.cancelAlertActionStyle = data;
        return self;
    };
}

-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(jobsByAlertActionBlock data))byCancelAlertActionBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAlertModel *_Nonnull(jobsByAlertActionBlock data) {
        @jobs_strongify(self)
        self.cancelAlertActionBlock = data;
        return self;
    };
}

@end
