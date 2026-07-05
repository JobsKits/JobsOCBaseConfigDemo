//
//  JobsImageStyleTBVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSIMAGESTYLETBVCELL_83173262E7
#define JOBS_HEADER_GUARD_JOBSIMAGESTYLETBVCELL_83173262E7

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "JobsBaseTableViewCell.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

#import "JobsModelDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 将一张图整个覆盖到TableViewCell上面
@interface JobsImageStyleTBVCell : JobsBaseTableViewCell
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSIMAGESTYLETBVCELL_83173262E7 */
