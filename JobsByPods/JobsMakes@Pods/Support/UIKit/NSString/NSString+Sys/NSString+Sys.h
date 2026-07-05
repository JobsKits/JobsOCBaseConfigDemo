//
//  NSString+Sys.h
//  JobsMakes
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_SYS_JOBSMAKES_20260702
#define JOBS_HEADER_GUARD_NSSTRING_SYS_JOBSMAKES_20260702

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JobsMakesSys)
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_SYS_JOBSMAKES_20260702 */
