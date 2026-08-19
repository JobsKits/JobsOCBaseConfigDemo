//
//  LZTabBarController.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LZTABBARCONTROLLER_51B5F2F465
#define JOBS_HEADER_GUARD_LZTABBARCONTROLLER_51B5F2F465

#import <UIKit/UIKit.h>
#import <JobsOCTools/LZTabBar.h>
#import <JobsOCTools/LZTabBarConfig.h>

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

typedef LZTabBarConfig *_Nullable(^tabBarBlock)(LZTabBarConfig * _Nonnull config);
/// 底部tabBar自定义的tabBarController
/// 只需调用给出的类方法, 配置相关参数即可创建tabBarController实例对象

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface LZTabBarController : UITabBarController<LZTabBarDelegate>
/// 是否可用自动旋转屏幕
Prop_assign()BOOL isAutoRotation;
/// 创建tabBarController
+(JobsRetIDBytabBarBlockBlock _Nonnull)createTabBarController;
/// 获取当前的tabBarController实例, 实例创建后可通过此方法获取当前实例
+(JobsRetIDByVoidBlock _Nonnull)defaultTabBarController;
/// 隐藏底部tabBar的方法
-(jobsByBOOLBlock _Nonnull)hiddenTabBarWithAnimation;
/// 显示底部tabBar的方法
-(jobsByBOOLBlock _Nonnull)showTabBarWithAnimation;
/// 切换
-(jobsByNSUIntegerBlock _Nonnull)customSelectIndex;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LZTabBarController
-(JobsRetLZTabBarControllerByNSArrayUIViewControllerBlock _Nonnull)byViewControllers;
-(JobsRetLZTabBarControllerByNSUIntegerBlock _Nonnull)bySelectedIndex;
-(void)setSelectedIndex:(NSUInteger)data;
-(void)setViewControllers:(NSArray<__kindof UIViewController *> * _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END LZTabBarController
@end

#endif /* JOBS_HEADER_GUARD_LZTABBARCONTROLLER_51B5F2F465 */
