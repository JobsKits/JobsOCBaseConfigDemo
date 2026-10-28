//
//  MJRefreshConfigModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "MJRefreshConfigModel+DSL.h"

@implementation MJRefreshConfigModel (DSL)

-(JobsRetMJRefreshConfigModelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByCorBlock _Nonnull)byTextColor{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byStateIdleDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.stateIdleDuration = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byPullingDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.pullingDuration = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byRefreshingDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.refreshingDuration = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byWillRefreshDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.willRefreshDuration = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byNoMoreDataDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.noMoreDataDuration = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byStateIdleTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.stateIdleTitle = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byPullingTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.pullingTitle = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byRefreshingTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.refreshingTitle = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byWillRefreshTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.willRefreshTitle = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byNoMoreDataTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.noMoreDataTitle = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byStateIdlePicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSMutableArray <UIImage *> * _Nullable data) {
        @jobs_strongify(self)
        self.stateIdlePicsMutArr = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byPullingPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSMutableArray <UIImage *> * _Nullable data) {
        @jobs_strongify(self)
        self.pullingPicsMutArr = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byRefreshingPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSMutableArray <UIImage *> * _Nullable data) {
        @jobs_strongify(self)
        self.refreshingPicsMutArr = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byWillRefreshPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSMutableArray <UIImage *> * _Nullable data) {
        @jobs_strongify(self)
        self.willRefreshPicsMutArr = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byNoMoreDataPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSMutableArray <UIImage *> * _Nullable data) {
        @jobs_strongify(self)
        self.noMoreDataPicsMutArr = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byJsonLottiefilePaths{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.jsonLottiefilePaths = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByJobsRetIDByIDBlockBlock _Nonnull)byLoadBlock{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.loadBlock = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByBOOLBlock _Nonnull)byAutomaticallyChangeAlpha{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.automaticallyChangeAlpha = data;
        return self;
    };
}

-(JobsRetMJRefreshConfigModelByBOOLBlock _Nonnull)byIsShake{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShake = data;
        return self;
    };
}

@end
