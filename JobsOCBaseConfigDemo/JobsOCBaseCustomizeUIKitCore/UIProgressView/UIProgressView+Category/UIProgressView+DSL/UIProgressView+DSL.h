//
//  UIProgressView+DSL.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIPROGRESSVIEW_DSL_FA5725081C
#define JOBS_HEADER_GUARD_UIPROGRESSVIEW_DSL_FA5725081C

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIProgressView (DSL)

#pragma mark —— Style
-(JobsRetProgressViewByStyleBlock _Nonnull)byProgressViewStyle;
#pragma mark —— Progress
-(JobsRetProgressViewByFloatBlock _Nonnull)byProgress;
-(JobsRetProgressViewByFloatAnimatedBlock _Nonnull)byProgressAnimated;
#pragma mark —— Tint & Image
-(JobsRetProgressViewByColorBlock _Nonnull)byProgressTintColor;
-(JobsRetProgressViewByColorBlock _Nonnull)byTrackTintColor;
-(JobsRetProgressViewByImageBlock _Nonnull)byProgressImage;
-(JobsRetProgressViewByImageBlock _Nonnull)byTrackImage;
#pragma mark —— NSProgress 绑定
-(JobsRetProgressViewByNSProgressBlock _Nonnull)byObservedProgress;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIPROGRESSVIEW_DSL_FA5725081C */
