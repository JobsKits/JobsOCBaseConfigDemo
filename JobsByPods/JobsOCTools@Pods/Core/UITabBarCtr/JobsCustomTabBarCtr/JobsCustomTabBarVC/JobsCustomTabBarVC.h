//
//  JobsCustomTabBarVC.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCUSTOMTABBARVC_834F3BE2B4
#define JOBS_HEADER_GUARD_JOBSCUSTOMTABBARVC_834F3BE2B4

#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsCustomTabBar.h>
#import <JobsOCTools/JobsCustomTabBarConfig.h>

//#import "NSObject+AppTools.h"

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

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
