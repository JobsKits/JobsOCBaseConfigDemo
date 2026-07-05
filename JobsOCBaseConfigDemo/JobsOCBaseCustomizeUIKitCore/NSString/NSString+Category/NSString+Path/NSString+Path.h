//
//  NSString+Path.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_PATH_02D688350A
#define JOBS_HEADER_GUARD_NSSTRING_PATH_02D688350A

#pragma once

#import <Foundation/Foundation.h>
#import "NSObject+Extra.h"

#import "JobsModelDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Path)
#pragma mark —— iOS 获取文件的 文件名 和 后缀
/// 从路径中获得完整的文件名 （带后缀）
-(NSString *)getFullFileNameByFilePath;
/// 从路径中获得完整的文件名 （不带后缀）
-(NSString *)getOnlyFileNameByFilePath;
/// 从路径中获得文件完整的后缀名 （不带'.'）
+(JobsRetStrByStrBlock _Nonnull)getSuffixFileName;
#pragma mark —— 目录获取
-(NSString *)pathForResourceWithFullName;
-(NSString *)pathForResourceWithName;
/// OC字符串路径拼接
-(JobsRetStrByStrBlock _Nonnull)addPathComponent;
/// 完整的文件名提取普通文件名和文件后缀名
-(JobsRetFileNameModelByStrBlock _Nonnull)byFileFullName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_PATH_02D688350A */
