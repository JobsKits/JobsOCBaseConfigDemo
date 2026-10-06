//
//  JobsSplashCacheFixture.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsSplashCacheFixture.h"
#import "../JobsSplashTransferTaskFixture/JobsSplashTransferTaskFixture.h"

@implementation JobsSplashCacheFixture

-(NSURLSessionDownloadTask *)download:(NSURL *)URL completion:(JobsOCSplashMediaCacheCompletion)completion{
    self.rawDownloadCount += 1;
    self.rawCompletion = completion;
    self.transferTask = [JobsSplashTransferTaskFixture new];
    return (NSURLSessionDownloadTask *)self.transferTask;
}

-(jobsByURLBlock _Nonnull)removePendingVideoURL{
    return ^(NSURL *URL) {
    };
}

@end
