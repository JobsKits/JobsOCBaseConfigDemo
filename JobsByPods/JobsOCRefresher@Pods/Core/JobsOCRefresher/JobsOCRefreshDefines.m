//
//  JobsOCRefreshDefines.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshDefines.h"

JobsOCRefreshAxis JobsOCRefreshAxisForPosition(JobsOCRefreshPosition position) {
    switch (position) {
        case JobsOCRefreshPositionHeader:
        case JobsOCRefreshPositionFooter:
            return JobsOCRefreshAxisVertical;
        case JobsOCRefreshPositionLeft:
        case JobsOCRefreshPositionRight:
            return JobsOCRefreshAxisHorizontal;
    };return JobsOCRefreshAxisVertical;
}

JobsOCRefreshRole JobsOCRefreshRoleForPosition(JobsOCRefreshHorizontalMode mode,
                                               JobsOCRefreshPosition position) {
    switch (position) {
        case JobsOCRefreshPositionHeader:
            return JobsOCRefreshRoleRefresh;
        case JobsOCRefreshPositionFooter:
            return JobsOCRefreshRoleLoadMore;
        case JobsOCRefreshPositionLeft:
            return mode == JobsOCRefreshHorizontalModeRefreshRightLoadLeft ? JobsOCRefreshRoleRefresh : JobsOCRefreshRoleLoadMore;
        case JobsOCRefreshPositionRight:
            return mode == JobsOCRefreshHorizontalModeRefreshRightLoadLeft ? JobsOCRefreshRoleLoadMore : JobsOCRefreshRoleRefresh;
    };return JobsOCRefreshRoleRefresh;
}

BOOL JobsOCRefreshPositionIsHorizontal(JobsOCRefreshPosition position) {
    return JobsOCRefreshAxisForPosition(position) == JobsOCRefreshAxisHorizontal;
}
