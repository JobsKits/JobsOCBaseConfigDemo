//
//  MJRefreshBackGifFooter+Extra.h
//  MJRefreshExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MJREFRESHBACKGIFFOOTER_EXTRA_984194396C
#define JOBS_HEADER_GUARD_MJREFRESHBACKGIFFOOTER_EXTRA_984194396C

#import <UIKit/UIKit.h>

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshBackGifFooter (Extra)<MJRefreshProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MJREFRESHBACKGIFFOOTER_EXTRA_984194396C */
