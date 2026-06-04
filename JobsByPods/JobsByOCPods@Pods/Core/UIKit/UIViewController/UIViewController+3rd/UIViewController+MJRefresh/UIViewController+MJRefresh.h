//
//  UIViewController+MJRefresh.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_MJREFRESH_368B0C562A
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_MJREFRESH_368B0C562A

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSObject+Extra.h>

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

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<MJRefreshExtra/MJRefreshExtra.h>)
#import <MJRefreshExtra/MJRefreshExtra.h>
#else
#import "MJRefreshExtra.h"
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

@interface UIViewController (MJRefresh)
#pragma mark —— 配置信息
Prop_strong()MJRefreshConfigModel *refreshConfigHeader;/// 头部的配置信息
Prop_strong()MJRefreshConfigModel *refreshConfigFooter;/// 尾部的配置信息
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

@end

NS_ASSUME_NONNULL_END
/**
    进页面的时候必须先走下拉刷新。当数据源有值的时候，tableview的content会被撑开，mj_footer会监视这个content，也可以理解为数据源
    数据源是否有值，是决定mj_footer 是否存在的先决条件
 */
/**

    {
        MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
        refreshConfigHeader.stateIdleTitle = @"下拉刷新".tr;
        refreshConfigHeader.pullingTitle = @"下拉刷新".tr;
        refreshConfigHeader.refreshingTitle = @"立即释放刷新".tr;
        refreshConfigHeader.willRefreshTitle = @"刷新数据".tr;
        refreshConfigHeader.noMoreDataTitle = @"下拉刷新".tr;
        refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
            return nil;
        };

        MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
        refreshConfigFooter.stateIdleTitle = @"".tr;
        refreshConfigFooter.pullingTitle = @"".tr;
        refreshConfigFooter.refreshingTitle = @"".tr;
        refreshConfigFooter.willRefreshTitle = @"".tr;
        refreshConfigFooter.noMoreDataTitle = @"".tr;

        self.lotAnimMJRefreshHeader.refreshConfigModel = refreshConfigHeader;
        self.refreshConfigFooter = refreshConfigFooter;//数据赋值

        _tableView.mj_header = self.lotAnimMJRefreshHeader;
        _tableView.mj_footer = self.mjRefreshAutoNormalFooter;
        self.view.mjRefreshTargetView = _tableView;
    }
*/
/**

     {
         MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
         refreshConfigHeader.stateIdleTitle = @"下拉刷新".tr;
         refreshConfigHeader.pullingTitle = @"下拉刷新".tr;
         refreshConfigHeader.refreshingTitle = @"立即释放刷新".tr;
         refreshConfigHeader.willRefreshTitle = @"刷新数据".tr;
         refreshConfigHeader.noMoreDataTitle = @"下拉刷新".tr;
         refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
             return nil;
         };
         self.refreshConfigHeader = mJRefreshConfigModel;//数据赋值

         _tableView.mj_header = self.mjRefreshNormalHeader;
         _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
         self.view.mjRefreshTargetView = _tableView;
     }
 */
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_MJREFRESH_368B0C562A */
