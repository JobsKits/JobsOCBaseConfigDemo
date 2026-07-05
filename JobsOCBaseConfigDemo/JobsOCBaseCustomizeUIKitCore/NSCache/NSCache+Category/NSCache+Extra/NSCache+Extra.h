//
//  NSCache+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSCACHE_EXTRA_4838186F7C
#define JOBS_HEADER_GUARD_NSCACHE_EXTRA_4838186F7C

#import <Foundation/Foundation.h>
#import "NSString+Path.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSCache (Extra)
/// 计算单个目录缓存文件大小
+(CGFloat)calcFolderSizeAtPath:(NSString *)path;
/// 计算全部缓存文件大小
+(CGFloat)calcCacheSize;
/// 根据路径删除文件
+(void)cleanCacheByPath:(NSString *)path;
/// 清除全部缓存
+(void)cleanAllCaches;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSCACHE_EXTRA_4838186F7C */
