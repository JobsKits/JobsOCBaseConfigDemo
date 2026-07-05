//
//  UIColor+Extra.h
//  JobsMakes
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLOR_EXTRA_BACF17B6DB
#define JOBS_HEADER_GUARD_UICOLOR_EXTRA_BACF17B6DB

#pragma once

#import <UIKit/UIKit.h>
#import <JobsMakes/NSString+Sys.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extra)
/// 十六进制字符串 => UIColor *
+(JobsRetCorByStrBlock _Nonnull)jobsCor;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLOR_EXTRA_BACF17B6DB */
