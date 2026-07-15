//
//  JobsPullListAutoSizeView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSPULLLISTAUTOSIZEVIEW_1A9C50AD77
#define JOBS_HEADER_GUARD_JOBSPULLLISTAUTOSIZEVIEW_1A9C50AD77

#import <UIKit/UIKit.h>
#import "JobsPullListTBVCell.h"
#import "JobsModelDSL.h"
#import "JobsByOCPods.h"
#import "JobsBaseUI.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsPullListAutoSizeView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

Prop_assign()CGFloat listTbVWidth;
Prop_assign()CGFloat listTbVCellHeight;
Prop_assign()CGFloat listTbVOffset;
Prop_strong()UIColor *bgColorListTBV;

+(instancetype)initWithTargetView:(UIView *__nonnull)targetView
                       dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSPULLLISTAUTOSIZEVIEW_1A9C50AD77 */
