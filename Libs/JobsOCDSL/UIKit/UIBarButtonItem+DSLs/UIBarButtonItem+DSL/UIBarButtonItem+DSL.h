//
//  UIBarButtonItem+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIBARBUTTONITEM_DSL_20260611
#define JOBS_HEADER_GUARD_UIBARBUTTONITEM_DSL_20260611

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (DSL)

-(JobsRetBarButtonItemByStyleBlock _Nonnull)byStyle;
-(JobsRetBarButtonItemByCGFloatBlock _Nonnull)byWidth;
-(JobsRetBarButtonItemBySetBlock _Nonnull)byPossibleTitles;
-(JobsRetBarButtonItemByViewBlock _Nonnull)byCustomView;
-(JobsRetBarButtonItemBySELBlock _Nonnull)byAction;
-(JobsRetBarButtonItemByIDBlock _Nonnull)byTarget;
-(JobsRetBarButtonItemByCorBlock _Nonnull)byTintColor API_AVAILABLE(ios(5.0));
#if defined(__IPHONE_14_0)
-(JobsRetBarButtonItemByActionBlock _Nonnull)byPrimaryAction API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetBarButtonItemByMenuBlock _Nonnull)byMenu API_AVAILABLE(ios(14.0), tvos(17.0)) API_UNAVAILABLE(watchos);
#endif
#if defined(__IPHONE_15_0)
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)byChangesSelectionAsPrimaryAction API_AVAILABLE(ios(15.0), tvos(17.0)) API_UNAVAILABLE(watchos);
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)bySelected API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos, tvos);
#endif
#if defined(__IPHONE_16_0)
-(JobsRetBarButtonItemByContextMenuConfigurationElementOrderBlock _Nonnull)byPreferredMenuElementOrder API_AVAILABLE(ios(16.0), tvos(17.0)) API_UNAVAILABLE(watchos);
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)byHidden API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetBarButtonItemByMenuElementBlock _Nonnull)byMenuRepresentation API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos);
#endif
#if defined(__IPHONE_17_0)
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)bySymbolAnimationEnabled API_AVAILABLE(ios(17.0), tvos(17.0)) API_UNAVAILABLE(watchos);
#endif
#if defined(__IPHONE_26_0)
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)byHidesSharedBackground API_AVAILABLE(ios(26.0)) API_UNAVAILABLE(visionos) API_UNAVAILABLE(tvos, watchos);
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)bySharesBackground API_AVAILABLE(ios(26.0)) API_UNAVAILABLE(visionos) API_UNAVAILABLE(tvos, watchos);
-(JobsRetBarButtonItemByStringBlock _Nonnull)byIdentifier API_AVAILABLE(ios(26.0));
#endif

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBARBUTTONITEM_DSL_20260611 */
