//
//  LZTabBarController.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LZTABBARCONTROLLER_51B5F2F465
#define JOBS_HEADER_GUARD_LZTABBARCONTROLLER_51B5F2F465

#import <UIKit/UIKit.h>
#import "LZTabBar.h"
#import "LZTabBarConfig.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

typedef LZTabBarConfig *_Nullable(^tabBarBlock)(LZTabBarConfig * _Nonnull config);
/// 底部tabBar自定义的tabBarController
/// 只需调用给出的类方法, 配置相关参数即可创建tabBarController实例对象
#import "JobsOCDSL.h"

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
