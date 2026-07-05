//
//  UITabBarController+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABBARCONTROLLER_EXTRA_FA118238DD
#define JOBS_HEADER_GUARD_UITABBARCONTROLLER_EXTRA_FA118238DD

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (Extra)

-(jobsByCGFloatBlock _Nonnull)resetSubVCViewHeightBy;
-(jobsByVoidBlock _Nonnull)resetSubVCViewHeight;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABBARCONTROLLER_EXTRA_FA118238DD */
