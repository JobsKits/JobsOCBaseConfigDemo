//
//  JobsShareView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 10/16/23.
//

#import "BaseView.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "MSMineView6CVCell.h"
#import "JobsDefineProperty.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsShareView : BaseView
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsShareView
-(JobsRetJobsShareViewByCGSizeBlock _Nonnull)bySizer;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsShareView
@end

NS_ASSUME_NONNULL_END
