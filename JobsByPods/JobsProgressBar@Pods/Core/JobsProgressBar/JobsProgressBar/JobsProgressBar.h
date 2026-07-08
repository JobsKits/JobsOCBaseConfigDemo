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

-(instancetype)stopAutoProgress;

-(JobsProgressBar *_Nonnull(^)(JobsProgressBarDirection data))byDirection;
-(JobsProgressBar *_Nonnull(^)(JobsProgressBarValueMode data))byValueMode;
-(JobsProgressBar *_Nonnull(^)(BOOL data))byAutoStopOnExternalChange;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byProgress;
-(JobsProgressBar *_Nonnull(^)(UIColor *data))byTrackTintColor;
-(JobsProgressBar *_Nonnull(^)(UIColor *data))byProgressTintColor;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byTrackThickness;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byTrackHorizontalInset;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byTrackVerticalInset;
-(JobsProgressBar *_Nonnull(^)(JobsProgressBarLabelPlacement data))byProgressLabelPlacement;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byProgressLabelSpacing;
-(JobsProgressBar *_Nonnull(^)(BOOL data))byAutoHideLabel;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byLabelMinVisibleHeight;
-(JobsProgressBar *_Nonnull(^)(UIImage *_Nullable data))byThumbImage;
-(JobsProgressBar *_Nonnull(^)(CGSize data))byThumbSize;
-(JobsProgressBar *_Nonnull(^)(UIOffset data))byThumbOffset;
-(JobsProgressBar *_Nonnull(^)(UIViewContentMode data))byThumbContentMode;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byThumbCornerRadius;
-(JobsProgressBar *_Nonnull(^)(BOOL data))byThumbFollowsFillStyle;
-(JobsProgressBar *_Nonnull(^)(UIColor *_Nullable data))byThumbBackgroundColor;
-(JobsProgressBar *_Nonnull(^)(UIColor *_Nullable data))byThumbBorderColor;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byThumbBorderWidth;
-(JobsProgressBar *_Nonnull(^)(float data))byThumbShadowOpacity;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byThumbShadowRadius;
-(JobsProgressBar *_Nonnull(^)(CGSize data))byThumbShadowOffset;
-(JobsProgressBar *_Nonnull(^)(UIColor *_Nullable data))byThumbShadowColor;
-(JobsProgressBar *_Nonnull(^)(BOOL data))byDraggable;
-(JobsProgressBar *_Nonnull(^)(BOOL data))byDragThumbScales;
-(JobsProgressBar *_Nonnull(^)(CGFloat data))byDragThumbScale;
-(JobsProgressBar *_Nonnull(^)(jobsByCGFloatBlock _Nullable block))byOnProgressChanged;
-(JobsProgressBar *_Nonnull(^)(jobsByCGFloatBlock _Nullable block))byOnDragBegan;
-(JobsProgressBar *_Nonnull(^)(jobsByCGFloatBlock _Nullable block))byOnDragChanged;
-(JobsProgressBar *_Nonnull(^)(jobsByCGFloatBlock _Nullable block))byOnDragEnded;

@end

NS_ASSUME_NONNULL_END
#endif /* JobsProgressBar_h */
