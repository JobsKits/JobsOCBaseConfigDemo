//
//  JobsLabelScrollController.h
//  JobsOCUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "JobsCoreTextScrollLayer.h"

#if __has_include(<JobsOCUILabelScrolling/JobsLabelScrollConfiguration.h>)
#import <JobsOCUILabelScrolling/JobsLabelScrollConfiguration.h>
#else
#import "JobsLabelScrollConfiguration.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsLabelScrollController : NSObject

Prop_assign(readonly,getter=isRunning)BOOL running;

-(instancetype)initWithLabel:(UILabel *)label NS_DESIGNATED_INITIALIZER;
-(void)configure:(JobsLabelScrollConfiguration *)configuration;
-(void)start;
-(void)pause;
-(void)resume;
-(void)reload;
-(void)stop;

@end

NS_ASSUME_NONNULL_END
