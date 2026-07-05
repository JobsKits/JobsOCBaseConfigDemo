//
//  UISlider+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UISLIDER_DSL_5E8B9D3A44
#define JOBS_HEADER_GUARD_UISLIDER_DSL_5E8B9D3A44

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

@interface UISlider (DSL)

#pragma mark —— Value
-(JobsRetSliderByFloatBlock _Nonnull)byMinimumValue;
-(JobsRetSliderByFloatBlock _Nonnull)byMaximumValue;
-(JobsRetSliderByFloatBlock _Nonnull)byValue;
#pragma mark —— Tint
-(JobsRetSliderByColorBlock _Nonnull)byMinimumTrackTintColor;
-(JobsRetSliderByColorBlock _Nonnull)byMaximumTrackTintColor;
-(JobsRetSliderByColorBlock _Nonnull)byThumbTintColor;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISLIDER_DSL_5E8B9D3A44 */
