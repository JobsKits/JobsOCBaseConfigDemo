//
//  JobsImageViewStyleCVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSIMAGEVIEWSTYLECVCELL_189161F4C0
#define JOBS_HEADER_GUARD_JOBSIMAGEVIEWSTYLECVCELL_189161F4C0

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "JobsBaseCollectionViewCell.h"

#import "JobsMakes.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 只在BaseCollectionViewCell完整的盖一个ImageView
@interface JobsImageViewStyleCVCell : JobsBaseCollectionViewCell

#pragma mark —— 一些公有方法
-(UIImageView *)getImageView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSIMAGEVIEWSTYLECVCELL_189161F4C0 */
