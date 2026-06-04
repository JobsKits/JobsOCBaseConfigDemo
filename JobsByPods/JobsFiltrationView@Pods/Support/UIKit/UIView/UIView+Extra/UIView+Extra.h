//
//  UIView+Extra.h
//  JobsFiltrationView
//
//  Created by Jobs on 2026年5月23日，星期六.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_6A5C9E490E
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_6A5C9E490E

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;

-(JobsRetViewByViewBlock _Nonnull)addSubview;
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
-(jobsByVoidBlock _Nonnull)refresh;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_6A5C9E490E */
