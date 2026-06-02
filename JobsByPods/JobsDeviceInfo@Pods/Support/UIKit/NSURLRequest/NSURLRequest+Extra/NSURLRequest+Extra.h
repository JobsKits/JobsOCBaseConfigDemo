//
//  NSURLRequest+Extra.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_21FC4A8CF6
#define JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_21FC4A8CF6

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (Extra)

+(JobsRetURLRequestByURLBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_21FC4A8CF6 */
