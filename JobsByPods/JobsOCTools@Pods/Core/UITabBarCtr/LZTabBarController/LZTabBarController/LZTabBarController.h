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
@interface LZTabBarController : UITabBarController<LZTabBarDelegate>
/// 是否可用自动旋转屏幕
Prop_assign()BOOL isAutoRotation;
/// 创建tabBarController
+(instancetype _Nonnull)createTabBarController:(tabBarBlock _Nullable)block;
/// 获取当前的tabBarController实例, 实例创建后可通过此方法获取当前实例
+(instancetype _Nonnull)defaultTabBarController;
/// 隐藏底部tabBar的方法
-(void)hiddenTabBarWithAnimation:(BOOL)isAnimation;
/// 显示底部tabBar的方法
-(void)showTabBarWithAnimation:(BOOL)isAnimation;
/// 切换
-(jobsByNSUIntegerBlock _Nonnull)customSelectIndex;

@end

#endif /* JOBS_HEADER_GUARD_LZTABBARCONTROLLER_51B5F2F465 */
