//
//  JobsUserHeaderDataView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEW_E03CB522DF
#define JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEW_E03CB522DF

#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsUserHeaderDataViewTBVCell.h>
#import <JobsOCTools/JobsUserHeaderDataViewForHeaderInSection.h>

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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

#if __has_include(<TFPopupExtra/TFPopupExtra.h>)
#import <TFPopupExtra/TFPopupExtra.h>
#else
#import "TFPopupExtra.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserHeaderDataView : BaseView
<
BaseViewProtocol
,UITableViewDelegate
,UITableViewDataSource
>

-(__kindof JobsUserHeaderDataView *)makeImageByBlock:(jobsByIDBlock _Nullable)block
                                         finishBlock:(jobsByVoidBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
/**
 
     -(JobsUserHeaderDataView *)userHeaderDataView{
         if(!_userHeaderDataView){
             @jobs_weakify(self)
             _userHeaderDataView = [JobsUserHeaderDataView.new makeImageByBlock:^(UIImage *_Nullable image) {
                 @jobs_strongify(self)
                 self.currentBtn.jobsResetBtnBgImage(image);/// 永远值显示最后选择的图
             } finishBlock:^{
                 @jobs_strongify(self)
                 [self->_userHeaderDataView tf_hide:^{
                     @jobs_strongify(self)
                     self.popupParameter = nil;
                 }];
             }];
         }return _userHeaderDataView;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEW_E03CB522DF */
