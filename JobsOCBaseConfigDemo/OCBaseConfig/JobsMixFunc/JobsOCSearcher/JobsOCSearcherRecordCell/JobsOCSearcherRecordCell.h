//
//  JobsOCSearcherRecordCell.h
//  JobsOCSearcher
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCSEARCHRECORDCELL_8E8FBB74C7
#define JOBS_HEADER_GUARD_JOBSOCSEARCHRECORDCELL_8E8FBB74C7

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSearcherRecordCell : UITableViewCell

Prop_copy(nullable)jobsByStrBlock deleteBlock;

+(NSString *)reuseIdentifier;
-(void)updateWithText:(NSString *_Nullable)text;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCSEARCHRECORDCELL_8E8FBB74C7 */
