//
//  JobsExcelLeftListView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "TableViewOneCell.h"
#import "JobsExcelConfigureViewModel.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@class UIButtonModel;

@interface JobsExcelLeftListView : UIView
<
UITableViewDelegate
,UITableViewDataSource
,BaseViewProtocol
>

@property(nonatomic,strong,nonnull,readonly)JobsExcelConfigureViewModel *excelConfigureData;

@end

NS_INLINE __kindof JobsExcelLeftListView *_Nonnull jobsMakeExcelLeftListView(jobsByExcelLeftListViewBlock _Nonnull block){
    JobsExcelLeftListView *data = JobsExcelLeftListView.alloc.init;
    if (block) block(data);
    return data;
}
