//
//  UIView+BackgroundLabel.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_BACKGROUNDLABEL_717580BB3B
#define JOBS_HEADER_GUARD_UIVIEW_BACKGROUNDLABEL_717580BB3B

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <JobsByOCPods/UIView+Extra.h>

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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BackgroundLabel)

Prop_strong()UILabel *backgroundLabel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_BACKGROUNDLABEL_717580BB3B */
