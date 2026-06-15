//
//  NSURLRequest+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_0710B21977
#define JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_0710B21977

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (JobsBaseUIExtra)

+(JobsRetURLRequestByURLBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_0710B21977 */
