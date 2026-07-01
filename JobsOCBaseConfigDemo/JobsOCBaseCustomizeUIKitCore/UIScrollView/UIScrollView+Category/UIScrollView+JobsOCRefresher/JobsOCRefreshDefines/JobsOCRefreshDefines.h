//
//  JobsOCRefreshDefines.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import <UIKit/UIKit.h>

#ifndef JobsOCRefreshDefines_h
#define JobsOCRefreshDefines_h

typedef NS_ENUM(NSUInteger, JobsOCRefreshAxis) {
    JobsOCRefreshAxisVertical,
    JobsOCRefreshAxisHorizontal
};

typedef NS_ENUM(NSUInteger, JobsOCRefreshPosition) {
    JobsOCRefreshPositionHeader,
    JobsOCRefreshPositionFooter,
    JobsOCRefreshPositionLeft,
    JobsOCRefreshPositionRight
};

typedef NS_ENUM(NSUInteger, JobsOCRefreshRole) {
    JobsOCRefreshRoleRefresh,
    JobsOCRefreshRoleLoadMore
};

typedef NS_ENUM(NSUInteger, JobsOCRefreshHorizontalMode) {
    /// 横向向右拉 = 刷新；横向向左拉 = 加载更多
    JobsOCRefreshHorizontalModeRefreshRightLoadLeft,
    /// 横向向右拉 = 加载更多；横向向左拉 = 刷新
    JobsOCRefreshHorizontalModeLoadRightRefreshLeft
};

typedef NS_ENUM(NSUInteger, JobsOCRefreshState) {
    JobsOCRefreshStateIdle,
    JobsOCRefreshStatePulling,
    JobsOCRefreshStateReady,
    JobsOCRefreshStateRefreshing,
    JobsOCRefreshStateEnding,
    JobsOCRefreshStateFailed,
    JobsOCRefreshStateDisabled,
    JobsOCRefreshStateNoMoreData,
    JobsOCRefreshStateRemoved
};

typedef NS_ENUM(NSUInteger, JobsOCRefreshAnimationType) {
    JobsOCRefreshAnimationTypeSystem,
    JobsOCRefreshAnimationTypeLottie,
    JobsOCRefreshAnimationTypeGIF,
    JobsOCRefreshAnimationTypeFrameImages,
    JobsOCRefreshAnimationTypeNetworkImage
};

typedef void(^JobsOCRefreshActionBlock)(void);

FOUNDATION_EXPORT JobsOCRefreshAxis JobsOCRefreshAxisForPosition(JobsOCRefreshPosition position);
FOUNDATION_EXPORT JobsOCRefreshRole JobsOCRefreshRoleForPosition(JobsOCRefreshHorizontalMode mode,
                                                                 JobsOCRefreshPosition position);
FOUNDATION_EXPORT BOOL JobsOCRefreshPositionIsHorizontal(JobsOCRefreshPosition position);

#endif /* JobsOCRefreshDefines_h */
