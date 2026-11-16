//
//  UITabBarItem+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABBARITEM_EXTRA_3D5440BD47
#define JOBS_HEADER_GUARD_UITABBARITEM_EXTRA_3D5440BD47

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (Extra)

-(JobsRetTabBarItemByUIOffsetBlock _Nonnull)byTitlePositionAdjustment;
-(jobsByCorBlock _Nonnull)titleTextAttributesByNormalState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByHighlightedState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByDisabledState;
-(jobsByCorBlock _Nonnull)titleTextAttributesBySelectedState API_AVAILABLE(ios(9.0));
-(jobsByCorBlock _Nonnull)titleTextAttributesByFocusedState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByApplicationState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByReservedState;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABBARITEM_EXTRA_3D5440BD47 */
