//
//  NSString+Debug.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_DEBUG_712B6E7BA5
#define JOBS_HEADER_GUARD_NSSTRING_DEBUG_712B6E7BA5

#import <Foundation/Foundation.h>
#import "NSString+Extra.h"
#import "NSString+Check.h"
#import "JobsLanMgr.h"

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
#endif /* JOBS_HEADER_GUARD_NSSTRING_DEBUG_712B6E7BA5 */
