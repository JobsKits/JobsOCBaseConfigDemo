//
//  UITableViewCell+WhiteArrows.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWCELL_WHITEARROWS_D0C3DB44B3
#define JOBS_HEADER_GUARD_UITABLEVIEWCELL_WHITEARROWS_D0C3DB44B3

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSObject+image.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
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
/// 自定义右侧小箭头图标
@interface UITableViewCell (WhiteArrows)

Prop_strong()UIImage *img;
Prop_assign()CGSize arrows_size;
/// 必须 self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; 打开后才可以启用
-(jobsByjobsByIDBlockBlock _Nonnull)customAccessoryView;

@end

NS_ASSUME_NONNULL_END

/**

     实现以下方法
    - (void)tableView:(UITableView *)tableView
      willDisplayCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath {
        cell.img = @"删除".img;
        @jobs_weakify(self)
        [cell customAccessoryView:^(id data) {
            @jobs_strongify(self)
            UITableViewCell *cell = (UITableViewCell *)data;
            JobsLog(@"MMM - %@",cell);
        }];
    }
*/

/**
 
     【需求说明】UITableView里面3个cell，accessoryView用button替代，要求最后一个cell的button.img = @"向右的箭头（小）".img，其他cell的button.img = @"红色的对勾".img;

     1、❤️因为UITableView的复用机制，这里不能直接用UITableView.selected来进行标注，必须用到model来selected其进行标注❤️
     - (void)tableView:(UITableView *)tableView
     didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
         /// 模型全部归0 + 点选的模型为1
         [tableView didSelectRowAtIndexPath:indexPath tableViewCellClass:JobsBaseTableViewCell.class];
         [tableView reloadData];
     }
     2、在这个协议里面打开 cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     - (__kindof UITableViewCell *)tableView:(UITableView *)tableView
     cellForRowAtIndexPath:(NSIndexPath *)indexPath{
         JobsBaseTableViewCell *cell = JobsBaseTableViewCell.cellStyleValue1ByTableView(tableView);
         cell.detailTextLabelOffsetX = JobsWidth(-165);/// 这里需要设置一个偏移量去抵消有一个莫名出现的偏移量
         cell.JobsRichViewByModel2(self.dataMutArr[indexPath.row]);
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
         return cell;
     }
     3、
        3.1、需要用到一张空白图；
        3.2、对固定死的行值需要单独进行说明
     - (void)tableView:(UITableView *)tableView
       willDisplayCell:(UITableViewCell *)cell
     forRowAtIndexPath:(NSIndexPath *)indexPath{
         UIViewModel *viewModel = self.dataMutArr[indexPath.row];
         if (viewModel.jobsSelected) {
             cell.size = CGSizeMake(JobsWidth(18), JobsWidth(12.86));
             cell.img = @"红色的对勾".img;
         }else{
             cell.size = CGSizeMake(JobsWidth(10), JobsWidth(18.3));//缺省值
             cell.img = @"空白图".img;
         }

         if (indexPath.row == 2) {
             cell.size = CGSizeMake(JobsWidth(10), JobsWidth(18.3));//缺省值
             cell.img = @"向右的箭头（小）".img;
         }

         @jobs_weakify(self)
         [cell customAccessoryView:^(id data) {
             @jobs_strongify(self)
         }];
     }
 */
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWCELL_WHITEARROWS_D0C3DB44B3 */
