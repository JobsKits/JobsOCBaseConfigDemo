//
//  UIView+layout.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

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

@interface UIView (layout)

- (JobsRetCGFloatByVoidBlock _Nonnull)x_;
- (JobsRetCGFloatByVoidBlock _Nonnull)y_;
- (JobsRetCGFloatByVoidBlock _Nonnull)w_;
- (JobsRetCGFloatByVoidBlock _Nonnull)h_;

@end

