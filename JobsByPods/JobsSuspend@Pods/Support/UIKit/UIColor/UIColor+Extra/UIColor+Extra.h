//
//  UIColor+Extra.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLOR_EXTRA_C6F3DC81D2
#define JOBS_HEADER_GUARD_UICOLOR_EXTRA_C6F3DC81D2

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extra)

+(JobsRetCorByStrBlock _Nonnull)jobsCor;
+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsRetCorByCGFloatBlock _Nonnull)colorWithAlphaComponentBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLOR_EXTRA_C6F3DC81D2 */
