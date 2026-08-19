//
//  NSMutableDictionary+Extra.h
//  YTKNetworkExtra
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_FE9486D57A
#define JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_FE9486D57A

#import <Foundation/Foundation.h>
#import <YTKNetworkExtra/NSString+Extra.h>

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

@interface NSMutableDictionary (Extra)

-(JobsRetMutableDicByDicBlock _Nonnull)addByDic;
/// 打印的结果可以直接用于Postman
-(JobsRetStrByVoidBlock _Nonnull)jsonString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_FE9486D57A */
