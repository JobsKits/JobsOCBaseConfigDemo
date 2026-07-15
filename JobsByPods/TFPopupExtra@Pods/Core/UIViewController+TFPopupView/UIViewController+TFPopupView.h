//
//  UIViewController+TFPopupView.h
//  TFPopupExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_TFPOPUPVIEW_D6286FCE92
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_TFPOPUPVIEW_D6286FCE92

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <TFPopupExtra/NSObject+TFPopup.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

/// 自定义视图

#if __has_include(<JobsCustomView/JobsCustomViewHeader.h>)
#import <JobsCustomView/JobsCustomViewHeader.h>
#else
#import "JobsCustomViewHeader.h"
#endif
/// 过滤

#if __has_include(<JobsFiltrationView/JobsFiltrationViewHeader.h>)
#import <JobsFiltrationView/JobsFiltrationViewHeader.h>
#else
#import "JobsFiltrationViewHeader.h"
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

@interface UIViewController (TFPopupView)

Prop_strong()JobsFiltrationView *filtrationView;// 过滤
Prop_strong()JobsCustomView *customView;// 自定义
/// 弹出筛选视图
-(__kindof UIView *)popUpFiltrationView;
/// 弹出自定义视图
-(__kindof UIView *)popUpCustomView;
/// 关闭弹出的视图
-(jobsByViewBlock _Nonnull)hidePopupView;

@end

NS_ASSUME_NONNULL_END
/**
 
     调用示例：

     Prop_strong()UIButton *filterBtn;
     Prop_strong()UIButton *customBtn;
     Prop_weak()UIView *popUpFiltrationView;
     Prop_weak()UIView *popUpCustomView;
     Prop_weak()NSNumber *currentIndex;
     Prop_weak()BaiShaETProjAlreadySettledSubBaseVC *vc;
     Prop_strong()NSMutableArray <__kindof UIViewController *>*childVCMutArr;

     -(NSMutableArray<UIViewController *> *)childVCMutArr{
         if (!_childVCMutArr) {
             _childVCMutArr = NSMutableArray.array;
             for (NSString *str in self.titleMutArr) {
                 [_childVCMutArr addObject:BaiShaETProjAlreadySettledSubBaseVC.new];
             }
         };return _childVCMutArr;
     }

     -(UIButton *)filterBtn{
         if (!_filterBtn) {
             _filterBtn = UIButton.jobsInit()
                 .jobsResetBtnTitle(@"篩選".tr)
                 .jobsResetBtnImage(@"向下的箭头".img)
                 .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
                 .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
                 .makeBtnTitleByShowingType(UILabelShowingType_03)
                 .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTrailing, JobsWidth(6))
                 .addOn(self.view)
                 .byAdd(^(MASConstraintMaker *make) {
                     make.right.equalTo(self.view);
                     make.top.bottom.equalTo(categoryView);
                 });

             BtnClickEvent(_filterBtn, {
                 x.byToggleSelected();
                 // @"篩選".tr.toast();
                 [x changeAction:x.jobs_isSelected];
                 self.currentIndex = [self->listContainerView valueForKey:@"currentIndex"];
                 JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",self.currentIndex.intValue);
                 self.vc = (BaiShaETProjAlreadySettledSubBaseVC *)self.childVCMutArr[self.currentIndex.intValue];
                 self.popUpFiltrationView = self.vc.popUpFiltrationView;
                 [self.vc hidePopupView:self.popUpCustomView];

                 if (x.jobs_isSelected) {
                     self.customBtn.bySelected(NO);
                     self.popUpFiltrationView.popupDelegate = self;
                 }else{
                     [self.vc hidePopupView:self.popUpFiltrationView];
                 }
             });
         };return _filterBtn;
     }

     -(UIButton *)customBtn{
         if (!_customBtn) {
             _customBtn = UIButton.jobsInit()
                 .jobsResetBtnTitle(@"自定义".tr)
                 .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
                 .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
                 .selectedStateTitleColorBy(HEXCOLOR(0xAE8330))
                 .addOn(self.view)
                 .byAdd(^(MASConstraintMaker *make) {
                     make.right.equalTo(self.filterBtn.mas_left).offset(JobsWidth(-8));
                     make.top.bottom.equalTo(categoryView);
                     make.left.equalTo(categoryView.mas_right);
                 });


             BtnClickEvent(_customBtn, {
                 x.byToggleSelected();
                 /// @"自定义".tr.toast();
                 self.currentIndex = [self->listContainerView valueForKey:@"currentIndex"];
                 JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",self.currentIndex.intValue);
                 self.vc = (BaiShaETProjAlreadySettledSubBaseVC *)self.childVCMutArr[self.currentIndex.intValue];

                 [self.vc hidePopupView:self.popUpFiltrationView];

                 [self.filterBtn changeAction:self.filterBtn.jobs_isSelected];

                 if (x.jobs_isSelected) {
                     self.filterBtn.bySelected(NO);
                     self.popUpCustomView = self.vc.popUpCustomView;
                     self.popUpCustomView.popupDelegate = self;
                 }else{
                     [self.vc hidePopupView:self.popUpCustomView];
                 }
             });
         };return _customBtn;
     }
 */
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_TFPOPUPVIEW_D6286FCE92 */
