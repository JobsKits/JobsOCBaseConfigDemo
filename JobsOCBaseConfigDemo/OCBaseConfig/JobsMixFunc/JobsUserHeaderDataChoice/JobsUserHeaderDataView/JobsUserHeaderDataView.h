//
//  JobsUserHeaderDataView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEW_E03CB522DF
#define JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEW_E03CB522DF

#import <UIKit/UIKit.h>
#import "JobsUserHeaderDataViewTBVCell.h"
#import "JobsUserHeaderDataViewForHeaderInSection.h"

#import "JobsByOCPods.h"

#import "JobsBaseUI.h"

#import "JobsMakes.h"

#import "JobsLanMgr.h"

#import "TFPopupExtra.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

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
         };return _userHeaderDataView;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEW_E03CB522DF */
