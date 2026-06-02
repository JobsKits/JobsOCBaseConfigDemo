//
//  NSString+FilteringSpecialCharacters.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_FILTERINGSPECIALCHARACTERS_D4739973B3
#define JOBS_HEADER_GUARD_NSSTRING_FILTERINGSPECIALCHARACTERS_D4739973B3

#import <Foundation/Foundation.h>
#import <JobsByOCPods/NSMutableArray+Extra.h>
#import <JobsByOCPods/NSString+Replace.h>


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
/// 参考文献：https://www.jianshu.com/p/de17fd495935
NS_ASSUME_NONNULL_BEGIN
/// 过滤特殊字符
@interface NSString (FilteringSpecialCharacters)
/// 外界灵活选择的特殊符号拼接成一个包含所有被选中特殊符号的字符串
-(JobsRetStrByArrBlock _Nonnull)specialSymbolsActionBy;
/// 给定一个字符串，通过给定的过滤策略，过滤以后的字符串
-(JobsRetStrByArrBlock _Nonnull)filteredBy;
/// 是否包含特殊字符【包含返回YES、不包含返回NO】
-(JobsRetBOOLByArrBlock _Nonnull)isContainsSpecialSymbolsString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_FILTERINGSPECIALCHARACTERS_D4739973B3 */
