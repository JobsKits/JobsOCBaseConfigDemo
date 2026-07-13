//
//  UISwitch+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UISWITCH_DSL_42D7AE8C11
#define JOBS_HEADER_GUARD_UISWITCH_DSL_42D7AE8C11

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

@interface UISwitch (DSL)

Prop_assign(readonly)BOOL jobs_isOn;
-(JobsRetSwitchByBOOLBlock _Nonnull)byOn;
-(JobsRetSwitchByOnAnimatedBlock _Nonnull)byOnAnimated;
-(JobsRetSwitchByColorBlock _Nonnull)byOnTintColor;
-(JobsRetSwitchByColorBlock _Nonnull)byThumbTintColor;
-(JobsRetSwitchByStyleBlock _Nonnull)byPreferredStyle API_AVAILABLE(ios(14.0));
-(JobsRetSwitchByStringBlock _Nonnull)byTitle API_AVAILABLE(ios(14.0));
-(JobsRetSwitchByImageBlock _Nonnull)byOnImage;
-(JobsRetSwitchByImageBlock _Nonnull)byOffImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISWITCH_DSL_42D7AE8C11 */
