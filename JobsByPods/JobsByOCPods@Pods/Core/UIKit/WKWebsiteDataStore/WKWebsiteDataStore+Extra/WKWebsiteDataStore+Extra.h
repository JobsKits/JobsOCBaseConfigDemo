//
//  WKWebsiteDataStore+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_WKWEBSITEDATASTORE_EXTRA_70475FBF81
#define JOBS_HEADER_GUARD_WKWEBSITEDATASTORE_EXTRA_70475FBF81

#import <WebKit/WebKit.h>

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

@interface WKWebsiteDataStore (Extra)

- (jobsByVoidBlock _Nonnull)clean;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_WKWEBSITEDATASTORE_EXTRA_70475FBF81 */
