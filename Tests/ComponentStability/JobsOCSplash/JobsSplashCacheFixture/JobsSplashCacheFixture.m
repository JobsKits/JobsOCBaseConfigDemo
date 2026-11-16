//
//  JobsSplashCacheFixture.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsSplashCacheFixture.h"
#import "../JobsSplashTransferTaskFixture/JobsSplashTransferTaskFixture.h"

// 用途：实现测试替身（fixture）；接管原始下载回调并记录传输次数，供开屏重试和共享下载状态测试。
// 运行：由 JobsOCSplash-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

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
