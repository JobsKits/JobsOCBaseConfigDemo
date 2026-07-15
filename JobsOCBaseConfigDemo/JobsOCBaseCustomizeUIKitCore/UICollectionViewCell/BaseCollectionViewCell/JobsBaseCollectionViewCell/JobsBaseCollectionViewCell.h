//
//  JobsBaseCollectionViewCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASECOLLECTIONVIEWCELL_25ADAE6E6D
#define JOBS_HEADER_GUARD_JOBSBASECOLLECTIONVIEWCELL_25ADAE6E6D

#import <UIKit/UIKit.h>
#import "JobsBaseProtocolHeader.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsBaseCollectionViewCell : UICollectionViewCell
<
UICollectionViewCellProtocol,
AppToolsProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBASECOLLECTIONVIEWCELL_25ADAE6E6D */
