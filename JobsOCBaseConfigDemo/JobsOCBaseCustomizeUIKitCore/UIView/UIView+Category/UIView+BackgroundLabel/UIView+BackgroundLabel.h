//
//  UIView+BackgroundLabel.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_BACKGROUNDLABEL_717580BB3B
#define JOBS_HEADER_GUARD_UIVIEW_BACKGROUNDLABEL_717580BB3B

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIView+Extra.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BackgroundLabel)

Prop_strong()UILabel *backgroundLabel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_BACKGROUNDLABEL_717580BB3B */
