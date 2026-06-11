//
//  UITableViewCell+UITableViewCellProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWCELL_UITABLEVIEWCELLPROTOCOL_E4B241FA67
#define JOBS_HEADER_GUARD_UITABLEVIEWCELL_UITABLEVIEWCELLPROTOCOL_E4B241FA67

#import <UIKit/UIKit.h>
#import <JobsByOCPods/CALayer+Extra.h>
#import <JobsByOCPods/UITableView+Extra.h>
#import <JobsByOCPods/UIView+BackgroundImage.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (UITableViewCellProtocol)<UITableViewCellProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWCELL_UITABLEVIEWCELLPROTOCOL_E4B241FA67 */
