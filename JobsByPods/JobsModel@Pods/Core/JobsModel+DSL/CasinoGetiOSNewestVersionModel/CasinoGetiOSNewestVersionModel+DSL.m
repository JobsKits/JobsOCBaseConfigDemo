//
//  CasinoGetiOSNewestVersionModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "CasinoGetiOSNewestVersionModel+DSL.h"

@implementation CasinoGetiOSNewestVersionModel (DSL)

#pragma mark —— 来自 CasinoGetiOSNewestVersionModel
-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.createBy = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.createTime = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byDownloadUrl{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.downloadUrl = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSNumber * data))byID{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(JobsUpdateType data))byIsForced{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(JobsUpdateType data) {
        @jobs_strongify(self)
        self.isForced = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byName{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byRemark{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.remark = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(JobsOperationType data))byTerminalType{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(JobsOperationType data) {
        @jobs_strongify(self)
        self.terminalType = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSNumber * data))byUpdateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.updateBy = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.updateTime = data;
        return self;
    };
}

-(__kindof CasinoGetiOSNewestVersionModel *_Nonnull (^ _Nonnull)(NSString * data))byVersionNumber{
    @jobs_weakify(self)
    return ^__kindof CasinoGetiOSNewestVersionModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.versionNumber = data;
        return self;
    };
}

@end
