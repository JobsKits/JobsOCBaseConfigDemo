//
//  JobsNavSettingVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNAVSETTINGVC_DB04AAF4C7
#define JOBS_HEADER_GUARD_JOBSNAVSETTINGVC_DB04AAF4C7

#import <UIKit/UIKit.h>
#import "JobsMonitorVC.h"

#import "JobsOCDSL.h"

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#import "JobsAppToolsHeader.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavSettingVC : JobsMonitorVC<UIGestureRecognizerDelegate>

-(jobsByCGFloatBlock _Nonnull)makeNavByAlpha;
-(jobsByCGFloatBlock _Nonnull)makeJobsNavByAlpha;
-(jobsByNavBarConfigBlock _Nonnull)makeNavByConfig;
-(jobsByNavBarConfigBlock _Nonnull)makeGKNavByConfig;

@end

NS_ASSUME_NONNULL_END
/**

    要想隐藏系统的导航栏，这里有2个手段。一个是在UIViewController的基类，一个是在UIViewController的分类
    1、如果要在viewDidLoad实现隐藏系统的导航栏，则调用UIViewController基类的父类方法self.setupNavigationBarHidden = YES;
    2、如果要在viewWillAppear实现隐藏系统的导航栏，则调用UIViewController分类的方法self.isHiddenNavigationBar = YES;//禁用系统的导航栏
 */
/**
 
     self.makeNavByConfig(jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable config) {
         config.viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
             viewModel.byAlpha(1)
                      .byNavBgCor(JobsClearColor)
                      .byNavBgImage(@"".img)
                      .byTitleImage(@"BLuckyRedLogo".img); /// 配置中间的标题为图片
         });
         /// 配置返回键
         config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
    //            @jobs_strongify(self)
             buttonModel.byNormalImage(@"全局返回箭头".img)
                        .byHighlightImage(@"全局返回箭头".img)
                        .byTitle(@"".tr)
                        .byTitleFont(bayonRegular(18))
                        .byTitleCor(@"#8A93A1".cor)
                        .byImagePlacement(NSDirectionalRectEdgeLeading)
                        .byTextAlignment(NSTextAlignmentCenter)
                        .bySubTextAlignment(NSTextAlignmentCenter)
                        .byBaseBackgroundColor(JobsClearColor)
                        .byImagePadding(JobsWidth(5));
             buttonModel.clickEventBlock = ^id(__kindof UIButton *_Nullable x){
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 JobsAppTool.loginWork = FMLoginWork_MyFav;
     //            self.backTo(0);
                 self.backViewControllerCore(self);
                 return nil;
             };
             buttonModel.longPressGestureEventBlock = ^id(__kindof UIButton *_Nullable btn){
                 // @jobs_strongify(self)
                 return nil;
             };
         }));
     }));
 */
#endif /* JOBS_HEADER_GUARD_JOBSNAVSETTINGVC_DB04AAF4C7 */
