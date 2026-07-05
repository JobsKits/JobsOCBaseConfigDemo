//
//  JobsCustomTabBarVC.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCUSTOMTABBARVC_834F3BE2B4
#define JOBS_HEADER_GUARD_JOBSCUSTOMTABBARVC_834F3BE2B4

#import <UIKit/UIKit.h>
#import "JobsCustomTabBar.h"
#import "JobsCustomTabBarConfig.h"

//#import "NSObject+AppTools.h"

#import "JobsBaseProtocolHeader.h"

#import "JobsByOCPods.h"

#import "JobsDefines.h"

#import "JobsBlock.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomTabBarVC : UITabBarController
<
UITabBarControllerDelegate
,BaseProtocol
>

-(jobsByNSUIntegerBlock _Nonnull)customSelectIndex;
-(JobsCustomTabBar *)customTabBar;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCustomTabBarVC *_Nonnull jobsMakeSharedManagerCustomTabBarVC(jobsByCustomTabBarVCBlock _Nonnull block){
    JobsCustomTabBarVC *data = JobsCustomTabBarVC.sharedManager;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JobsCustomTabBarVC *_Nonnull jobsMakeNormalCustomTabBarVC(jobsByCustomTabBarVCBlock _Nonnull block){
    JobsCustomTabBarVC *data = JobsCustomTabBarVC.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSCUSTOMTABBARVC_834F3BE2B4 */
