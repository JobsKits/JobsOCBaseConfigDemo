//
//  JobsOCSplashMediaCache.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashMediaCache_h
#define JobsOCSplashMediaCache_h

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashMediaCache : NSObject

+(instancetype)shared;
-(nullable NSURL *)cachedFileURLForRemoteURL:(NSURL *)remoteURL;
-(nullable NSURLSessionDownloadTask *)download:(NSURL *)remoteURL completion:(JobsOCSplashMediaCacheCompletion)completion;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashMediaCache_h */
