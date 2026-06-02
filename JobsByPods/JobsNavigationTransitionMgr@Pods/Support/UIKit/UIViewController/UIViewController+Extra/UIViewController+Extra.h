//
//  UIViewController+Extra.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EXTRA_25FE648865
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EXTRA_25FE648865

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<FDFullscreenPopGesture/FDFullscreenPopGesture.h>)
#import <FDFullscreenPopGesture/FDFullscreenPopGesture.h>
#else
#import "FDFullscreenPopGesture.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

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

@interface UIViewController (Extra)<BaseViewControllerProtocol>

-(void)make:(MASConstraintMaker *)make topOffset:(CGFloat)topOffset;

-(JobsRetVCByVCBlock _Nonnull)addChildViewController;
/// 将自身用导航控制器进行包裹（如果自身就是导航控制器就什么也不做的返回）
-(UINavigationController *_Nonnull)navCtrl;
/// 关闭系统自带的右滑关闭手势
-(jobsByVoidBlock _Nonnull)clzPopGesture;
/// 打开系统自带的右滑关闭手势
-(jobsByIDBlock _Nonnull)openPopGestureBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_EXTRA_25FE648865 */
