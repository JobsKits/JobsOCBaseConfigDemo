//
//  JobsSearchVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/10/2.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UIViewController+BaseNavigationBar.h"
#import "JobsSearchConfig.h"
#import "JobsSearchBar.h"
#import "JobsSearchTableViewHeaderView.h"
#import "JobsSearchShowHistoryDataTBVCell.h"
#import "JobsSearchShowHotwordsTBVCell.h"
#import "UITableView+WWFoldableTableView.h"
#import "JobsSearchTBVCell.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchVC : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

Prop_assign()BOOL isOpenLetterCase;//模糊查询时，是否开启输入字母大小写检测？默认开启

@end

NS_ASSUME_NONNULL_END
