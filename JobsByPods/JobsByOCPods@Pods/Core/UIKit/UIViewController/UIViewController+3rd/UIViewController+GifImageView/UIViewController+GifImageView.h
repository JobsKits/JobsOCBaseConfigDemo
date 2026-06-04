//
//  UIViewController+GifImageView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GIFIMAGEVIEW_9842C8EE9C
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GIFIMAGEVIEW_9842C8EE9C

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSString+Path.h>
#import <JobsByOCPods/JobsString.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
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

@interface UIViewController (GifImageView)

#pragma mark —— BaseVC+GifImageView
Prop_strong()UIImageView *gifImageView;
Prop_copy()NSString *path;
Prop_strong()NSData *data;
Prop_strong()UIImage *image;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GIFIMAGEVIEW_9842C8EE9C */
