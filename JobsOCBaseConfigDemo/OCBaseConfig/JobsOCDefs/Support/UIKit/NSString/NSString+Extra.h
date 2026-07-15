//
//  NSString+Extra.h
//  JobsOCTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_7F384EC9C9
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_7F384EC9C9

#pragma once

#import <Foundation/Foundation.h>
#import "JobsStringUtilsHeader.h"
#import "WHToastExtra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extra)
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;

-(jobsByVoidBlock _Nonnull)toast;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_7F384EC9C9 */
