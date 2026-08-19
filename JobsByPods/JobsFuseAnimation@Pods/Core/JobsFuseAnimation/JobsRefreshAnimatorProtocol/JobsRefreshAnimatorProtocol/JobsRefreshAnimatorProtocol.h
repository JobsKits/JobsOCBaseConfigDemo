//
//  JobsRefreshAnimatorProtocol.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#ifndef JOBS_HEADER_GUARD_JOBSREFRESHANIMATORPROTOCOL_4F21E12C6A
#define JOBS_HEADER_GUARD_JOBSREFRESHANIMATORPROTOCOL_4F21E12C6A

typedef NS_ENUM(NSUInteger, JobsRefreshAnimatorPhase) {
    JobsRefreshAnimatorPhaseIdle,
    JobsRefreshAnimatorPhasePulling,
    JobsRefreshAnimatorPhaseReady,
    JobsRefreshAnimatorPhaseRefreshing,
    JobsRefreshAnimatorPhaseEnding,
    JobsRefreshAnimatorPhaseInactive
};

NS_ASSUME_NONNULL_BEGIN

/// 刷新宿主只依赖此协议；图片、Lottie、GIF 和品牌动画均在动画框架内实现。
@protocol JobsRefreshAnimatorProtocol <NSObject>

-(JobsRetViewByVoidBlock _Nonnull)refreshAnimatorView;
-(JobsRetCGSizeByVoidBlock _Nonnull)refreshAnimatorPreferredSize;
-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSREFRESHANIMATORPROTOCOL_4F21E12C6A */
