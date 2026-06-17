//
//  NSString+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_F6DD880E05
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_F6DD880E05

#pragma once

#import <Foundation/Foundation.h>
#import "MacroDef_Strong@Weak.h"
#import "JobsDefineConstString.h"
#import "JobsBlock.h"

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extra)

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_F6DD880E05 */
