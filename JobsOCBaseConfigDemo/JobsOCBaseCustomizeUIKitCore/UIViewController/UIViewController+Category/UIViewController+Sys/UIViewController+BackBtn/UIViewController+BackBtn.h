//
//  UIViewController+BackBtn.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D0EE395176

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D0EE395176

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"
#import "UIButton+SimplyMake.h"
#import "UIButton+UI.h"
#import "BaseButton.h"
#import "NSObject+image.h"
#import "NSObject+Extra.h"
#import "UIBarButtonItem+Extra.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsLoadingImageHeader.h"
#import "JobsBaseUI.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BackBtn)<BaseViewControllerProtocol>

#pragma mark —— BaseVC+BackBtn
Prop_strong()BaseButton *backBtnCategory;
Prop_strong()UIBarButtonItem *backBtnCategoryItem;
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)backBtnClickEvent;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D0EE395176 */
