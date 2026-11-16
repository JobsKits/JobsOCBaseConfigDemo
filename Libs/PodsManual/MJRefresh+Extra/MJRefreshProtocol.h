//
//  MJRefreshProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MJREFRESHPROTOCOL_DF4BAEF426
#define JOBS_HEADER_GUARD_MJREFRESHPROTOCOL_DF4BAEF426

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MJRefreshProtocol <NSObject>
@optional
/// 普通闲置状态【图】
-(JobsRetMJRefreshViewByArrayBlock _Nonnull)refreshStateIdleByImages;
/// 松开就可以进行刷新的状态【图】
-(JobsRetMJRefreshViewByArrayBlock _Nonnull)refreshStatePullingByImages;
/// 正在刷新中的状态【图】
-(JobsRetMJRefreshViewByArrayBlock _Nonnull)refreshStateRefreshingByImages;
/// 即将刷新的状态【图】
-(JobsRetMJRefreshViewByArrayBlock _Nonnull)refreshStateWillRefreshByImages;
/// 所有数据加载完毕，没有更多的数据了【图】
-(JobsRetMJRefreshViewByArrayBlock _Nonnull)refreshStateNoMoreDataByImages;
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateIdleByString;
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStatePullingByString;
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateRefreshingByString;
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateWillRefreshByString;
/// 松开就可以进行刷新的状态【字】
-(JobsRetMJRefreshViewByStringBlock _Nonnull)refreshStateNoMoreDataByString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MJREFRESHPROTOCOL_DF4BAEF426 */
