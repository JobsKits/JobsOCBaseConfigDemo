//
//  NSObject+SysInfo.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_SYSINFO_974E9D7AB9
#define JOBS_HEADER_GUARD_NSOBJECT_SYSINFO_974E9D7AB9

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 获取系统环境变量
@interface NSObject (SysInfo)
/// 应用程序的发布版本号
+(NSString *_Nullable)version;
+(JobsRetStrByVoidBlock _Nonnull)jobsVersion;
-(JobsRetStrByVoidBlock _Nonnull)version;
/// 应用程序编译构建的版本号
+(JobsRetStrByVoidBlock _Nonnull)build;
-(JobsRetStrByVoidBlock _Nonnull)build;
/// 应用程序的名字
+(JobsRetStrByVoidBlock _Nonnull)appName;
-(JobsRetStrByVoidBlock _Nonnull)appName;
/// 返回当前本地化环境（即当前设备的区域设置）中所使用的语言代码
+(JobsRetStrByVoidBlock _Nonnull)appCurrentLanguageCode;
-(JobsRetStrByVoidBlock _Nonnull)appCurrentLanguageCode;
/// 通常返回用户偏好的语言，可能包括用户自定义的语言排序
+(JobsRetStrByVoidBlock _Nonnull)userPreferredLanguages;
-(JobsRetStrByVoidBlock _Nonnull)userPreferredLanguages;
/// 设备名称
+(JobsRetStrByVoidBlock _Nonnull)currentDeviceName;
-(JobsRetStrByVoidBlock _Nonnull)currentDeviceName;
/// 设备类型
+(JobsRetStrByVoidBlock _Nonnull)currentDeviceType;
-(JobsRetStrByVoidBlock _Nonnull)currentDeviceType;
/// 本地化模式
+(JobsRetStrByVoidBlock _Nonnull)currentDeviceLocalizedModel;
-(JobsRetStrByVoidBlock _Nonnull)currentDeviceLocalizedModel;
/// 系统名字
+(JobsRetStrByVoidBlock _Nonnull)systemName;
-(JobsRetStrByVoidBlock _Nonnull)systemName;
/// 系统版本
+(JobsRetStrByVoidBlock _Nonnull)systemVersion;
-(JobsRetStrByVoidBlock _Nonnull)systemVersion;
/// 设备朝向
+(JobsRetUIDeviceOrientationByVoidBlock _Nonnull)orientation;
-(JobsRetUIDeviceOrientationByVoidBlock _Nonnull)orientation;
/// 是否是iPhone
+(JobsRetBOOLByVoidBlock _Nonnull)iPhone;
-(JobsRetBOOLByVoidBlock _Nonnull)iPhone;
/// 是否是iPod
+(JobsRetBOOLByVoidBlock _Nonnull)iPod;
-(JobsRetBOOLByVoidBlock _Nonnull)iPod;
/// 是否是iPad
+(JobsRetBOOLByVoidBlock _Nonnull)iPad;
-(JobsRetBOOLByVoidBlock _Nonnull)iPad;
/// 是否是 Retain 屏幕：通过判断屏幕的像素密度来确认
+(JobsRetBOOLByVoidBlock _Nonnull)isRetain;
-(JobsRetBOOLByVoidBlock _Nonnull)isRetain;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_SYSINFO_974E9D7AB9 */
