//
//  MJRefreshConfigModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "MJRefreshConfigModel+DSL.h"

@implementation MJRefreshConfigModel (DSL)

#pragma mark —— 来自 MJRefreshConfigModel
-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(UIFont * data))byFont{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(UIColor * data))byTextColor{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.textColor = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byStateIdleDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.stateIdleDuration = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byPullingDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.pullingDuration = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byRefreshingDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.refreshingDuration = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byWillRefreshDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.willRefreshDuration = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(CGFloat data))byNoMoreDataDuration{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.noMoreDataDuration = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byStateIdleTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.stateIdleTitle = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byPullingTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.pullingTitle = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byRefreshingTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.refreshingTitle = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byWillRefreshTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.willRefreshTitle = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byNoMoreDataTitle{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.noMoreDataTitle = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byStateIdlePicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSMutableArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.stateIdlePicsMutArr = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byPullingPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSMutableArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.pullingPicsMutArr = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byRefreshingPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSMutableArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.refreshingPicsMutArr = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byWillRefreshPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSMutableArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.willRefreshPicsMutArr = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSMutableArray <UIImage *> * data))byNoMoreDataPicsMutArr{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSMutableArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.noMoreDataPicsMutArr = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(NSString * data))byJsonLottiefilePaths{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.jsonLottiefilePaths = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byLoadBlock{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.loadBlock = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(BOOL data))byAutomaticallyChangeAlpha{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.automaticallyChangeAlpha = data;
        return self;
    };
}

-(__kindof MJRefreshConfigModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShake{
    @jobs_weakify(self)
    return ^__kindof MJRefreshConfigModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isShake = data;
        return self;
    };
}

@end
