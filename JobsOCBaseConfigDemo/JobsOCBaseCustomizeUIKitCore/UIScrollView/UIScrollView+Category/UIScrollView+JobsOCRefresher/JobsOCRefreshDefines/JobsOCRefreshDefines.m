//
//  JobsOCRefreshDefines.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshDefines.h"

JobsOCRefreshAxis JobsOCRefreshAxisForPosition(JobsOCRefreshPosition position) {
    switch (position) {
        /// 处理 JobsOCRefreshPositionHeader 分支
        case JobsOCRefreshPositionHeader:
        /// 处理 JobsOCRefreshPositionFooter 分支
        case JobsOCRefreshPositionFooter:
            return JobsOCRefreshAxisVertical;
        /// 处理 JobsOCRefreshPositionLeft 分支
        case JobsOCRefreshPositionLeft:
        /// 处理 JobsOCRefreshPositionRight 分支
        case JobsOCRefreshPositionRight:
            return JobsOCRefreshAxisHorizontal;
    };return JobsOCRefreshAxisVertical;
}

JobsOCRefreshRole JobsOCRefreshRoleForPosition(JobsOCRefreshHorizontalMode mode,
                                               JobsOCRefreshPosition position) {
    switch (position) {
        /// 处理 JobsOCRefreshPositionHeader 分支
        case JobsOCRefreshPositionHeader:
            return JobsOCRefreshRoleRefresh;
        /// 处理 JobsOCRefreshPositionFooter 分支
        case JobsOCRefreshPositionFooter:
            return JobsOCRefreshRoleLoadMore;
        /// 处理 JobsOCRefreshPositionLeft 分支
        case JobsOCRefreshPositionLeft:
            return mode == JobsOCRefreshHorizontalModeRefreshRightLoadLeft ? JobsOCRefreshRoleRefresh : JobsOCRefreshRoleLoadMore;
        /// 处理 JobsOCRefreshPositionRight 分支
        case JobsOCRefreshPositionRight:
            return mode == JobsOCRefreshHorizontalModeRefreshRightLoadLeft ? JobsOCRefreshRoleLoadMore : JobsOCRefreshRoleRefresh;
    };return JobsOCRefreshRoleRefresh;
}

BOOL JobsOCRefreshPositionIsHorizontal(JobsOCRefreshPosition position) {
    return JobsOCRefreshAxisForPosition(position) == JobsOCRefreshAxisHorizontal;
}
