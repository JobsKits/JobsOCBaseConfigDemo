//
//  UILabel+DSL.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_DSL_44C5BD6AB7
#define JOBS_HEADER_GUARD_UILABEL_DSL_44C5BD6AB7

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (DSL)

-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_DSL_44C5BD6AB7 */
