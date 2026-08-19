//
//  JobsOCCommentCell.h
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCCOMMENTCELL_00D9E9B278

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_JOBSOCCOMMENTCELL_00D9E9B278

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsOCComment/JobsOCCommentConfig.h>)
#import "JobsOCCommentConfig.h"
#else
#import "JobsOCCommentConfig.h"
#endif

#if __has_include(<JobsOCComment/JobsOCCommentModel.h>)
#import "JobsOCCommentModel.h"
#else
#import "JobsOCCommentModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCommentCell : UITableViewCell

+(JobsRetStrByVoidBlock _Nonnull)reuseIdentifier;
-(void)updateWithComment:(JobsOCCommentModel *)comment
                  config:(JobsOCCommentConfig *)config
                   depth:(NSInteger)depth
           parentComment:(JobsOCCommentModel *_Nullable)parentComment;
-(void)updateWithMoreText:(NSString *)moreText
                   config:(JobsOCCommentConfig *)config
                    depth:(NSInteger)depth;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCCOMMENTCELL_00D9E9B278 */
