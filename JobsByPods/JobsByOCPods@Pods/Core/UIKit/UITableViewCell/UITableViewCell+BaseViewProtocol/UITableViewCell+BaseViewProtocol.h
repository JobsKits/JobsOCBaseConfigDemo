//
//  UITableViewCell+BaseViewProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWCELL_BASEVIEWPROTOCOL_DE4193E9FE
#define JOBS_HEADER_GUARD_UITABLEVIEWCELL_BASEVIEWPROTOCOL_DE4193E9FE

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

@interface UITableViewCell (BaseViewProtocol)<BaseViewProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWCELL_BASEVIEWPROTOCOL_DE4193E9FE */
