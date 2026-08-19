//
//  JobsSwiftParityControlEventsDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityDemoBaseVC.h"

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

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsSwiftParityControlEventsDemoVC : JobsSwiftParityDemoBaseVC

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsSwiftParityControlEventsDemoVC
-(JobsRetJobsSwiftParityControlEventsDemoVCByNSUIntegerBlock _Nonnull)byControlEventCount;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsSwiftParityControlEventsDemoVC
@end

NS_ASSUME_NONNULL_END
