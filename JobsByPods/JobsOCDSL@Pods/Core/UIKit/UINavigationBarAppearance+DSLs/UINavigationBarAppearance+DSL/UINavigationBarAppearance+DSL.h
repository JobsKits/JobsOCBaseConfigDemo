//
//  UINavigationBarAppearance+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONBARAPPEARANCE_DSL_24C7A18F59
#define JOBS_HEADER_GUARD_UINAVIGATIONBARAPPEARANCE_DSL_24C7A18F59

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

API_AVAILABLE(ios(13.0))
@interface UINavigationBarAppearance (DSL)

-(JobsRetNavigationBarAppearanceByDictionaryBlock _Nonnull)byTitleTextAttributes;
-(JobsRetNavigationBarAppearanceByDictionaryBlock _Nonnull)byLargeTitleTextAttributes;
-(JobsRetNavigationBarAppearanceByOffsetBlock _Nonnull)byTitlePositionAdjustment;
-(JobsRetNavigationBarAppearanceByButtonItemAppearanceBlock _Nonnull)byButtonAppearance;
-(JobsRetNavigationBarAppearanceByButtonItemAppearanceBlock _Nonnull)byDoneButtonAppearance;
-(JobsRetNavigationBarAppearanceByButtonItemAppearanceBlock _Nonnull)byBackButtonAppearance;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONBARAPPEARANCE_DSL_24C7A18F59 */
