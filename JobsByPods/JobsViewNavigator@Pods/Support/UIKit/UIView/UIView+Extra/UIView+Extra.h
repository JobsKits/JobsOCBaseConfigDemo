//
//  UIView+Extra.h
//  JobsViewNavigator
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_9A27F1352F
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_9A27F1352F

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)

Prop_copy(nullable)jobsByMASConstraintMakerBlock masonryBlock;

-(jobsByVoidBlock _Nonnull)refresh;
-(JobsRetViewByViewBlock _Nonnull)addSubview;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_9A27F1352F */
