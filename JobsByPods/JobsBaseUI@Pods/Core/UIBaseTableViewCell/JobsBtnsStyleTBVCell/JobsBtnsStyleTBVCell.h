//
//  JobsBtnsStyleTBVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBTNSSTYLETBVCELL_E5F06F1E2A
#define JOBS_HEADER_GUARD_JOBSBTNSSTYLETBVCELL_E5F06F1E2A

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/JobsBaseTableViewCell.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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
