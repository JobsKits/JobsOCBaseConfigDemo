//
//  JobsCustomTabBar.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCUSTOMTABBAR_D8DA3441E2
#define JOBS_HEADER_GUARD_JOBSCUSTOMTABBAR_D8DA3441E2

#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsCustomTabBarConfig.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomTabBar : BaseView

-(jobsByVoidBlock _Nonnull)setup;
-(JobsRetCustomTabBarByViewBlock _Nonnull)configMasonryBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCustomTabBar *_Nonnull jobsMakeCustomTabBar(jobsByCustomTabBarBlock _Nonnull block){
    JobsCustomTabBar *data = JobsCustomTabBar.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSCUSTOMTABBAR_D8DA3441E2 */
