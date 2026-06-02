//
//  JobsNavigationTransitionMgr.h
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import <Foundation/Foundation.h>
#import "UIViewController+Extra.h"
#import "JobsDefineAllEnumHeader.h"
#import "BaseProtocol.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavigationTransitionMgr : NSObject
<
UINavigationControllerDelegate
,UIGestureRecognizerDelegate
,UIViewControllerAnimatedTransitioning
,BaseProtocol
>

+(void)setDirection:(JobsDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC;
/// 自定义 push/pop 控制器的手势方向
+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsDirection)direction;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavigationTransitionMgr *_Nonnull jobsMakeNavigationTransitionMgr(jobsByNavigationTransitionManagerBlock _Nonnull block){
    JobsNavigationTransitionMgr *data = JobsNavigationTransitionMgr.alloc.init;
    if (block) block(data);
    return data;
}
