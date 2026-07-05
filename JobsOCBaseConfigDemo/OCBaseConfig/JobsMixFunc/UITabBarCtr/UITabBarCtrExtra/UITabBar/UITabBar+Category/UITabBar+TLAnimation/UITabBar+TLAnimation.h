//
//  UITabBar+TLAnimation.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABBAR_TLANIMATION_BAF6F98016
#define JOBS_HEADER_GUARD_UITABBAR_TLANIMATION_BAF6F98016

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "TLAnimationProtocol.h"
#import "UITabBarItem+TLAnimation.h"

#import "JobsOCRuntimeKits.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (TLAnimation)

Prop_strong(readonly)NSMutableArray *btns;
Prop_assign(readonly)NSUInteger selectedIndex;

@end

NS_ASSUME_NONNULL_END
/** Tips1:
 * 如有需要，子类中可以`- (void)tl_didAddSubview:(UIView *)subview`代替`
 * - (void)didAddSubview:(UIView *)subview`方法

- (void)didAddSubview:(UIView *)subview;

 */

/** Tips2:
 * 如需要监听TabBarItem的点击事件，可在UITabBarController的子类(UITabBar实例的默认代理)中实现UITabBar的代理方法
 * `- tabBar: didSelectItem:`
 */
#endif /* JOBS_HEADER_GUARD_UITABBAR_TLANIMATION_BAF6F98016 */
