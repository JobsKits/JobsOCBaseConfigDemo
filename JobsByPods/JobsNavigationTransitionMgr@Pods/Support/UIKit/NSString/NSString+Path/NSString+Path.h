//
//  NSString+Path.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_PATH_8F3A35EC7F
#define JOBS_HEADER_GUARD_NSSTRING_PATH_8F3A35EC7F

#pragma once

#import <Foundation/Foundation.h>
#import <JobsNavigationTransitionMgr/NSObject+Extra.h>

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

@interface NSString (Path)
#pragma mark —— iOS 获取文件的 文件名 和 后缀
/// 从路径中获得完整的文件名 （带后缀）
-(JobsRetStrByVoidBlock _Nonnull)getFullFileNameByFilePath;
/// 从路径中获得完整的文件名 （不带后缀）
-(JobsRetStrByVoidBlock _Nonnull)getOnlyFileNameByFilePath;
/// 从路径中获得文件完整的后缀名 （不带'.'）
+(JobsRetStrByStrBlock _Nonnull)getSuffixFileName;
#pragma mark —— 目录获取
-(NSString *)pathForResourceWithFullName;
-(JobsRetStrByVoidBlock _Nonnull)jobsPathForResourceWithFullName;
-(JobsRetStrByVoidBlock _Nonnull)pathForResourceWithName;
/// OC字符串路径拼接
-(JobsRetStrByStrBlock _Nonnull)addPathComponent;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_PATH_8F3A35EC7F */
