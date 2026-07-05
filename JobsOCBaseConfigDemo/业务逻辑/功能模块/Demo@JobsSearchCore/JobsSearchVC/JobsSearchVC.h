//
//  JobsSearchVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsSearchConfig.h"
#import "JobsSearchBar.h"
#import "JobsSearchTBVCell.h"
#import "JobsSearchTableViewHeaderView.h"
#import "JobsSearchShowHistoryDataTBVCell.h" // 搜索历史
#import "JobsSearchShowHotwordsTBVCell.h"    // 热门搜索

#import "JobsLoadingImageHeader.h"

#import "JobsMakes.h"

#import "JobsBaseUI.h"

#import "JobsLanMgr.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchVC : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

Prop_assign()BOOL isOpenLetterCase;//模糊查询时，是否开启输入字母大小写检测？默认开启

@end

NS_ASSUME_NONNULL_END
