//
//  JobsBaseTableViewCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASETABLEVIEWCELL_ADC74C78C6

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#define JOBS_HEADER_GUARD_JOBSBASETABLEVIEWCELL_ADC74C78C6

#import <UIKit/UIKit.h>
#import "JobsOCDSL.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

#define UITableViewCellTitleWidth JobsMainScreen_WIDTH() * 2 / 3
#define UITableViewCellSubTitleWidth JobsMainScreen_WIDTH() / 3

NS_ASSUME_NONNULL_BEGIN

@interface JobsBaseTableViewCell : UITableViewCell
<
UITableViewCellProtocol,
UIViewModelProtocol,
AppToolsProtocol
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsBaseTableViewCell
-(JobsRetJobsBaseTableViewCellByBOOLBlock _Nonnull)bySetTBVCellOffset;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsBaseTableViewCell
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBASETABLEVIEWCELL_ADC74C78C6 */
