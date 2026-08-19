//
//  ZFDouYinControlView.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_CA2F565BE2

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#define JOBS_HEADER_GUARD_ZFDOUYINCONTROLVIEW_CA2F565BE2

#import <UIKit/UIKit.h>

#if __has_include(<ZFPlayer/ZFLoadingView.h>)
#import <ZFPlayer/ZFLoadingView.h>
#else
#import "ZFLoadingView.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

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
