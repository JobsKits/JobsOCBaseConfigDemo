//
//  JobsCustomTabBar.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCUSTOMTABBAR_D8DA3441E2
#define JOBS_HEADER_GUARD_JOBSCUSTOMTABBAR_D8DA3441E2

#import <UIKit/UIKit.h>
#import "JobsCustomTabBarConfig.h"
#import "JobsByOCPods.h"
#import "JobsBaseUI.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomTabBar : BaseView

-(jobsByVoidBlock _Nonnull)setup;
-(jobsByViewBlock _Nonnull)configMasonryBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCustomTabBar *_Nonnull jobsMakeCustomTabBar(jobsByCustomTabBarBlock _Nonnull block){
    JobsCustomTabBar *data = JobsCustomTabBar.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSCUSTOMTABBAR_D8DA3441E2 */
