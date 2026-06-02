//
//  NSString+Debug.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_DEBUG_6D98256DEA
#define JOBS_HEADER_GUARD_NSSTRING_DEBUG_6D98256DEA

#import <Foundation/Foundation.h>
#import <JobsCustomView/NSString+Extra.h>
#import <JobsCustomView/NSString+Check.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#ifndef TextModelDataString
#define TextModelDataString 主标题文字默认占位内容.tr
#endif /* TextModelDataString */

#ifndef TextModelDataString2
#define TextModelDataString2 副标题文字默认占位内容.tr
#endif /* TextModelDataString2 */

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Debug)
/// 该文字是否是Debug定义的文字
-(BOOL)isDebugText;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_DEBUG_6D98256DEA */
