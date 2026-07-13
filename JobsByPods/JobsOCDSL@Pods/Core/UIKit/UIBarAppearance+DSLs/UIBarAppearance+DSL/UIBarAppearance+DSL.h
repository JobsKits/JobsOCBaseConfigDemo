//
//  UIBarAppearance+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UIBARAPPEARANCE_DSL_1F5A438368
#define JOBS_HEADER_GUARD_UIBARAPPEARANCE_DSL_1F5A438368

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

@interface UIBarAppearance (DSL)

-(JobsRetBarAppearanceByVoidBlock _Nonnull)byConfigureWithDefaultBackground API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByVoidBlock _Nonnull)byConfigureWithOpaqueBackground API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByVoidBlock _Nonnull)byConfigureWithTransparentBackground API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByVisualEffectBlock _Nonnull)byBackgroundEffect API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByCorBlock _Nonnull)byBackgroundColor API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByImageBlock _Nonnull)byBackgroundImage API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByNSIntegerBlock _Nonnull)byBackgroundImageContentMode API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByCorBlock _Nonnull)byShadowColor API_AVAILABLE(ios(13.0));
-(JobsRetBarAppearanceByImageBlock _Nonnull)byShadowImage API_AVAILABLE(ios(13.0));

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBARAPPEARANCE_DSL_1F5A438368 */
