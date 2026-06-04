//
//  CasinoGetiOSNewestVersionModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "CasinoGetiOSNewestVersionModel+DSL.h"

@implementation CasinoGetiOSNewestVersionModel (DSL)

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byCreateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.createBy = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byCreateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.createTime = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byDownloadUrl{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.downloadUrl = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByNumberBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByJobsUpdateTypeBlock _Nonnull)byIsForced{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(JobsUpdateType data) {
        @jobs_strongify(self)
        self.isForced = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byRemark{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.remark = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByJobsOperationTypeBlock _Nonnull)byTerminalType{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(JobsOperationType data) {
        @jobs_strongify(self)
        self.terminalType = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByNumberBlock _Nonnull)byUpdateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.updateBy = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byUpdateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.updateTime = data;
        return self;
    };
}

-(JobsRetCasinoGetiOSNewestVersionModelByStrBlock _Nonnull)byVersionNumber{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.versionNumber = data;
        return self;
    };
}
@end
