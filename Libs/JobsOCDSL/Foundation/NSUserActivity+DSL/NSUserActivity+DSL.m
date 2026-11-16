//
//  NSUserActivity+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月7日，星期五.
//

#import "NSUserActivity+DSL.h"

@implementation NSUserActivity (JobsChain)

+(JobsRetNSUserActivityByNSStringBlock _Nonnull)initByActivityType{
    return ^__kindof NSUserActivity *_Nullable(NSString *_Nullable data){
        return [NSUserActivity.alloc initWithActivityType:data];
    };
}

-(JobsRetNSUserActivityByNSStringBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSDictionaryBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSDictionaryBlock _Nonnull)byAddUserInfoEntriesFromDictionary{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        if (data) [self addUserInfoEntriesFromDictionary:data];
        return self;
    };
}

-(JobsRetNSUserActivityByNSSetBlock _Nonnull)byRequiredUserInfoKeys{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSSet<NSString *> *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) self.requiredUserInfoKeys = data;
        return self;
    };
}

-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byNeedsSave{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.needsSave = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSURLBlock _Nonnull)byWebpageURL{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        self.webpageURL = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSURLBlock _Nonnull)byReferrerURL{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) self.referrerURL = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSDateBlock _Nonnull)byExpirationDate{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) self.expirationDate = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSSetBlock _Nonnull)byKeywords{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSSet<NSString *> *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) self.keywords = data ?: NSSet.set;
        return self;
    };
}

-(JobsRetNSUserActivityByBOOLBlock _Nonnull)bySupportsContinuationStreams{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.supportsContinuationStreams = data;
        return self;
    };
}

-(JobsRetNSUserActivityByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(id<NSUserActivityDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSStringBlock _Nonnull)byTargetContentIdentifier{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)) self.targetContentIdentifier = data;
        return self;
    };
}

-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForHandoff{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) self.eligibleForHandoff = data;
        return self;
    };
}

-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForSearch{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) self.eligibleForSearch = data;
        return self;
    };
}

-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForPublicIndexing{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) self.eligibleForPublicIndexing = data;
        return self;
    };
}

-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForPrediction{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 12.0, *)) self.eligibleForPrediction = data;
        return self;
    };
}

-(JobsRetNSUserActivityByNSStringBlock _Nonnull)byPersistentIdentifier{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 12.0, *)) self.persistentIdentifier = data;
        return self;
    };
}

-(JobsRetNSUserActivityByVoidBlock _Nonnull)byBecomeCurrent{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable{
        @jobs_strongify(self)
        [self becomeCurrent];
        return self;
    };
}

-(JobsRetNSUserActivityByVoidBlock _Nonnull)byResignCurrent{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable{
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) [self resignCurrent];
        return self;
    };
}

-(JobsRetNSUserActivityByVoidBlock _Nonnull)byInvalidate{
    @jobs_weakify(self)
    return ^__kindof NSUserActivity *_Nullable{
        @jobs_strongify(self)
        [self invalidate];
        return self;
    };
}

@end
