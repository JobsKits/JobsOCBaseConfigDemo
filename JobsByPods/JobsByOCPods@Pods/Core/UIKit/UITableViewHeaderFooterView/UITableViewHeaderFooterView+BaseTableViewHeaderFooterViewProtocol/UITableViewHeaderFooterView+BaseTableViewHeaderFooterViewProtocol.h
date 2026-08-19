//
//  UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_BASETABLEVIEWHEADERFOOTERVIEWPROTOCOL_B4D79E077B
#define JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_BASETABLEVIEWHEADERFOOTERVIEWPROTOCOL_B4D79E077B

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/UITableView+RegisterClass.h>
#import <JobsByOCPods/UITableViewHeaderFooterView+Attribute.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsClass/JobsClass.h>)
#import <JobsClass/JobsClass.h>
#else
#import "JobsClass.h"
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

@interface UITableViewHeaderFooterView (BaseTableViewHeaderFooterViewProtocol)<BaseViewProtocol,BaseTableViewProtocol>

-(JobsRetTableViewHeaderFooterViewByNSIntegerBlock _Nonnull)byHeaderFooterViewStyle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_BASETABLEVIEWHEADERFOOTERVIEWPROTOCOL_B4D79E077B */
