//
//  JobsTBVHeaderFooterView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTBVHEADERFOOTERVIEW_DB213F63FB
#define JOBS_HEADER_GUARD_JOBSTBVHEADERFOOTERVIEW_DB213F63FB

#import <UIKit/UIKit.h>
#import <JobsBaseUI/BaseTableViewHeaderFooterView.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsTBVHeaderFooterView : BaseTableViewHeaderFooterView

@end

NS_ASSUME_NONNULL_END
/**
 
     /// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
     /// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
     - (nullable __kindof UIView *)tableView:(UITableView *)tableView
                      viewForHeaderInSection:(NSInteger)section{
         /// 什么不配置就是悬浮
         /// JobsHeaderFooterViewStyleNone 还是悬浮
         /// JobsHeaderViewStyle 不是悬浮
         return BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
             .byStyle(JobsHeaderViewStyle)/// 悬浮开关
             .bySection(section)/// 悬浮配置
             .JobsRichViewByModel2(nil)
             .JobsBlock1(^(id _Nullable data) {

             });
     }

     /// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
     /// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
     - (nullable __kindof UIView *)tableView:(UITableView *)tableView
                viewForFooterInSection:(NSInteger)section{
         /// 什么不配置就是悬浮
         /// JobsHeaderFooterViewStyleNone 还是悬浮
         /// JobsHeaderViewStyle 不是悬浮
         return BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
             .byStyle(JobsHeaderViewStyle)/// 悬浮开关
             .bySection(section)/// 悬浮配置
             .JobsRichViewByModel2(nil)
             .JobsBlock1(^(id _Nullable data) {

             });
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSTBVHEADERFOOTERVIEW_DB213F63FB */
