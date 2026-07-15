//
//  JobsBtnsStyleCVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBTNSSTYLECVCELL_7A5F912884
#define JOBS_HEADER_GUARD_JOBSBTNSSTYLECVCELL_7A5F912884

#import <UIKit/UIKit.h>
#import "JobsBaseCollectionViewCell.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsModelDSL.h"
#import "JobsOCDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

@class BaseButton;

NS_ASSUME_NONNULL_BEGIN
/// 左右两边各有一个UIButton
@interface JobsBtnsStyleCVCell : JobsBaseCollectionViewCell

-(BaseButton *)leftBtn;
-(BaseButton *)rightBtn;
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBTNSSTYLECVCELL_7A5F912884 */
