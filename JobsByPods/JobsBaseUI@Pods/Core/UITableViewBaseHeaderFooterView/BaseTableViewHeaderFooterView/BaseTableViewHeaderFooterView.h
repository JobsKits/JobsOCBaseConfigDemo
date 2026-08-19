//
//  BaseTableViewHeaderFooterView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASETABLEVIEWHEADERFOOTERVIEW_6C859337D1
#define JOBS_HEADER_GUARD_BASETABLEVIEWHEADERFOOTERVIEW_6C859337D1

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

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

@interface BaseTableViewHeaderFooterView : UITableViewHeaderFooterView
<
BaseViewProtocol,
UIViewModelProtocol
>

-(JobsRetBaseTableViewHeaderFooterViewByViewBlock _Nonnull)byBackgroundView;

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
#endif /* JOBS_HEADER_GUARD_BASETABLEVIEWHEADERFOOTERVIEW_6C859337D1 */
