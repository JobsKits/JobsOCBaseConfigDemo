//
//  JobsOCSkeletonUserCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

#import "JobsOCSkeletonUser.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCSkeletonView/JobsOCSkeletonView.h>)
#import <JobsOCSkeletonView/JobsOCSkeletonView.h>
#else
#import "JobsOCSkeletonView.h"
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

@interface JobsOCSkeletonUserCell : UITableViewCell

+(JobsRetStrByVoidBlock _Nonnull)reuseIdentifier;
-(jobsByJobsOCSkeletonUserBlock _Nonnull)configureWithUser;
-(jobsByJobsOCSkeletonConfigBlock _Nonnull)showSkeletonWithConfig;
-(jobsByVoidBlock _Nonnull)hideSkeleton;

@end

NS_ASSUME_NONNULL_END
