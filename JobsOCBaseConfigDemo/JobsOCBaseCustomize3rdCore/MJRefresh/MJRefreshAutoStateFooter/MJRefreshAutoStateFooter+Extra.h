//
//  MJRefreshAutoStateFooter+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/5/30.
//

#import "UIView+Refresh.h"
#import "NSObject+Extras.h"
#import "UILabel+Extra.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshFooter (JobsExtra)
-(JobsRetMJRefreshFooterByStateBlock _Nonnull)byState;
@end

@interface MJRefreshAutoStateFooter (Extra)

-(JobsRetIDByBOOLBlock _Nonnull)byAutomaticallyChangeAlpha;
-(JobsRetMJRefreshAutoStateFooterByRefreshConfigModelBlock _Nonnull)byMJRefreshFooterConfigModel;

@end

NS_ASSUME_NONNULL_END
