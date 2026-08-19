//
//  NSString+Debug.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_DEBUG_712B6E7BA5
#define JOBS_HEADER_GUARD_NSSTRING_DEBUG_712B6E7BA5

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsByOCPods/NSString+Extra.h>
#import <JobsByOCPods/NSString+Check.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#ifndef TextModelDataString
#define TextModelDataString 主标题文字默认占位内容.jobsTr()
#endif /* TextModelDataString */

#ifndef TextModelDataString2
#define TextModelDataString2 副标题文字默认占位内容.jobsTr()
#endif /* TextModelDataString2 */

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Debug)
/// 该文字是否是Debug定义的文字
-(JobsRetBOOLByVoidBlock _Nonnull)isDebugText;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_DEBUG_712B6E7BA5 */
