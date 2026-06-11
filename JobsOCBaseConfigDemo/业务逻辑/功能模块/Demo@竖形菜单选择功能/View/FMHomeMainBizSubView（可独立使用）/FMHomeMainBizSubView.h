//
//  FMHomeMainBizSubView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "ThreeClassCell.h"
#import "FMGameCVCell.h"
#import "JobsBtnStyleTBVCell.h"
#import "LeftCell.h"

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

@interface FMHomeMainBizSubView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
,UICollectionViewDelegate
,UICollectionViewDataSource
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMHomeMainBizSubView *_Nonnull jobsMakeBizSubView(jobsByBizSubViewBlock _Nonnull block){
    FMHomeMainBizSubView *data = FMHomeMainBizSubView.alloc.init;
    if (block) block(data);
    return data;
}

/**
 
     Prop_strong()NSMutableArray <FMHomeMainBizSubView *>*subViewMutArr;

     FMHomeMainBizSubView *subView = self.subViewMutArr[indexPath.item];
     self.bringSubviewToFront(subView);

     -(NSMutableArray<FMHomeMainBizSubView *> *)subViewMutArr{
         if(!_subViewMutArr){
             @jobs_weakify(self)
             _subViewMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <FMHomeMainBizSubView *>* _Nullable arr) {
                 @jobs_strongify(self)
                 for (UIButtonModel *buttonModel in self.dataMutArr) {
                     arr.add(jobsMakeBizSubView(^(__kindof FMHomeMainBizSubView * _Nullable subView) {
                         @jobs_strongify(self)
                         subView.jobsRichViewByModel(nil);
                         subView.byAddTo(self, ^(MASConstraintMaker *make) {
                             make.size.mas_equalTo(FMHomeMainBizSubView.viewSizeByModel(nil));
                             make.centerX.equalTo(self);
                             make.top.equalTo(self.collectionView.mas_bottom);
                         });
                     }));
                 }
             });
         };return _subViewMutArr;
     }
*/
