//
//  JobsOCCommentDefines.h
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCCOMMENTDEFINES_643A3B7D98
#define JOBS_HEADER_GUARD_JOBSOCCOMMENTDEFINES_643A3B7D98

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JobsOCCommentMode) {
    JobsOCCommentModeNetEase = 0,
    JobsOCCommentModeToutiao,
    JobsOCCommentModeCustom
};

static const CGFloat JobsOCCommentRootLeading = 12.0;
static const CGFloat JobsOCCommentNetEaseChildLeading = 54.0;
static const CGFloat JobsOCCommentToutiaoChildLeading = 12.0;
static const CGFloat JobsOCCommentCustomChildLeading = 44.0;
static const NSUInteger JobsOCCommentDefaultMaxVisibleChildReplyCount __attribute__((unused)) = 3;
static NSString * const JobsOCCommentMoreRepliesText __attribute__((unused)) = @"——显示更多——";

NS_INLINE __attribute__((unused)) CGFloat JobsOCCommentLeadingByModeAndDepth(JobsOCCommentMode mode,
                                                                             NSInteger depth) {
    if (depth <= 0) return JobsOCCommentRootLeading;
    switch (mode) {
        case JobsOCCommentModeNetEase:
            return JobsOCCommentNetEaseChildLeading;
        case JobsOCCommentModeToutiao:
            return JobsOCCommentToutiaoChildLeading;
        case JobsOCCommentModeCustom:
            return JobsOCCommentCustomChildLeading;
    };return JobsOCCommentRootLeading;
}

#endif /* JOBS_HEADER_GUARD_JOBSOCCOMMENTDEFINES_643A3B7D98 */
