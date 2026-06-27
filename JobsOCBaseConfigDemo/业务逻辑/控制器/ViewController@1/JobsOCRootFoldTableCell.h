//
//  JobsOCRootFoldTableCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <UIKit/UIKit.h>
#import "JobsOCDemoSectionModel.h"
#import "JobsMakes.h"
#import "JobsOCDSL.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const JobsOCRootFoldTableCellReuseIdentifier;

@interface JobsOCRootFoldTableCell : UITableViewCell
<
UITableViewDataSource,
UITableViewDelegate
>

+(CGFloat)collapsedHeight;
+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount;
-(void)configureWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                        expanded:(BOOL)expanded
                     selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock;
-(void)setExpanded:(BOOL)expanded
          animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
