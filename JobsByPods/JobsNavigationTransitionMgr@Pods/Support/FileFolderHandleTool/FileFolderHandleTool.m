//
//  FileFolderHandleTool.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/26.
//

#import "FileFolderHandleTool.h"

@implementation FileFolderHandleTool
/// 判断文件路径是否存在:
+(JobsRetBOOLByStrBlock _Nonnull)isExistsAtPath{
    return ^BOOL((NSString * _Nullable path)){
        return [NSFileManager.defaultManager fileExistsAtPath:path];
    };
}

@end
