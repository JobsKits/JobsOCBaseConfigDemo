//
//  JobsSearchTBVCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#if __has_include(<JobsOCProtocols/BaseCellProtocol.h>)
#import <JobsOCProtocols/BaseCellProtocol.h>
#else
#import "BaseCellProtocol.h"
#endif
#import "JobsSearchConfig.h"
#import "JobsSearchDataCVCell.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchTBVCell : UITableViewCell
<
BaseCellProtocol
,UIViewModelProtocol
,UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END
