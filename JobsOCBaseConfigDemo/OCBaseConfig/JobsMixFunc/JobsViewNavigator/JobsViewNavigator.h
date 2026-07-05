//
//  JobsViewNavigator.h
//  JobsViewNavigator
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSVIEWNAVIGATOR_37C12A6C3D
#define JOBS_HEADER_GUARD_JOBSVIEWNAVIGATOR_37C12A6C3D

#import <UIKit/UIKit.h>

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsViewNavigator : UIView

-(JobsRetViewNavigatorByViewAndAnimatedBlock _Nonnull)pushView;
-(JobsRetViewNavigatorByBOOLBlock _Nonnull)popViewAnimated;
-(JobsRetViewNavigatorByBOOLBlock _Nonnull)popToRootViewAnimated;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsViewNavigator *_Nonnull jobsMakeViewNavigator(jobsByViewNavigatorBlock _Nonnull block){
    JobsViewNavigator *data = JobsViewNavigator.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSVIEWNAVIGATOR_37C12A6C3D */
