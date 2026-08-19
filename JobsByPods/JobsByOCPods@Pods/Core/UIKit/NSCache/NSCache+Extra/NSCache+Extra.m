//
//  NSCache+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSCache+Extra.h"

@implementation NSCache (Extra)
/// 计算单个目录缓存文件大小
+(JobsRetCGFloatByNSStringBlock _Nonnull)calcFolderSizeAtPath{
    return ^CGFloat(NSString * path){
        // 利用NSFileManager实现对文件的管理
        NSFileManager *manager = NSFileManager.defaultManager;
        CGFloat size = 0;
        if ([manager fileExistsAtPath:path]) {
            // 获取该目录下的文件，计算其大小
            NSArray *childrenFile = [manager subpathsAtPath:path];
            for (NSString *fileName in childrenFile) {
                NSString *absolutePath = path.addPathComponent(fileName);
                size += [manager attributesOfItemAtPath:absolutePath
                                                  error:nil].fileSize;
            }
            // 将大小转化为M
            return size / 1024.0 / 1024.0;
        };return 0;
    };
}
/// 计算全部缓存文件大小
+(JobsRetCGFloatByVoidBlock _Nonnull)calcCacheSize{
    return ^CGFloat{
        CGFloat libraryDirSize = NSCache.calcFolderSizeAtPath(NSString.libraryDir());
        CGFloat tmpDirSize = NSCache.calcFolderSizeAtPath(NSString.tmpDir());
        return libraryDirSize + tmpDirSize;
    };
}
/// 根据路径删除文件
+(jobsByStrBlock _Nonnull)cleanCacheByPath{
    return ^(NSString * path){
        /// 利用NSFileManager实现对文件的管理
        NSFileManager *fileManager = NSFileManager.defaultManager;
        if ([fileManager fileExistsAtPath:path]) {
            /// 获取该路径下面的文件名
            NSArray *childrenFiles = [fileManager subpathsAtPath:path];
            for (NSString *fileName in childrenFiles) {
                /// 拼接路径
                NSString *absolutePath = path.addPathComponent(fileName);
                /// 将文件删除
                [fileManager removeItemAtPath:absolutePath
                                        error:nil];
            }
        }
    };
}
/// 清除全部缓存
+(jobsByVoidBlock _Nonnull)cleanAllCaches{
    return ^{
        NSCache.cleanCacheByPath(NSString.libraryDir());
        NSCache.cleanCacheByPath(NSString.tmpDir());
    };
}

@end
