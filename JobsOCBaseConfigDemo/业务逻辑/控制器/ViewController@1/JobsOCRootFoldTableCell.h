//
//  JobsOCRootFoldTableCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <UIKit/UIKit.h>
#import "JobsOCDemoSectionModel.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

FOUNDATION_EXPORT NSString *const JobsOCRootFoldTableCellReuseIdentifier;

@interface JobsOCRootFoldTableCell : UITableViewCell
<
UITableViewDataSource,
UITableViewDelegate
>

+(CGFloat)collapsedHeight;
+(CGFloat)innerRowHeight;
+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount;
+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount
                  sectionDescription:(NSString *_Nullable)sectionDescription;
-(void)configureWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                        expanded:(BOOL)expanded
                     selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                         pinBlock:(jobsByNSIntegerBlock _Nullable)pinBlock;
-(void)configurePinnedWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                           selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                            unpinBlock:(jobsByNSIntegerBlock _Nullable)unpinBlock;
-(void)setExpanded:(BOOL)expanded
          animated:(BOOL)animated;
-(void)updateChargingProgressByPhase:(NSInteger)phase;

@end

NS_ASSUME_NONNULL_END
