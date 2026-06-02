//
//  NSURLRequest+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_612BEC7F2D
#define JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_612BEC7F2D

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (Extra)

+(JobsRetURLRequestByURLBlock _Nonnull)initBy;
/// 打印NSURLRequest有效内容，并转化为NSMutableURLRequest对外输出
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURLREQUEST_EXTRA_612BEC7F2D */
