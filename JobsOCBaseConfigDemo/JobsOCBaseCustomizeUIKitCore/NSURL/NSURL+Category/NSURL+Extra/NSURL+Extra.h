//
//  NSURL+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JOBS_HEADER_GUARD_NSURL_EXTRA_C7EC502FFB
#define JOBS_HEADER_GUARD_NSURL_EXTRA_C7EC502FFB

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "NSURLRequest+Extra.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Extra)
/// NSURL => NSURLRequest
-(NSMutableURLRequest *)URLRequest;
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURL_EXTRA_C7EC502FFB */
