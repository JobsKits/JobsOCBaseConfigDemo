//
//  JobsProgressBar.h
//  JobsProgressBar
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#ifndef JobsProgressBar_h
#define JobsProgressBar_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsProgressBarDirection) {
    JobsProgressBarDirectionLeftToRight,
    JobsProgressBarDirectionRightToLeft,
    JobsProgressBarDirectionTopToBottom,
    JobsProgressBarDirectionBottomToTop
};

typedef NS_ENUM(NSUInteger, JobsProgressBarValueMode) {
    JobsProgressBarValueModeCountUp,
    JobsProgressBarValueModeCountDown
};

typedef NS_ENUM(NSUInteger, JobsProgressBarLabelPlacement) {
    JobsProgressBarLabelPlacementTop,
    JobsProgressBarLabelPlacementBottom,
    JobsProgressBarLabelPlacementHidden
};

@interface JobsProgressBar : UIView

Prop_assign()JobsProgressBarDirection direction;
Prop_assign()JobsProgressBarValueMode valueMode;
Prop_assign()BOOL autoStopOnExternalChange;
Prop_assign()CGFloat progress;
Prop_strong()UIColor *trackTintColor;
Prop_strong()UIColor *progressTintColor;
Prop_assign()CGFloat trackThickness;
Prop_assign()CGFloat trackHorizontalInset;
Prop_assign()CGFloat trackVerticalInset;
Prop_assign()JobsProgressBarLabelPlacement progressLabelPlacement;
Prop_assign()CGFloat progressLabelSpacing;
Prop_assign()BOOL autoHideLabel;
Prop_assign()CGFloat labelMinVisibleHeight;
Prop_strong(nullable)UIImage *thumbImage;
Prop_assign()CGSize thumbSize;
Prop_assign()UIOffset thumbOffset;
Prop_assign()UIViewContentMode thumbContentMode;
Prop_assign()CGFloat thumbCornerRadius;
Prop_assign()BOOL thumbFollowsFillStyle;
Prop_strong(nullable)UIColor *thumbBackgroundColor;
Prop_strong(nullable)UIColor *thumbBorderColor;
Prop_assign()CGFloat thumbBorderWidth;
Prop_assign()float thumbShadowOpacity;
Prop_assign()CGFloat thumbShadowRadius;
Prop_assign()CGSize thumbShadowOffset;
Prop_strong(nullable)UIColor *thumbShadowColor;
Prop_assign(getter=isDraggable)BOOL draggable;
Prop_assign()BOOL dragThumbScales;
Prop_assign()CGFloat dragThumbScale;
Prop_copy(nullable)jobsByCGFloatBlock onProgressChanged;
Prop_copy(nullable)jobsByCGFloatBlock onDragBegan;
Prop_copy(nullable)jobsByCGFloatBlock onDragChanged;
Prop_copy(nullable)jobsByCGFloatBlock onDragEnded;

-(void)setProgress:(CGFloat)progress
          animated:(BOOL)animated
          duration:(NSTimeInterval)duration;

-(CGFloat)setDisplayPercent:(CGFloat)percent
                   animated:(BOOL)animated
                   duration:(NSTimeInterval)duration;

-(instancetype)startAutoProgressFromZero:(BOOL)fromZero
                                    step:(CGFloat)step
                                interval:(NSTimeInterval)interval
                                animated:(BOOL)animated;

-(JobsRetIDByVoidBlock _Nonnull)stopAutoProgress;

-(JobsRetJobsProgressBarByJobsProgressBarDirectionBlock _Nonnull)byDirection;
-(JobsRetJobsProgressBarByJobsProgressBarValueModeBlock _Nonnull)byValueMode;
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byAutoStopOnExternalChange;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byProgress;
-(JobsRetJobsProgressBarByUIColorBlock _Nonnull)byTrackTintColor;
-(JobsRetJobsProgressBarByUIColorBlock _Nonnull)byProgressTintColor;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byTrackThickness;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byTrackHorizontalInset;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byTrackVerticalInset;
-(JobsRetJobsProgressBarByJobsProgressBarLabelPlacementBlock _Nonnull)byProgressLabelPlacement;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byProgressLabelSpacing;
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byAutoHideLabel;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byLabelMinVisibleHeight;
-(JobsRetJobsProgressBarByUIImageBlock _Nonnull)byThumbImage;
-(JobsRetJobsProgressBarByCGSizeBlock _Nonnull)byThumbSize;
-(JobsRetJobsProgressBarByUIOffsetBlock _Nonnull)byThumbOffset;
-(JobsRetJobsProgressBarByUIViewContentModeBlock _Nonnull)byThumbContentMode;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byThumbCornerRadius;
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byThumbFollowsFillStyle;
-(JobsRetJobsProgressBarByUIColorBlock _Nonnull)byThumbBackgroundColor;
-(JobsRetJobsProgressBarByUIColorBlock _Nonnull)byThumbBorderColor;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byThumbBorderWidth;
-(JobsRetJobsProgressBarByfloatBlock _Nonnull)byThumbShadowOpacity;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byThumbShadowRadius;
-(JobsRetJobsProgressBarByCGSizeBlock _Nonnull)byThumbShadowOffset;
-(JobsRetJobsProgressBarByUIColorBlock _Nonnull)byThumbShadowColor;
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byDraggable;
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byDragThumbScales;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byDragThumbScale;
-(JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnProgressChanged;
-(JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnDragBegan;
-(JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnDragChanged;
-(JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnDragEnded;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsProgressBar
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byAutoAnimated;
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byUserDragging;
-(JobsRetJobsProgressBarByCADisplayLinkBlock _Nonnull)byAutoDisplayLink;
-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byAutoStep;
-(JobsRetJobsProgressBarByNSTimeIntervalBlock _Nonnull)byAutoInterval;
-(JobsRetJobsProgressBarByNSTimeIntervalBlock _Nonnull)byAutoLastTick;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsProgressBar
@end

NS_ASSUME_NONNULL_END
#endif /* JobsProgressBar_h */
