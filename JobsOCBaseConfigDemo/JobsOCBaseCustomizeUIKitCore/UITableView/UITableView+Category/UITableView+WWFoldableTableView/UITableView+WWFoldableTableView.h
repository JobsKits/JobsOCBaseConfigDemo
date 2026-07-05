//
//  UITableView+WWFoldableTableView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEW_WWFOLDABLETABLEVIEW_0801BA88C8
#define JOBS_HEADER_GUARD_UITABLEVIEW_WWFOLDABLETABLEVIEW_0801BA88C8

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

@interface UITableView (WWFoldableTableView)
/// 设为YES，让tableView具备折叠功能
Prop_assign()BOOL ww_foldable;
/// 链式设置 UITableView 折叠能力
-(JobsRetTableViewByBOOLBlock _Nonnull)byFoldable;
/// 返回某个section的折叠状态。YES - 折叠中
-(BOOL)ww_isSectionFolded:(NSInteger)section;
/// 设置指定section的折叠状态。
-(void)ww_foldSection:(NSInteger)section fold:(BOOL)fold;

@end

@interface NSObject (WWExtension)

+(void)ww_swizzInstanceMethod:(SEL)methodOrig withMethod:(SEL)methodNew;
+(void)ww_swizzClassMethod:(SEL)methodOrig withMethod:(SEL)methodNew;

@end
/**
 *  使用方法：
 *  _tableView.byFoldable(YES);//设置可折叠
 *  点击UITableViewHeaderFooterView子类触发： [self.tableView ww_foldSection:section fold:![self.tableView ww_isSectionFolded:section]];//设置可折叠
 */
#endif /* JOBS_HEADER_GUARD_UITABLEVIEW_WWFOLDABLETABLEVIEW_0801BA88C8 */
