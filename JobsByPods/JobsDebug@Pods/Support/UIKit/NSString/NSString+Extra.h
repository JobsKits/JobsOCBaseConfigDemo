//
//  NSString+Extra.h
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_731F405106
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_731F405106

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extra)
/// 对系统方法 initWithData.NSUTF8StringEncoding 的二次封装
+(JobsRetStrByDataBlock _Nonnull)initByUTF8Data;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_731F405106 */
