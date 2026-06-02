//
//  UIView+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/23.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_10BE9FA0CA
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_10BE9FA0CA

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_10BE9FA0CA */
