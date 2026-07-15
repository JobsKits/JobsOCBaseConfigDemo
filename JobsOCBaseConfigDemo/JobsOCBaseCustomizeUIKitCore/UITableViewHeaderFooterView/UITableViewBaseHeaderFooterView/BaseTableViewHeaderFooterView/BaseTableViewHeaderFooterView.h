//
//  BaseTableViewHeaderFooterView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASETABLEVIEWHEADERFOOTERVIEW_6C859337D1
#define JOBS_HEADER_GUARD_BASETABLEVIEWHEADERFOOTERVIEW_6C859337D1

#import <UIKit/UIKit.h>
#import "JobsBaseProtocolHeader.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewHeaderFooterView : UITableViewHeaderFooterView
<
BaseViewProtocol,
UIViewModelProtocol
>

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
