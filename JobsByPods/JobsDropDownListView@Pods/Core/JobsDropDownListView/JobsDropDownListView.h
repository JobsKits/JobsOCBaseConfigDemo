//
//  JobsDropDownListView.h
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSDROPDOWNLISTVIEW_52EDD9121F
#define JOBS_HEADER_GUARD_JOBSDROPDOWNLISTVIEW_52EDD9121F

#import <UIKit/UIKit.h>
#import <JobsDropDownListView/JobsDropDownListTBVCell.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
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

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

@interface JobsDropDownListView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

Prop_assign()JobsDropDownListViewDirection direction;

-(jobsByCtrlBlock _Nonnull)dropDownListViewDisappear;
-(instancetype)initWithTableViewClass:(Class <UITableViewCellProtocol>_Nonnull)tableViewClass;// 要链接自定义的cell用这个初始化方法
@end

NS_ASSUME_NONNULL_END
/**

     【用法与用量】
     -(BaseButton *)btn{
     if(!_btn){
         @jobs_weakify(self)
         _btn = BaseButton
             .initByStyle1(@"点击按钮弹出下拉列表".tr,UIFontWeightRegularSize(12),JobsWhiteColor)
             .bgColorBy(JobsWhiteColor)
             .cornerRadiusValueBy(JobsWidth(8))
             .onClickBy(^(UIButton *x){
                 if (self.objBlock) self.objBlock(x);
                 JobsLog(@"AAA = %@",self.dropDownListView);
                 x.selected = !x.selected;
                 if (x.selected) {
                     /// ❤️只能让它执行一次❤️
                     self.dropDownListView = [self motivateFromView:x
                                      jobsDropDownListViewDirection:self.dropDownListViewDirection
                                                               data:self.listViewData
                                                 motivateViewOffset:JobsWidth(5)
                                                        finishBlock:^(UIViewModel *data) {
                         JobsLog(@"data = %@",data);
                     }];
                 }else{
                     [self endDropDownListView];
                 }
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"按钮的长按事件触发");
             });
         [self.view addSubview:_btn];
         [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.center.equalTo(self.view);
    //            make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(25)));
             make.height.mas_equalTo(JobsWidth(30));
         }];
         _btn.makeBtnTitleByShowingType(UILabelShowingType_03);
     }return _btn;
    }
 */
#endif /* JOBS_HEADER_GUARD_JOBSDROPDOWNLISTVIEW_52EDD9121F */
