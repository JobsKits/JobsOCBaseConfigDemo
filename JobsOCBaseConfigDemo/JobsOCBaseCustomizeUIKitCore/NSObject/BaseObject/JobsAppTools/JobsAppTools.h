//
//  JobsAppTools.h
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPTOOLS_9A876E8A41
#define JOBS_HEADER_GUARD_JOBSAPPTOOLS_9A876E8A41

#pragma once

#import <UIKit/UIKit.h>
#import "JobsBaseProtocolHeader.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

/// 单例工具箱
#ifndef JobsAppTool
#define JobsAppTool JobsAppTools.sharedManager
#endif /* JobsAppTool */
NS_ASSUME_NONNULL_BEGIN
/// 本类结合 NSObject+AppTools 是对整个App作用于全局的工具箱 🧰
@interface JobsAppTools : NSObject<BaseProtocol>
#pragma mark —— 屏幕方向
#warning 以下属性，如果用分类集成，即写在NSObject层，可能出现存取值异常
/// UIInterfaceOrientationMaskLandscapeLeft :左手边是iPhone刘海，应用程序横屏倒置
/// 在应用程序初始化的阶段，是没有办法通过诸如：UIDevice.currentDevice.orientation 获取到正确的方向的
Prop_assign()UIInterfaceOrientationMask currentInterfaceOrientationMask; // 定义应用程序支持的方向
Prop_assign()UIInterfaceOrientation currentInterfaceOrientation;
         // 描述界面当前的方向，用于确定应用界面是如何显示的
Prop_assign()UIDeviceOrientation currentDeviceOrientation;
               // 描述设备本身的物理方向，即设备如何被用户持握
Prop_assign()DeviceOrientation jobsDeviceOrientation;
                    // 自定义枚举，直接输出横竖屏判定
/// 根据 x 和 y 的绝对值判断主方向
-(JobsRetStrByCGPointBlock _Nonnull)directionByTranslation;
-(JobsRetNSIntegerByPointBlock _Nonnull)directionByPoint;

@end

NS_ASSUME_NONNULL_END
/// 寻找当前屏幕真正的高
NS_INLINE CGFloat JobsRealHeight(void){
    return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsDeviceRealWidth() :JobsDeviceRealHeight();
}
/// 寻找当前屏幕真正的宽
NS_INLINE CGFloat JobsRealWidth(void){
    return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsDeviceRealHeight() :JobsDeviceRealWidth();
}
#endif /* JOBS_HEADER_GUARD_JOBSAPPTOOLS_9A876E8A41 */
