//
//  JobsToggleBaseView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTOGGLEBASEVIEW_298E076974
#define JOBS_HEADER_GUARD_JOBSTOGGLEBASEVIEW_298E076974

#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsToggleNavViewProtocol.h>
#import <JobsOCTools/JobsToggleNavView.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsToggleBaseView : BaseView
<
UIScrollViewDelegate,
JobsToggleNavViewProtocol
>
/// UI
Prop_strong(readonly)JobsToggleNavView *taggedNavView;
Prop_strong(readonly)UIScrollView *bgScroll;
/// Data
Prop_assign()CGSize taggedNavSingleBtn_size;/// 单个导航按钮的尺寸【一般是统一样式】默认JobsWidth(80)、JobsWidth(44)
Prop_assign()CGFloat taggedNavView_height; /// 一整个导航栏的高度。默认JobsWidth(44)
Prop_assign()CGFloat taggedNavView_width; /// 一整个导航栏的宽度
Prop_assign()CGFloat taggedNavView_bgScroll_offset; /// 导航栏和可滑动子视图之间垂直方向上的距离
Prop_strong()UIColor *taggedNavViewBgColor; /// 导航栏的背景颜色
Prop_strong()NSMutableArray <__kindof UIView<BaseViewProtocol> *>*scrollContentViews;/// 可滑动的子视图的【唯一的】数据源
Prop_weak()__kindof UIButton *currentSelectedBtn;
/// 当前显示的View
-(jobsByNSIntegerBlock _Nonnull)switchViewsBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsToggleBaseView *_Nonnull jobsMakeToggleBaseView(jobsByToggleBaseViewBlock _Nonnull block){
    JobsToggleBaseView *data = JobsToggleBaseView.alloc.init;
    if (block) block(data);
    return data;
}

/**
 
     -(JobsToggleBaseView *)toggleBaseView{
         if(!_toggleBaseView){
             @jobs_weakify(self)
             _toggleBaseView = jobsMakeToggleBaseView(^(JobsToggleBaseView * _Nullable toggleBaseView) {
                 @jobs_strongify(self)
                 toggleBaseView.btn_each_offset = JobsWidth(0);
                 toggleBaseView.taggedNavView_width = JobsWidth(230);
                 toggleBaseView.taggedNavView_height = JobsWidth(24);
                 toggleBaseView.taggedNavViewBgColor = JobsClearColor.colorWithAlphaComponentBy(0);
                 toggleBaseView.bySize(CGSizeMake(JobsWidth(346), JobsWidth(216)));
                 toggleBaseView.jobsRichViewByModel(jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>*_Nullable data) {
                     data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                         @jobs_strongify(self)
                         data1.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
                         data1.titleFont = bayonRegular(JobsWidth(20));
                         data1.title = @"PHONE NO.".tr;
                         data1.jobsWidth = JobsWidth(90);
                         data1.titleCor = @"#8A93A1".cor;
                         data1.selectedTitleCor = @"#C90000".cor;
                         data1.roundingCorners = UIRectCornerAllCorners;
                         data1.view = FMLoginByPhoneView
                             .BySize(FMLoginByPhoneView.viewSizeByModel(nil))
                             .JobsRichViewByModel2(nil)
                             .JobsBlock1(^(id  _Nullable data) {

                             });/// 手机验证码登陆
                         data1.clickEventBlock = ^id _Nullable(__kindof UIButton *_Nullable x){
                             @jobs_strongify(self)
                             if(KindOfBaseButtonCls(x)){
                                 self.toggleBaseView.switchViewsBy(x.index);
                             }return nil;
                         };
                     }));
                     data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                         @jobs_strongify(self)
                         data1.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
                         data1.titleFont = bayonRegular(JobsWidth(20));
                         data1.title = @"ACCOUNT NAME".tr;
                         data1.jobsWidth = JobsWidth(130);
                         data1.titleCor = @"#8A93A1".cor;
                         data1.selectedTitleCor = @"#C90000".cor;
                         data1.roundingCorners = UIRectCornerAllCorners;
                         data1.view = FMLoginByUsrNameView
                             .BySize(FMLoginByUsrNameView.viewSizeByModel(nil))
                             .JobsRichViewByModel2(nil)
                             .JobsBlock1(^(id  _Nullable data) {

                             });/// 用户名密码
                         data1.clickEventBlock = ^id _Nullable(__kindof UIButton *_Nullable x){
                             @jobs_strongify(self)
                             if(KindOfBaseButtonCls(x)){
                                 self.toggleBaseView.switchViewsBy(x.index);
                             }return nil;
                         };
                     }));
                 }));
                 [self.view.addSubview(toggleBaseView) mas_makeConstraints:^(MASConstraintMaker *make) {
                     make.size.mas_equalTo(toggleBaseView.sizer);
                     make.top.equalTo(self.titleLab.mas_bottom);
                     make.centerX.equalTo(self.view);
                 }];self.view.refresh();
             });
         }return _toggleBaseView;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSTOGGLEBASEVIEW_298E076974 */
