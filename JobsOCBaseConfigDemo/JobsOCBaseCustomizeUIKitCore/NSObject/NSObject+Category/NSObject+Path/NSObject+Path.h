//
//  NSObject+Path.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NSObject_Path_h
#define NSObject_Path_h

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "NSString+Path.h"
#import "NSObject+Extra.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Path)
/// 获取bundle路径
-(NSString *)bundlePath;
/// 获取bundle路径的 Block 门面
-(JobsRetStrByVoidBlock _Nonnull)jobsBundlePath;
/// 获取沙盒的主目录路径：
-(JobsRetStrByVoidBlock _Nonnull)homeDir;
/// Documents目录（这个目录通常用于存储应用程序中的用户数据或需要持久保存的数据。用户可以通过 iTunes 文件共享或 iCloud 访问该目录中的内容）下，用户主目录下，返回完整路径
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)documentsPaths;
/// Library目录（这个目录是每个 iOS 或 macOS 应用程序特有的目录，通常存储应用程序的支持文件、配置文件以及不能直接由用户访问的文件）下，用户主目录下，返回完整路径
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)libraryPaths;
/// 缓存目录下，用户主目录下，返回完整路径
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)cachesPaths;
/// 获取真机沙盒中Documents的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)documentsDir;
/// 获取沙盒中Library的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)libraryDir;
/// 获取沙盒中NSUserDefaults的保存位置
-(JobsRetStrByVoidBlock _Nonnull)userDefaultsDir;
/// 获取沙盒中Library/Caches的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)cachesDir;
/// 获取沙盒中Libarary/Preferences的目录路径：
-(JobsRetStrByVoidBlock _Nonnull)preferencesDir;
/// 获取沙盒中tmp的目录路径：供系统使用，程序员不要使用，因为随时会被销毁
-(JobsRetStrByVoidBlock _Nonnull)tmpDir;

@end

NS_ASSUME_NONNULL_END

#endif /* NSObject_Path_h */
