//
//  NSCache+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSCACHE_EXTRA_4838186F7C
#define JOBS_HEADER_GUARD_NSCACHE_EXTRA_4838186F7C

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsByOCPods/NSString+Path.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSCache (Extra)
/// 计算单个目录缓存文件大小
+(JobsRetCGFloatByNSStringBlock _Nonnull)calcFolderSizeAtPath;
/// 计算全部缓存文件大小
+(JobsRetCGFloatByVoidBlock _Nonnull)calcCacheSize;
/// 根据路径删除文件
+(jobsByStrBlock _Nonnull)cleanCacheByPath;
/// 清除全部缓存
+(jobsByVoidBlock _Nonnull)cleanAllCaches;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSCACHE_EXTRA_4838186F7C */
