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

#import "JobsBaseProtocolHeader.h"

#import "JobsAppToolsHeader.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavigationTransitionMgr : NSObject
<
UINavigationControllerDelegate
,UIGestureRecognizerDelegate
,UIViewControllerAnimatedTransitioning
,AppToolsProtocol
,BaseProtocol
>

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
