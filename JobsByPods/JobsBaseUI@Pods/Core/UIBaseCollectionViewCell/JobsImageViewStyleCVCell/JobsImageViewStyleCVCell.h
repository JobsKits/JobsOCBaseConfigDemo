//
//  JobsImageViewStyleCVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSIMAGEVIEWSTYLECVCELL_189161F4C0
#define JOBS_HEADER_GUARD_JOBSIMAGEVIEWSTYLECVCELL_189161F4C0

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/JobsBaseCollectionViewCell.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 只在BaseCollectionViewCell完整的盖一个ImageView
@interface JobsImageViewStyleCVCell : JobsBaseCollectionViewCell

#pragma mark —— 一些公有方法
-(JobsRetImageViewByVoidBlock _Nonnull)getImageView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSIMAGEVIEWSTYLECVCELL_189161F4C0 */
