//
//  JobsTextViewStyleTBVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTEXTVIEWSTYLETBVCELL_1CAC990851
#define JOBS_HEADER_GUARD_JOBSTEXTVIEWSTYLETBVCELL_1CAC990851

#import "JobsTextView.h"
#import "UIView+Extra.h"
#import "JobsBaseTableViewCell.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsOCDSL.h"
#import "JobsModelDSL.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 将一个TextView整个覆盖到TableViewCell上面
@interface JobsTextViewStyleTBVCell : JobsBaseTableViewCell<UITextViewDelegate>
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTEXTVIEWSTYLETBVCELL_1CAC990851 */
