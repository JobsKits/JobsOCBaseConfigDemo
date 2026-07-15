//
//  WGradientProgressView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_WGRADIENTPROGRESSVIEW_59226093F6
#define JOBS_HEADER_GUARD_WGRADIENTPROGRESSVIEW_59226093F6

#import <UIKit/UIKit.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 进度条上方的指示标签，可以作为动态跟随，也可以作为固定在栅栏的上方
@interface WGradientProgressView : UIView

Prop_copy()NSString *titleStr;
Prop_strong()UIImage *img;
Prop_strong()UIFont *titleFont;
Prop_strong()UIColor *titleColor;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_WGRADIENTPROGRESSVIEW_59226093F6 */
