//
//  NSObject+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_1731CE2E33
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_1731CE2E33

#import <Foundation/Foundation.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
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

@interface NSObject (Extra)
/// 万能解析
+(JobsRetIDByIDBlock _Nonnull)byData;
/// 打印请求体
-(JobsReturnURLRequestByURLSessionTaskBlock _Nullable)printURLSessionRequestMessage;
/// 打印URLRequest
-(JobsReturnMutableURLRequestByURLRequestBlock _Nullable)printRequestMessage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_1731CE2E33 */
