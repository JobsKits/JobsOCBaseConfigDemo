//
//  NSString+Path.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#ifndef NSString_Path_h
#define NSString_Path_h

#import <Foundation/Foundation.h>
#import <JobsModel/FileNameModel.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

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
-(JobsRetFileNameModelByFileFullNameStringBlock _Nonnull)byFileFullName;

@end

NS_ASSUME_NONNULL_END

#endif /* NSString_Path_h */
