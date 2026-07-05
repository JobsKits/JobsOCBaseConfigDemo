//
//  UIView+Navigator.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_NAVIGATOR_0FF340781B
#define JOBS_HEADER_GUARD_UIVIEW_NAVIGATOR_0FF340781B

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIView+Extra.h"

#import "JobsOCDSL.h"

#import "JobsViewNavigatorHeader.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Navigator)

Prop_strong()JobsViewNavigator *navigator;
#pragma mark —— 汇总方法
/// 推页面
-(jobsByViewBlock _Nonnull)pushTo;
/// 退回到上一个页面
-(jobsByBOOLBlock _Nonnull)popViewAnimated;
/// 退回到根页面
-(jobsByBOOLBlock _Nonnull)popToRootViewAnimated;
#pragma mark —— 配置
-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview;
-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview_;
-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview;
-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview_;
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView;
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView_;

@end

NS_ASSUME_NONNULL_END
/**
 
 @jobs_weakify(self)
 [self getTutorialItemByTutorialID:self.tutorialModelArr[indexPath.item].ID
                      successBlock:^(JobsResponseModel * _Nullable responseModel) {
     @jobs_strongify(self)
     self.datas = FMAboutUsSubModel.byData(responseModel.data);
     self.pushBy(NO);
     self.pushTo(self.subView.JobsRichViewByModel2(jobsMakeTextModel(^(__kindof UITextModel * _Nullable data) {
         @jobs_strongify(self)
         data.byText(self.datas[0].tabName)
             .bySubText(self.datas[0].content);
     })).JobsBlock1(^(id _Nullable data){
         @jobs_strongify(self)
         NSNumber *d = data;
         self.pushBy(d.boolValue);
     }));
 }];
 
 */
#endif /* JOBS_HEADER_GUARD_UIVIEW_NAVIGATOR_0FF340781B */
