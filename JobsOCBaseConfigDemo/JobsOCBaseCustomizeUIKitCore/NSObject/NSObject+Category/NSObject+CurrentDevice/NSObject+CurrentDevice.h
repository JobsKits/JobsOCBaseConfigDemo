//
//  NSObject+CurrentDevice.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_CURRENTDEVICE_685C06291D
#define JOBS_HEADER_GUARD_NSOBJECT_CURRENTDEVICE_685C06291D

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "NSObject+ID.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CurrentDevice)
/// App发布的版本号
-(JobsRetStrByVoidBlock _Nonnull)appVersion;
/// BUILD 版本号
-(JobsRetStrByVoidBlock _Nonnull)appBuildVersion;
/// App名字
-(NSString *)appDisplayName;
-(JobsRetStrByVoidBlock _Nonnull)jobsAppDisplayName;
/// 当前语言
-(JobsRetStrByVoidBlock _Nonnull)localLanguage;
/// 当前国家
-(JobsRetStrByVoidBlock _Nonnull)localCountry;
/// 设备名称
-(JobsRetStrByVoidBlock _Nonnull)deviceName;
/// 设备类型
-(JobsRetStrByVoidBlock _Nonnull)deviceModel;
/// 本地化模式
-(JobsRetStrByVoidBlock _Nonnull)deviceLocalizedModel;
/// 系统名字
-(JobsRetStrByVoidBlock _Nonnull)deviceSystemName;
/// 系统版本
-(JobsRetStrByVoidBlock _Nonnull)deviceSystemVersion;

-(JobsRetStrByVoidBlock _Nonnull)deviceIdentity;

-(JobsRetStrByVoidBlock _Nonnull)uuid;

-(JobsRetStrByVoidBlock _Nonnull)idfv;
/// 设备朝向
-(JobsRetUIDeviceOrientationByVoidBlock _Nonnull)deviceOrientation;
/// 是否是Retina显示屏
-(JobsRetBOOLByVoidBlock _Nonnull)isRetina;

-(JobsRetBOOLByVoidBlock _Nonnull)isPhone;

-(JobsRetBOOLByVoidBlock _Nonnull)isPad;

-(JobsRetBOOLByVoidBlock _Nonnull)isPod;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_CURRENTDEVICE_685C06291D */
