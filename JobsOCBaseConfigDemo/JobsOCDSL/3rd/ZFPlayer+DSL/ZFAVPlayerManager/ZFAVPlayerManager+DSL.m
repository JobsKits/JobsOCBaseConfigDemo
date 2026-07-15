//
//  ZFAVPlayerManager+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "ZFAVPlayerManager+DSL.h"

@implementation ZFAVPlayerManager (DSL)
-(JobsRetZFAVPlayerManagerByTimeIntervalBlock _Nonnull)byTimeRefreshInterval{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.timeRefreshInterval = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByDictionaryBlock _Nonnull)byRequestHeader{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.requestHeader = data;
        return self;
    };
}

@end
