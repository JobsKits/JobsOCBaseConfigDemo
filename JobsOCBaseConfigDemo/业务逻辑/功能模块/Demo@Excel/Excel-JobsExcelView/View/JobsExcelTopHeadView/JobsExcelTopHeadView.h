//
//  JobsExcelTopHeadView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsTopViewItem.h"
#import "JobsExcelConfigureViewModel.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

@interface JobsExcelTopHeadView : UIView
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
BaseViewProtocol
>

@property(nonatomic,strong,nonnull,readonly)JobsExcelConfigureViewModel *excelConfigureData;

@end

NS_INLINE __kindof JobsExcelTopHeadView *_Nonnull jobsMakeExcelTopHeadView(jobsByExcelTopHeadViewBlock _Nonnull block){
    JobsExcelTopHeadView *data = JobsExcelTopHeadView.alloc.init;
    if (block) block(data);
    return data;
}
