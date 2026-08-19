//
//  UITableViewCell+UITableViewCellProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWCELL_UITABLEVIEWCELLPROTOCOL_E4B241FA67

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#define JOBS_HEADER_GUARD_UITABLEVIEWCELL_UITABLEVIEWCELLPROTOCOL_E4B241FA67

#import <UIKit/UIKit.h>
#import "CALayer+Extra.h"
#import "UITableView+Extra.h"
#import "UIView+BackgroundImage.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsMakes.h"
#import "JobsOCDSL.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (UITableViewCellProtocol)<UITableViewCellProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWCELL_UITABLEVIEWCELLPROTOCOL_E4B241FA67 */
