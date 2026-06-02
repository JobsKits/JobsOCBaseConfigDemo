//
//  JobsBaseCollectionViewCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASECOLLECTIONVIEWCELL_25ADAE6E6D
#define JOBS_HEADER_GUARD_JOBSBASECOLLECTIONVIEWCELL_25ADAE6E6D

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsBaseCollectionViewCell : UICollectionViewCell
<
UICollectionViewCellProtocol,
AppToolsProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBASECOLLECTIONVIEWCELL_25ADAE6E6D */
