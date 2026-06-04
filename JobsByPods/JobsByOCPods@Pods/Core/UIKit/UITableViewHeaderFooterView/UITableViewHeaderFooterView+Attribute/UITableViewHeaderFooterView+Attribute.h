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

/// 资料来源：https://github.com/Zydhjx/HeaderDemo
/// 在基类覆写- (void)setFrame:(CGRect)frame方法。比如基类：BaseTableViewHeaderFooterView
@interface UITableViewHeaderFooterView (Attribute)

Prop_weak()UITableView *tbv;
Prop_assign()NSUInteger section;

@end
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWHEADERFOOTERVIEW_ATTRIBUTE_9A14B71FC9 */
