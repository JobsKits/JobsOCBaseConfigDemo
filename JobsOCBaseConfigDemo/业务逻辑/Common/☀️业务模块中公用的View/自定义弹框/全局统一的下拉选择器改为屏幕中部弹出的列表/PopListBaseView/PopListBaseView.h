//
//  PopListBaseView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsTextLabStyleTBVCell.h"

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

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

@interface PopListBaseView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

-(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof PopListBaseView *_Nonnull jobsMakePopListBaseView(jobsByPopListBaseViewBlock _Nonnull block){
    PopListBaseView *data = PopListBaseView.alloc.init;
    if (block) block(data);
    return data;
}
/**
 
     Prop_strong()PopListBaseView *nationalPopListView;
     Prop_strong()NSMutableArray <__kindof UIViewModel *>*nationalPopList_dataMutArr;

     -(PopListBaseView *)nationalPopListView{
         if(!_nationalPopListView){
             _nationalPopListView = PopListBaseView.new;
             _nationalPopListView.size = _nationalPopListView.viewSizeByModel(nil);
             _nationalPopListView.jobsRichViewByModel(self.nationalPopList_dataMutArr);
         };return _nationalPopListView;
     }

     -(NSMutableArray<__kindof UIViewModel *> *)nationalPopList_dataMutArr{
         if(!_nationalPopList_dataMutArr){
             _nationalPopList_dataMutArr = NSMutableArray.array;
             /// 装载本地假数据
             NSDictionary *dic = @"Countries".readLocalFileWithName;
             NSMutableArray <JobsCountriesModel *>*tags = [JobsCountriesModel mj_objectArrayWithKeyValuesArray:dic];

             for (JobsCountriesModel *model in tags) {
                 UIViewModel *viewModel = UIViewModel.new;
                 viewModel.byText(model.chinese)
                          .byFont(UIFontWeightRegularSize(JobsWidth(16)))
                          .byTextCor(@"#5D5D5D".cor)
                          .bySelectedTextCor(JobsWhiteColor)
                          .byBgSelectedCor(@"#5D5D5D".cor)
                          .byBgCor(@"#1F1F1F".cor)
                          .byTextAlignment(NSTextAlignmentCenter);
                 _nationalPopList_dataMutArr.add(viewModel);

             }
         };return _nationalPopList_dataMutArr;
     }
 */
