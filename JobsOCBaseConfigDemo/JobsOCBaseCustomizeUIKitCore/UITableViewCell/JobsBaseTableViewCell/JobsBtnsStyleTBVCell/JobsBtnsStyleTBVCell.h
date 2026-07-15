//
//  JobsBtnsStyleTBVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBTNSSTYLETBVCELL_E5F06F1E2A
#define JOBS_HEADER_GUARD_JOBSBTNSSTYLETBVCELL_E5F06F1E2A

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "JobsBaseTableViewCell.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
@class BaseButton;
/// 左右两边各有一个UIButton
@interface JobsBtnsStyleTBVCell : JobsBaseTableViewCell

-(BaseButton *)leftBtn;
-(BaseButton *)rightBtn;
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBTNSSTYLETBVCELL_E5F06F1E2A */
