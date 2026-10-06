//
//  JobsSplashCacheFixture.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <JobsOCSplash/JobsOCSplashMediaCache.h>

@interface JobsSplashCacheFixture : JobsOCSplashMediaCache

@property(nonatomic, assign)NSUInteger rawDownloadCount;
@property(nonatomic, copy)JobsOCSplashMediaCacheCompletion rawCompletion;
@property(nonatomic, strong)NSObject *transferTask;

@end
