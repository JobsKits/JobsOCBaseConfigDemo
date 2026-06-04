//
//  UIView+Refresh.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_REFRESH_714EC5D697
#define JOBS_HEADER_GUARD_UIVIEW_REFRESH_714EC5D697

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <GKCustomNavigationBarExtra/NSObject+Extra.h>
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<TABAnimated/TABAnimated.h>)
#import <TABAnimated/TABAnimated.h>
#else
#import "TABAnimated.h"
#endif

#if __has_include(<XZMRefresh/XZMRefresh.h>)
#import <XZMRefresh/XZMRefresh.h>
#else
#import "XZMRefresh.h"
#endif

#if __has_include(<MJRefreshExtra/MJRefreshExtra.h>)
#import <MJRefreshExtra/MJRefreshExtra.h>
#else
#import "MJRefreshExtra.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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
/// https://github.com/CoderMJLee/MJRefresh/issues/1495
@interface UIView (Refresh)
/// MJRefresh 作用于targetView
Prop_weak()UIScrollView *mjRefreshTargetView;
Prop_strong()MJRefreshConfigModel *refreshConfigHeader;//头部的配置信息
Prop_strong()MJRefreshConfigModel *refreshConfigFooter;//尾部的配置信息
#pragma mark —— MJRefreshHeader
Prop_strong()LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader;
Prop_strong()MJRefreshNormalHeader *mjRefreshNormalHeader;
Prop_strong()MJRefreshStateHeader *mjRefreshStateHeader;
Prop_strong()MJRefreshHeader *mjRefreshHeader;
Prop_strong()MJRefreshGifHeader *mjRefreshGifHeader;
#pragma mark —— MJRefreshFooter
Prop_strong()MJRefreshAutoGifFooter *mjRefreshAutoGifFooter;
Prop_strong()MJRefreshBackNormalFooter *mjRefreshBackNormalFooter;
Prop_strong()MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter;
Prop_strong()MJRefreshAutoStateFooter *mjRefreshAutoStateFooter;
Prop_strong()MJRefreshAutoFooter *mjRefreshAutoFooter;
Prop_strong()MJRefreshBackGifFooter *mjRefreshBackGifFooter;
Prop_strong()MJRefreshBackStateFooter *mjRefreshBackStateFooter;
Prop_strong()MJRefreshBackFooter *mjRefreshBackFooter;
Prop_strong()MJRefreshFooter *mjRefreshFooter;
#pragma mark —— 配置刷新文案
-(jobsByRefreshConfigModelBlock _Nonnull)handleWord;
#pragma mark —— UI刷新（调用系统底层方法）
-(jobsByVoidBlock _Nonnull)refresh;
#pragma mark —— 创建不同类型的MJHeader 和 MJFootor
/// Header
-(JobsReturnLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock _Nonnull)LOTAnimationMJRefreshHeaderBy;
-(JobsReturnMJRefreshNormalHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshNormalHeaderBy;
-(JobsReturnMJRefreshStateHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshStateHeaderBy;
-(JobsReturnMJRefreshHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshHeaderBy;
-(JobsReturnMJRefreshGifHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshGifHeaderBy;
/// Footer
-(JobsReturnMJRefreshAutoGifFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoGifFooterBy;
-(JobsReturnMJRefreshBackNormalFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackNormalFooterBy;
-(JobsReturnMJRefreshAutoNormalFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoNormalFooterBy;
-(JobsReturnMJRefreshAutoStateFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoStateFooterBy;
-(JobsReturnMJRefreshAutoFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoFooterBy;
-(JobsReturnMJRefreshBackGifFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackGifFooterBy;
-(JobsReturnMJRefreshBackStateFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackStateFooterBy;
-(JobsReturnMJRefreshBackFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackFooterBy;
-(JobsReturnMJRefreshFooterByRefreshConfigModelBlock _Nonnull)MJRefreshFooterBy;
#pragma mark —— 关于 XZMRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalHeader;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalHeader;
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifHeader;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifHeader;
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalFooter;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalFooter;
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifFooter;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifFooter;
#pragma mark —— 关于 MJRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_header;
-(jobsByVoidBlock _Nonnull)mj_endRefreshing_header;
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_footer;
-(jobsByVoidBlock _Nonnull)mj_endRefreshing_footer;
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_trailer;
-(jobsByVoidBlock _Nonnull)mj_endRefreshing_trailer;
/// 停止刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByBOOLBlock _Nonnull)endRefreshing;
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByBOOLBlock _Nonnull)endRefreshingWithNoMoreData;
/// 停止MJHeader的刷新
-(jobsByVoidBlock _Nonnull)endMJHeaderRefreshing;
/// 停止MJFooter的刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByVoidBlock _Nonnull)endMJFooterRefreshingWithNoMoreData;
/// 停止MJFooter刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByVoidBlock _Nonnull)endMJFooterRefreshingWithMoreData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_REFRESH_714EC5D697 */
