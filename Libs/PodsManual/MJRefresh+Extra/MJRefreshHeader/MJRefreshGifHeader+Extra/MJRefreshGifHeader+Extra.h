//
//  MJRefreshGifHeader+Extra.h
//  MJRefreshExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MJREFRESHGIFHEADER_EXTRA_D2634BE769
#define JOBS_HEADER_GUARD_MJREFRESHGIFHEADER_EXTRA_D2634BE769

#import <UIKit/UIKit.h>

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshGifHeader (Extra)<MJRefreshProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MJREFRESHGIFHEADER_EXTRA_D2634BE769 */
