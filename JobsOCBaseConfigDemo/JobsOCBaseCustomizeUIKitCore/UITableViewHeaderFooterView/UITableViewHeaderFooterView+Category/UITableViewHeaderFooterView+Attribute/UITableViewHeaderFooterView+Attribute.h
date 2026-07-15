//
//  UITableViewHeaderFooterView+Attribute.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_ATTRIBUTE_9A14B71FC9
#define JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_ATTRIBUTE_9A14B71FC9

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

/// 资料来源：https://github.com/Zydhjx/HeaderDemo
/// 在基类覆写- (void)setFrame:(CGRect)frame方法。比如基类：BaseTableViewHeaderFooterView
@interface UITableViewHeaderFooterView (Attribute)

Prop_weak()UITableView *tbv;
Prop_assign()NSUInteger section;

@end
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_ATTRIBUTE_9A14B71FC9 */
