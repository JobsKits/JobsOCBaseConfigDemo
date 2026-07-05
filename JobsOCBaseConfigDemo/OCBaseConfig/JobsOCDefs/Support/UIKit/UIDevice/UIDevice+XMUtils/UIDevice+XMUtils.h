//
//  UIDevice+XMUtils.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIDEVICE_XMUTILS_CAE10DC95F
#define JOBS_HEADER_GUARD_UIDEVICE_XMUTILS_CAE10DC95F

#pragma once

#import <sys/sysctl.h>
#import <sys/utsname.h>
#import <UIKit/UIKit.h>
#import "JobsDefineProperty.h"

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

typedef __kindof NSString *_Nullable(^JobsRetStrByStrBlock)(__kindof NSString *_Nullable data);

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (JobsOCDefsXMUtils)

Prop_assign(readonly)NSString *machineModel;
/**
 
     获取硬件平台名称，叫 device model 或者 machine name
     @return 硬件平台名称，如 iPhone3,1、iPad7,4 等
 */
+(NSString * _Nullable)platform;
/// 获取当前设备标识符Identifier（不区分iOS模拟器：把IOS模拟器当真机对待）
+(NSString * _Nullable)platformIDStr;
/// 判断当前iOS模拟器所模拟的机型
+(NSString * _Nullable)simulatorModel;
/// 判断当前机型是否为全面屏 iPhone（基于 machine identifier）
/// 全面屏机型返回 YES，非全面屏机型返回 NO
+(BOOL)isFullScreen;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIDEVICE_XMUTILS_CAE10DC95F */
