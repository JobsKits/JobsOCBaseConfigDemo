//
//  ZFDouYinControlView.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_CA2F565BE2
#define JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_CA2F565BE2

#import <UIKit/UIKit.h>
#import <ZFPlayer/ZFPlayerMediaControl.h>
#import <ZFPlayer/UIView+ZFFrame.h>
#import <ZFPlayer/UIImageView+ZFCache.h>
#import <ZFPlayer/ZFUtilities.h>
#import <ZFPlayer/ZFSliderView.h>
#import <ZFPlayer/ZFPlayerController.h>

#if __has_include(<ZFPlayer/ZFLoadingView.h>)
#import <ZFPlayer/ZFLoadingView.h>
#else
#import "ZFLoadingView.h"
#endif

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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

@interface ZFSliderView (JobsDSL)

-(JobsRetZFSliderViewByFloatBlock _Nonnull)byValue;
-(JobsRetZFSliderViewByFloatBlock _Nonnull)byBufferValue;
-(JobsRetZFSliderViewByCorBlock _Nonnull)byMaximumTrackTintColor;
-(JobsRetZFSliderViewByCorBlock _Nonnull)byMinimumTrackTintColor;
-(JobsRetZFSliderViewByCorBlock _Nonnull)byBufferTrackTintColor;
-(JobsRetZFSliderViewByCGFloatBlock _Nonnull)bySliderHeight;
-(JobsRetZFSliderViewByBOOLBlock _Nonnull)byIsHideSliderBlock;

@end

@interface ZFDouYinControlView : UIView <ZFPlayerMediaControl>

-(jobsByVoidBlock _Nonnull)resetControlView;
-(jobsByStrBlock _Nonnull)showCoverViewWithUrl;

@end
#endif /* JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_CA2F565BE2 */
