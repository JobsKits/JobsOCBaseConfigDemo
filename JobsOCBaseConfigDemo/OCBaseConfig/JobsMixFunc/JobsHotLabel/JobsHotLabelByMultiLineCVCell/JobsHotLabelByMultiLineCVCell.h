//
//  JobsHotLabelByMultiLineCVCell.h
//  JobsHotLabel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSHOTLABELBYMULTILINECVCELL_F45C663B90
#define JOBS_HEADER_GUARD_JOBSHOTLABELBYMULTILINECVCELL_F45C663B90

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsByOCPods.h"

#import "JobsBaseUI.h"

#import "JobsModelDSL.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsHotLabelByMultiLineCVCell : JobsBaseCollectionViewCell
<
JobsDoorInputViewProtocol,
AppToolsProtocol,
BaseViewProtocol,
UICollectionViewCellProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSHOTLABELBYMULTILINECVCELL_F45C663B90 */
