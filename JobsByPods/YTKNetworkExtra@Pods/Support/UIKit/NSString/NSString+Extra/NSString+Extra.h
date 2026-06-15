//
//  NSString+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_1BD1E0ABD0
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_1BD1E0ABD0

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YTKNetworkExtraExtra)
/// 对系统方法 initWithData.NSUTF8StringEncoding 的二次封装
+(JobsRetStrByDataBlock _Nonnull)initByUTF8Data;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_1BD1E0ABD0 */
