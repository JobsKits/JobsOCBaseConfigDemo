//
//  NSString+Extra.h
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_99B5B5A7BB
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_99B5B5A7BB

#pragma once

#import <Foundation/Foundation.h>
#import <JobsRichTextUtils/UIColor+Extra.h>

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
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

@interface NSString (Extra)

-(UIColor *)cor;
-(JobsRetCorByVoidBlock _Nonnull)jobsCor;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_99B5B5A7BB */
