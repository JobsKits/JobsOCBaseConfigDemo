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
#import "UITableView+RegisterClass.h"
#import "UITableViewHeaderFooterView+Attribute.h"
#import "JobsBaseProtocolHeader.h"
#import "JobsModelDSL.h"
#import "JobsClass.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewHeaderFooterView (BaseTableViewHeaderFooterViewProtocol)<BaseViewProtocol,BaseTableViewProtocol>

-(JobsRetTableViewHeaderFooterViewByNSIntegerBlock _Nonnull)byHeaderFooterViewStyle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_BASETABLEVIEWHEADERFOOTERVIEWPROTOCOL_B4D79E077B */
