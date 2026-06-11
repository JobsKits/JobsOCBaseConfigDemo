//
//  JobsSearchShowHotwordsTBVCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBaseTableViewCell.h"
#import "UITableViewCell+Margin.h"
#import "JobsHotLabelByMultiLine.h"

#if __has_include(<JobsOCProtocols/BaseCellProtocol.h>)
#import <JobsOCProtocols/BaseCellProtocol.h>
#else
#import "BaseCellProtocol.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchShowHotwordsTBVCell : JobsBaseTableViewCell
<
BaseCellProtocol
,UIViewModelProtocol
>

@end

NS_ASSUME_NONNULL_END
