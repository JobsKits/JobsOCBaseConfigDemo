//
//  JobsSwiftParityOpenDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityDemoBaseVC.h"

#if __has_include(<JobsOCOpen/JobsOCOpen.h>)
#import <JobsOCOpen/JobsOCOpen.h>
#else
#import "JobsOCOpen.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsSwiftParityOpenDemoVC : JobsSwiftParityDemoBaseVC

@end

NS_ASSUME_NONNULL_END
