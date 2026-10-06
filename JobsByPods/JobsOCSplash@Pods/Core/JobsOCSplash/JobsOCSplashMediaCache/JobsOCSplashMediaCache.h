//
//  JobsOCSplashMediaCache.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashMediaCache_h
#define JobsOCSplashMediaCache_h

#import <errno.h>
#import <stdio.h>
#import <ImageIO/ImageIO.h>
#import <Foundation/Foundation.h>
#import "JobsOCSplashMediaDownloadToken.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashMediaCache : NSObject

+(JobsRetIDByVoidBlock _Nonnull)shared;
-(jobsByVoidBlock _Nonnull)resumePendingVideoPreloads;
-(JobsRetURLByURLBlock _Nonnull)cachedFileURLForRemoteURL;
-(nullable NSURLSessionDownloadTask *)download:(NSURL *)remoteURL completion:(JobsOCSplashMediaCacheCompletion)completion;
/// 同 URL 合并传输，token.cancel() 或释放 token 静默退订；其它订阅继续。
-(nullable JobsOCSplashMediaDownloadToken *)downloadImage:(NSURL *)remoteURL completion:(JobsOCSplashMediaCacheCompletion)completion;
-(void)preloadVideo:(NSURL *)remoteURL completion:(jobsByURLBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashMediaCache_h */
