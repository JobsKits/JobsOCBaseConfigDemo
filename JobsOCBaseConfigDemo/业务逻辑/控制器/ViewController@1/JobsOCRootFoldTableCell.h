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

#if __has_include(<JobsImageRotation/JobsImageRotation.h>)
#import <JobsImageRotation/JobsImageRotation.h>
#else
#import "JobsImageRotation.h"
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

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>)
#import <JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>
#else
#import "JobsOCUILabelScrolling.h"
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

+(JobsRetCGFloatByVoidBlock _Nonnull)collapsedHeight;
+(JobsRetCGFloatByVoidBlock _Nonnull)innerRowHeight;
-(JobsRetJobsOCRootFoldTableCellByStrBlock _Nonnull)bySectionDescription;
+(CGFloat)expandedHeightByItemCount:(NSUInteger)itemCount
                 sectionDescription:(NSString *_Nullable)sectionDescription
                    innerTableWidth:(CGFloat)innerTableWidth;
-(void)configureWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                        expanded:(BOOL)expanded
                     selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                         pinBlock:(jobsByNSIntegerBlock _Nullable)pinBlock;
-(void)configurePinnedWithSectionModel:(JobsOCDemoSectionModel *)sectionModel
                           selectBlock:(jobsByNSIntegerBlock _Nullable)selectBlock
                            unpinBlock:(jobsByNSIntegerBlock _Nullable)unpinBlock;
-(void)setExpanded:(BOOL)expanded
          animated:(BOOL)animated;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCRootFoldTableCell
-(JobsRetJobsOCRootFoldTableCellByBOOLBlock _Nonnull)byPinnedSectionStyle;
-(JobsRetJobsOCRootFoldTableCellByJobsTimerBlock _Nonnull)byChargingProgressTimer;
-(JobsRetJobsOCRootFoldTableCellByNSArrayUIViewModelBlock _Nonnull)byItems;
-(JobsRetJobsOCRootFoldTableCellByNSIntegerBlock _Nonnull)byChargingProgressPhase;
-(JobsRetJobsOCRootFoldTableCellByNSIntegerBlock _Nonnull)byPinAccessoryIndex;
-(JobsRetJobsOCRootFoldTableCellByjobsByNSIntegerBlockBlock _Nonnull)byPinBlock;
-(JobsRetJobsOCRootFoldTableCellByjobsByNSIntegerBlockBlock _Nonnull)bySelectBlock;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCRootFoldTableCell
@end

NS_ASSUME_NONNULL_END
