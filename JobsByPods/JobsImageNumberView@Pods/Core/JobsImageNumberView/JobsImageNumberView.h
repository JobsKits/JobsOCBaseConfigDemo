//
//  JobsImageNumberView.h
//  JobsImageNumberView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSIMAGENUMBERVIEW_FE5D1FFA33
#define JOBS_HEADER_GUARD_JOBSIMAGENUMBERVIEW_FE5D1FFA33

#import <UIKit/UIKit.h>
#import <JobsImageNumberView/JobsImageNumberViewCVCell.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface JobsImageNumberView : BaseView
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END

/**
 
     【137 宽度包含5个数组一个小数点，一个数字差不多22.5宽】

     // Data
     Prop_strong()NSMutableArray <UIImage *>*dataMutArr;

     // Data -> View
     UIViewModel *viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {});
     viewModel.byText(@"123.99");
     self.dataMutArr = [self translateToArr:viewModel.text.floatValue
                          saveBitAfterPoint:2];
     self.imageNumberView.jobsRichViewByModel(self.dataMutArr);
 */
#endif /* JOBS_HEADER_GUARD_JOBSIMAGENUMBERVIEW_FE5D1FFA33 */
