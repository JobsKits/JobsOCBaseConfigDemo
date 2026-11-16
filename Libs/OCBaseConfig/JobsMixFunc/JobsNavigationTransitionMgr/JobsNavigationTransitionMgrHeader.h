//
//  JobsNavigationTransitionMgrHeader.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#ifndef JobsNavigationTransitionMgrHeader_h
#define JobsNavigationTransitionMgrHeader_h

#import "JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.h"

// 旧工程聚合可能已载入同名历史类声明；维护版编译成员在此完整公开链式接口。
@interface JobsNavigationTransitionMgr (JobsIntegratedDSLDeclaration)

-(JobsRetNavigationTransitionMgrByVCBlock _Nonnull)byViewController;
-(JobsRetNavigationTransitionMgrByDirectionBlock _Nonnull)byDirection;
-(JobsRetNavigationTransitionMgrByInteractiveTransitionBlock _Nonnull)byInteractiveTransition;
-(JobsRetNavigationTransitionMgrByComingStyleBlock _Nonnull)byComingStyle;

@end

#endif /* JobsNavigationTransitionMgrHeader_h */
