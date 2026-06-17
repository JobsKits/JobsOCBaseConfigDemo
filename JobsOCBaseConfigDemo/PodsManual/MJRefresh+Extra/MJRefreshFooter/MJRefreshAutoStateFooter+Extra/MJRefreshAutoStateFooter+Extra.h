//
//  MJRefreshAutoStateFooter+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 9/23/24.
//

#import "MJRefreshProtocol.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshAutoStateFooter (Extra)<MJRefreshProtocol>

@end

NS_ASSUME_NONNULL_END
