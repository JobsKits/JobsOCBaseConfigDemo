//
//  WKWebsiteDataStore+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_WKWEBSITEDATASTORE_EXTRA_70475FBF81
#define JOBS_HEADER_GUARD_WKWEBSITEDATASTORE_EXTRA_70475FBF81

#import <WebKit/WebKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKWebsiteDataStore (Extra)

- (jobsByVoidBlock)clean;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_WKWEBSITEDATASTORE_EXTRA_70475FBF81 */
