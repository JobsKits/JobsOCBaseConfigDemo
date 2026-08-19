//
//  JobsNavigationTransitionMgr.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNAVIGATIONTRANSITIONMGR_DC5F7A97C2
#define JOBS_HEADER_GUARD_JOBSNAVIGATIONTRANSITIONMGR_DC5F7A97C2

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsAppTools/JobsAppToolsHeader.h>)
#import <JobsAppTools/JobsAppToolsHeader.h>
#else
#import "JobsAppToolsHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

@interface JobsNavigationTransitionMgr : NSObject
<
UINavigationControllerDelegate
,UIGestureRecognizerDelegate
,UIViewControllerAnimatedTransitioning
,AppToolsProtocol
,BaseProtocol
>

-(JobsRetNavigationTransitionMgrByVCBlock _Nonnull)byViewController;
-(JobsRetNavigationTransitionMgrByDirectionBlock _Nonnull)byDirection;
-(JobsRetNavigationTransitionMgrByInteractiveTransitionBlock _Nonnull)byInteractiveTransition;
-(JobsRetNavigationTransitionMgrByComingStyleBlock _Nonnull)byComingStyle;

+(void)setDirection:(JobsTransitionDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC;
/// 自定义 push/pop 控制器的手势方向
+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsTransitionDirection)direction;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavigationTransitionMgr *_Nonnull jobsMakeNavigationTransitionMgr(jobsByNavigationTransitionManagerBlock _Nonnull block){
    JobsNavigationTransitionMgr *data = JobsNavigationTransitionMgr.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSNAVIGATIONTRANSITIONMGR_DC5F7A97C2 */
