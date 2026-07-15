//
//  UITabBarItem+TLAnimation.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABBARITEM_TLANIMATION_3C61B8C262
#define JOBS_HEADER_GUARD_UITABBARITEM_TLANIMATION_3C61B8C262

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "TLAnimationProtocol.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TLAnimationProtocol;

@interface UITabBarItem (TLAnimation)

Prop_strong()id <TLAnimationProtocol>animation;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABBARITEM_TLANIMATION_3C61B8C262 */
