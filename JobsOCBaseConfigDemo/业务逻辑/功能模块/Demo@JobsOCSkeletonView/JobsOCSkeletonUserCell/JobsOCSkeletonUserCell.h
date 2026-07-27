//
//  JobsOCSkeletonUserCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#import "JobsOCSkeletonUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSkeletonUserCell : UITableViewCell

+(NSString *)reuseIdentifier;
-(void)configureWithUser:(JobsOCSkeletonUser *)user;
-(void)showSkeletonWithConfig:(JobsOCSkeletonConfig *)config;
-(void)hideSkeleton;

@end

NS_ASSUME_NONNULL_END
