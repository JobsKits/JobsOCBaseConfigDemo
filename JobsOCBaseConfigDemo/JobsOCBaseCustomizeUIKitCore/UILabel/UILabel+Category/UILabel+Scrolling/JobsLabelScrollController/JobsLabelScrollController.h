//
//  JobsLabelScrollController.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import <QuartzCore/QuartzCore.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>
#import "JobsCoreTextScrollLayer.h"

#import "JobsLabelScrollConfiguration.h"
#import "JobsOCDSL.h"

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsLabelScrollController : NSObject

Prop_assign(readonly,getter=isRunning)BOOL running;

-(instancetype)initWithLabel:(UILabel *)label NS_DESIGNATED_INITIALIZER;
-(jobsByJobsLabelScrollConfigurationBlock _Nonnull)configure;
-(jobsByVoidBlock _Nonnull)start;
-(jobsByVoidBlock _Nonnull)pause;
-(jobsByVoidBlock _Nonnull)resume;
-(void)reload;
-(jobsByVoidBlock _Nonnull)jobsReload;
-(jobsByVoidBlock _Nonnull)jobsStop;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsLabelScrollController
-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byConcealed;
-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byNeedsRebuild;
-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byOverflowing;
-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)bySourceInitialized;
-(JobsRetJobsLabelScrollControllerByBOOLBlock _Nonnull)byStartRequested;
-(JobsRetJobsLabelScrollControllerByCFTimeIntervalBlock _Nonnull)byLastTimestamp;
-(JobsRetJobsLabelScrollControllerByCGFloatBlock _Nonnull)byOffsetX;
-(JobsRetJobsLabelScrollControllerByCGFloatBlock _Nonnull)byTravelDirection;
-(JobsRetJobsLabelScrollControllerByCGSizeBlock _Nonnull)byLastBoundsSize;
-(JobsRetJobsLabelScrollControllerByNSAttributedStringBlock _Nonnull)byConcealedAttributedText;
-(JobsRetJobsLabelScrollControllerByNSAttributedStringBlock _Nonnull)bySourceAttributedText;
-(JobsRetJobsLabelScrollControllerByNSStringBlock _Nonnull)bySourcePlainText;
-(JobsRetJobsLabelScrollControllerByNSTimeIntervalBlock _Nonnull)byDelayRemaining;
-(JobsRetJobsLabelScrollControllerByUIFontBlock _Nonnull)bySourceFont;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsLabelScrollController
@end

NS_ASSUME_NONNULL_END
