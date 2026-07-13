//
//  UINavigationController+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_DSL_8E975AC5D1
#define JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_DSL_8E975AC5D1

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (DSL)

-(JobsRetNavCtrByDelegateBlock _Nonnull)byDelegate;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_DSL_8E975AC5D1 */
