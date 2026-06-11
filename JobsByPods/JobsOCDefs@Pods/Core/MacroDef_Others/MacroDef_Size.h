//
//  MacroDef_Size.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef MacroDef_Size_h
#define MacroDef_Size_h

#import <UIKit/UIKit.h>
#import <JobsOCDefs/UIDevice+XMUtils.h>
#import <JobsOCDefs/MacroDef_Func.h>
#import <JobsOCDefs/MacroDef_SysWarning.h>
#import <JobsOCDefs/MacroDef_AppDeviceScreenSize.h>
#import <JobsOCDefs/JobsDefineEnums.h> // 此文件用来存储记录全局的一些枚举
#import <JobsOCDefs/JobsDefineStructs.h> // 此文件用来存储记录全局的一些结构体

#if __has_include(<JobsGetWindow/window.h>)
#import <JobsGetWindow/window.h>
#else
#import "window.h"
#endif

/// 资料来源：
/// https://tommygirl.cn/2022/09/15/iPhone_dev_size/
/// https://chatgpt.com/
#pragma mark —— 屏幕尺寸/启动图作图大小 (从 iPhone 4 开始统计)
/**

 
     * @discussion iPhone 屏幕尺寸 / 启动图适配参考（自 iPhone 4 起）
     *
     * 型号                        尺寸(inch)   ppi   宽高(pt)      分辨率(px)      倍图
     * -------------------------------------------------------------------------------
     * iPhone 4/4S                 3.5          326   320 × 480     640 × 960       @2x
     * iPhone 5/5C/5S/SE           4.0          326   320 × 568     640 × 1136      @2x
     * iPhone 6/6S/7/8/SE 2/SE 3   4.7          326   375 × 667     750 × 1334      @2x
     * iPhone 6/6S/7/8 Plus        5.5          401   414 × 736     1242 × 2208     @3x
     * iPhone X / XS / 11 Pro      5.8          458   375 × 812     1125 × 2436     @3x
     * iPhone XR / 11              6.1          326   414 × 896     828 × 1792      @2x
     * iPhone XS Max / 11 Pro Max  6.5          458   414 × 896     1242 × 2688     @3x
     * iPhone 12 mini              5.4          476   375 × 812     1125 × 2436     @3x
     * iPhone 12 / 12 Pro          6.1          460   390 × 844     1170 × 2532     @3x
     * iPhone 12 Pro Max           6.7          458   428 × 926     1284 × 2778     @3x
     * iPhone 13 mini              5.4          476   375 × 812     1125 × 2436     @3x
     * iPhone 13 / 13 Pro          6.1          460   390 × 844     1170 × 2532     @3x
     * iPhone 13 Pro Max           6.7          458   428 × 926     1284 × 2778     @3x
     * iPhone 14                   6.1          460   390 × 844     1170 × 2532     @3x
     * iPhone 14 Plus              6.7          458   428 × 926     1284 × 2778     @3x
     * iPhone 14 Pro               6.1          460   393 × 852     1179 × 2556     @3x
     * iPhone 14 Pro Max           6.7          460   430 × 932     1290 × 2796     @3x
     * iPhone 15                   6.1          460   393 × 852     1179 × 2556     @3x
     * iPhone 15 Plus              6.7          460   430 × 932     1290 × 2796     @3x
     * iPhone 15 Pro               6.1          460   393 × 852     1179 × 2556     @3x
     * iPhone 15 Pro Max           6.7          460   430 × 932     1290 × 2796     @3x
     * iPhone 16                   6.1          460   393 × 852     1179 × 2556     @3x
     * iPhone 16 Plus              6.7          460   430 × 932     1290 × 2796     @3x
     * iPhone 16 Pro               6.3          460   402 × 874     1206 × 2622     @3x
     * iPhone 16 Pro Max           6.9          460   440 × 956     1320 × 2868     @3x
     * -------------------------------------------------------------------------------
 */
/// 获取当前 iOS 移动设备的屏幕分辨率类型
NS_INLINE iPhScrPxType iPhScrPx(void) {
    NSString *platform = UIDevice.platformIDStr;
    if (!platform.length) return iPhScrPxType_None;

    if ([platform isEqualToString:@"iPhone3,1"] ||   // iPhone 4 (GSM)
        [platform isEqualToString:@"iPhone3,2"] ||   // iPhone 4 (GSM Rev A)
        [platform isEqualToString:@"iPhone3,3"] ||   // iPhone 4 (CDMA)
        [platform isEqualToString:@"iPhone4,1"]) {   // iPhone 4S
        return iPhScrPxType_4_4S;
    }

    if ([platform isEqualToString:@"iPhone5,1"] ||   // iPhone 5 (GSM)
        [platform isEqualToString:@"iPhone5,2"] ||   // iPhone 5 (Global)
        [platform isEqualToString:@"iPhone5,3"] ||   // iPhone 5c
        [platform isEqualToString:@"iPhone5,4"] ||   // iPhone 5c
        [platform isEqualToString:@"iPhone6,1"] ||   // iPhone 5s
        [platform isEqualToString:@"iPhone6,2"] ||   // iPhone 5s
        [platform isEqualToString:@"iPhone8,4"]) {   // iPhone SE (1st generation)
        return iPhScrPxType_5_5C_5S_SE;
    }

    if ([platform isEqualToString:@"iPhone7,2"] ||   // iPhone 6
        [platform isEqualToString:@"iPhone8,1"] ||   // iPhone 6s
        [platform isEqualToString:@"iPhone9,1"] ||   // iPhone 7
        [platform isEqualToString:@"iPhone9,3"] ||   // iPhone 7
        [platform isEqualToString:@"iPhone10,1"] ||  // iPhone 8
        [platform isEqualToString:@"iPhone10,4"] ||  // iPhone 8
        [platform isEqualToString:@"iPhone12,8"] ||  // iPhone SE (2nd generation)
        [platform isEqualToString:@"iPhone14,6"]) {  // iPhone SE (3rd generation)
        return iPhScrPxType_6_6S_7_8_SE2_SE3;
    }

    if ([platform isEqualToString:@"iPhone7,1"] ||   // iPhone 6 Plus
        [platform isEqualToString:@"iPhone8,2"] ||   // iPhone 6s Plus
        [platform isEqualToString:@"iPhone9,2"] ||   // iPhone 7 Plus
        [platform isEqualToString:@"iPhone9,4"] ||   // iPhone 7 Plus
        [platform isEqualToString:@"iPhone10,2"] ||  // iPhone 8 Plus
        [platform isEqualToString:@"iPhone10,5"]) {  // iPhone 8 Plus
        return iPhScrPxType_6_6S_7_8Plus;
    }

    if ([platform isEqualToString:@"iPhone10,3"] ||  // iPhone X
        [platform isEqualToString:@"iPhone10,6"] ||  // iPhone X
        [platform isEqualToString:@"iPhone11,2"] ||  // iPhone XS
        [platform isEqualToString:@"iPhone12,3"]) {  // iPhone 11 Pro
        return iPhScrPxType_X_XS_11Pro;
    }

    if ([platform isEqualToString:@"iPhone11,8"] ||  // iPhone XR
        [platform isEqualToString:@"iPhone12,1"]) {  // iPhone 11
        return iPhScrPxType_XR_11;
    }

    if ([platform isEqualToString:@"iPhone11,4"] ||  // iPhone XS Max
        [platform isEqualToString:@"iPhone11,6"] ||  // iPhone XS Max
        [platform isEqualToString:@"iPhone12,5"]) {  // iPhone 11 Pro Max
        return iPhScrPxType_XSMax_11ProMax;
    }

    if ([platform isEqualToString:@"iPhone13,1"]) {  // iPhone 12 mini
        return iPhScrPxType_12mini;
    }

    if ([platform isEqualToString:@"iPhone13,2"] ||  // iPhone 12
        [platform isEqualToString:@"iPhone13,3"]) {  // iPhone 12 Pro
        return iPhScrPxType_12_12Pro;
    }

    if ([platform isEqualToString:@"iPhone13,4"]) {  // iPhone 12 Pro Max
        return iPhScrPxType_12ProMax;
    }

    if ([platform isEqualToString:@"iPhone14,4"]) {  // iPhone 13 mini
        return iPhScrPxType_13mini;
    }

    if ([platform isEqualToString:@"iPhone14,2"] ||  // iPhone 13 Pro
        [platform isEqualToString:@"iPhone14,5"]) {  // iPhone 13
        return iPhScrPxType_13_13Pro;
    }

    if ([platform isEqualToString:@"iPhone14,3"]) {  // iPhone 13 Pro Max
        return iPhScrPxType_13ProMax;
    }

    if ([platform isEqualToString:@"iPhone14,7"]) {  // iPhone 14
        return iPhScrPxType_14;
    }

    if ([platform isEqualToString:@"iPhone14,8"]) {  // iPhone 14 Plus
        return iPhScrPxType_14Plus;
    }

    if ([platform isEqualToString:@"iPhone15,2"]) {  // iPhone 14 Pro
        return iPhScrPxType_14Pro;
    }

    if ([platform isEqualToString:@"iPhone15,3"]) {  // iPhone 14 Pro Max
        return iPhScrPxType_14ProMax;
    }

    if ([platform isEqualToString:@"iPhone15,4"]) {  // iPhone 15
        return iPhScrPxType_15;
    }

    if ([platform isEqualToString:@"iPhone15,5"]) {  // iPhone 15 Plus
        return iPhScrPxType_15Plus;
    }

    if ([platform isEqualToString:@"iPhone16,1"]) {  // iPhone 15 Pro
        return iPhScrPxType_15Pro;
    }

    if ([platform isEqualToString:@"iPhone16,2"]) {  // iPhone 15 Pro Max
        return iPhScrPxType_15ProMax;
    }

    if ([platform isEqualToString:@"iPhone17,5"]) {  // iPhone 16e
        return iPhScrPxType_16e;
    }

    if ([platform isEqualToString:@"iPhone17,3"]) {  // iPhone 16
        return iPhScrPxType_16;
    }

    if ([platform isEqualToString:@"iPhone17,4"]) {  // iPhone 16 Plus
        return iPhScrPxType_16Plus;
    }

    if ([platform isEqualToString:@"iPhone17,1"]) {  // iPhone 16 Pro
        return iPhScrPxType_16Pro;
    }

    if ([platform isEqualToString:@"iPhone17,2"]) {  // iPhone 16 Pro Max
        return iPhScrPxType_16ProMax;
    }

    if ([platform isEqualToString:@"iPhone18,5"]) {  // iPhone 17e
        return iPhScrPxType_17e;
    }

    if ([platform isEqualToString:@"iPhone18,3"]) {  // iPhone 17
        return iPhScrPxType_17;
    }

    if ([platform isEqualToString:@"iPhone18,4"]) {  // iPhone Air
        return iPhScrPxType_17Air;
    }

    if ([platform isEqualToString:@"iPhone18,1"]) {  // iPhone 17 Pro
        return iPhScrPxType_17Pro;
    }

    if ([platform isEqualToString:@"iPhone18,2"]) {  // iPhone 17 Pro Max
        return iPhScrPxType_17ProMax;
    }

    return iPhScrPxType_None;
}
/// 判断当前设备是否是全面屏
NS_INLINE BOOL isFullScreen(void){
    return UIDevice.isFullScreen;
}
#pragma mark —— APP桌面Logo图片尺寸
/**

 
     * @discussion App Icon 尺寸参考
     *
     * 标注                           尺寸(px)
     * --------------------------------------
     * iPhone Notification 20pt @2x   40 × 40
     * iPhone Notification 20pt @3x   60 × 60
     * iPhone Settings 29pt @2x       58 × 58
     * iPhone Settings 29pt @3x       87 × 87
     * iPhone Spotlight 40pt @2x      80 × 80
     * iPhone Spotlight 40pt @3x      120 × 120
     * iPhone App 60pt @2x            120 × 120
     * iPhone App 60pt @3x            180 × 180
     * App Store 1024pt @1x           1024 × 1024
     * --------------------------------------
 *
 */
#pragma mark —— 安全区
/**
 *

     * @discussion iPhone 安全区（Safe Area Insets）参考（竖屏）
     *
     * 型号                              Edge (Top, Left, Bottom, Right)
     * -----------------------------------------------------------------
     * iPhone SE / 5S                     ——
     * iPhone 6s / 7 / 8                  ——
     * iPhone 6s / 7 / 8 Plus             ——
     *
     * iPhone X / XS                      (44, 0, 34, 0)
     * iPhone XR / 11                     (48, 0, 34, 0)
     * iPhone XS Max / 11 Pro Max         (44, 0, 34, 0)
     *
     * iPhone 12 mini / 13 mini           (50, 0, 34, 0)
     * iPhone 12 / 12 Pro                 (47, 0, 34, 0)
     * iPhone 12 Pro Max                  (47, 0, 34, 0)
     *
     * iPhone 13 / 13 Pro                 (47, 0, 34, 0)
     * iPhone 13 Pro Max                  (47, 0, 34, 0)
     *
     * iPhone 14                          (47, 0, 34, 0)
     * iPhone 14 Plus                     (47, 0, 34, 0)
     * iPhone 14 Pro                      (59, 0, 34, 0)
     * iPhone 14 Pro Max                  (59, 0, 34, 0)
     *
     * iPhone 15                          (59, 0, 34, 0)
     * iPhone 15 Plus                     (59, 0, 34, 0)
     * iPhone 15 Pro                      (59, 0, 34, 0)
     * iPhone 15 Pro Max                  (59, 0, 34, 0)
     *
     * iPhone 16e                         (47, 0, 34, 0)
     * iPhone 16                          (59, 0, 34, 0)
     * iPhone 16 Plus                     (59, 0, 34, 0)
     * iPhone 16 Pro                      (62, 0, 34, 0)
     * iPhone 16 Pro Max                  (62, 0, 34, 0)
     * -----------------------------------------------------------------
 */
#pragma mark —— Tabbar 作图大小
/**
 *

     * @discussion iPhone Tabbar 尺寸参考
     *
     * 型号                              尺寸(px)          Tabbar 高度(pt)
     * ------------------------------------------------------------------
     * iPhone SE / 5S                     640 × 98         49
     * iPhone 6s / 7 / 8                  750 × 98         49
     * iPhone 6s / 7 / 8 Plus             1242 × 147       49
     *
     * iPhone X / XS                      1125 × 249       83
     * iPhone XR / 11                     828 × 166        83
     * iPhone XS Max / 11 Pro Max         1242 × 249       83
     *
     * iPhone 12 mini / 13 mini           1125 × 249       83
     * iPhone 12 / 12 Pro                 1170 × 249       83
     * iPhone 12 Pro Max                  1284 × 249       83
     *
     * iPhone 13 / 13 Pro                 1170 × 249       83
     * iPhone 13 Pro Max                  1284 × 249       83
     *
     * iPhone 14                          1170 × 249       83
     * iPhone 14 Plus                     1284 × 249       83
     * iPhone 14 Pro                      1179 × 249       83
     * iPhone 14 Pro Max                  1290 × 249       83
     *
     * iPhone 15                          1179 × 249       83
     * iPhone 15 Plus                     1290 × 249       83
     * iPhone 15 Pro                      1179 × 249       83
     * iPhone 15 Pro Max                  1290 × 249       83
     *
     * iPhone 16e                         1170 × 249       83
     * iPhone 16                          1179 × 249       83
     * iPhone 16 Plus                     1290 × 249       83
     * iPhone 16 Pro                      1206 × 249       83
     * iPhone 16 Pro Max                  1320 × 249       83
     * ------------------------------------------------------------------
 */
#pragma mark —— 屏幕二维长宽数据输出
NS_INLINE CGSize JobsMainScreen(void){
    return UIScreen.mainScreen.bounds.size;
}
#pragma mark —— 屏幕Frame数据输出
NS_INLINE CGRect MainScreenFrame(void){
    return UIScreen.mainScreen.bounds;
}
#pragma mark —— 横屏判定
#warning 横屏的时候，较之于竖屏，宽高会互换
NS_INLINE CGFloat JobsMainScreen_WIDTH(void){
    return JobsMainScreen().width;
}

NS_INLINE CGFloat JobsMainScreen_HEIGHT(void){
    return JobsMainScreen().height;
}
/// 寻找此设备真正的高
NS_INLINE CGFloat JobsDeviceRealHeight(void){
    return MAX(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
}
/// 寻找此设备真正的宽
NS_INLINE CGFloat JobsDeviceRealWidth(void){
    return MIN(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
}
#pragma mark —— 【全局比例尺】
/// 基准设计尺寸
#ifndef JobsDesignWidth
#define JobsDesignWidth 375.0
#endif

#ifndef JobsDesignHeight
#define JobsDesignHeight 812.0
#endif
/// 宽度适配（基于设计稿宽度）
static inline CGFloat ScaleW(CGFloat value) {
    return value * (UIScreen.mainScreen.bounds.size.width / JobsDesignWidth);
}
/// 高度适配（基于设计稿高度）
static inline CGFloat ScaleH(CGFloat value) {
    return value * (UIScreen.mainScreen.bounds.size.height / JobsDesignHeight);
}
/// https://www.strerr.com/screen.html
/// 屏幕像素标准转化：输入原型图上的宽和高，对外输出App对应的移动设备的真实宽高
/**
 * 为什么按宽度缩放是业界主流方案
 * 大多数设计稿都是以宽度为主（例如 375pt / 390pt / 430pt）
 * UI 的排布一般是横向的按钮、文字、图表等，它们对宽度变化更敏感
 * 高度适配通常通过 Auto Layout（或者顶部底部对齐）解决，不需要按比例拉伸高度
 */
/// 以 375pt 作为设计稿宽度基准（自动取短边）
NS_INLINE CGFloat JobsWidth(CGFloat designWidth) {
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    CGFloat screenShortSide = MIN(screenSize.width, screenSize.height);
    static const CGFloat baseWidth = 375.0;
    return (screenShortSide / baseWidth) * designWidth;
}
/// 以 812pt 作为设计稿高度基准（自动取长边）
NS_INLINE CGFloat JobsHeight(CGFloat designHeight) {
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    CGFloat screenLongSide = MAX(screenSize.width, screenSize.height);
    static const CGFloat baseHeight = 812.0;
    return (screenLongSide / baseHeight) * designHeight;
}
/// 按照设计稿宽度做等比例缩放（支持横屏）
/// 需要等视图加载后调用（不能在 App 启动太早的阶段）
NS_INLINE CGFloat JobsSafeWidth(CGFloat designWidth) {
    UIWindow *targetWindow = UIApplication.sharedApplication.windows.firstObject;
    // iOS 13+ 使用 Scene 获取当前激活窗口
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                targetWindow = scene.windows.firstObject;
                break;
            }
        }
    }
    CGFloat safeWidth = targetWindow.safeAreaLayoutGuide.layoutFrame.size.width;
    // fallback 防止获取失败时宽度为0
    if (safeWidth <= 0) {
        CGSize screenSize = UIScreen.mainScreen.bounds.size;
        safeWidth = MIN(screenSize.width, screenSize.height); // 自动适配横竖屏
    }
    static const CGFloat baseWidth = 430.0; // 以 iPhone 16 Pro Max 为设计基准
    return (safeWidth / baseWidth) * designWidth;
}
/// 按照设计稿宽度做等比例缩放（支持横屏）
/// 需要等视图加载后调用（不能在 App 启动太早的阶段）
NS_INLINE CGFloat JobsSafeHeight(CGFloat designHeight) {
    UIWindow *targetWindow = UIApplication.sharedApplication.windows.firstObject;
    // iOS 13+ 取当前活跃 Scene 的主窗口
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                targetWindow = scene.windows.firstObject;
                break;
            }
        }
    }
    CGFloat safeHeight = targetWindow.safeAreaLayoutGuide.layoutFrame.size.height;
    // fallback 防止获取失败
    if (safeHeight <= 0) {
        CGSize screenSize = UIScreen.mainScreen.bounds.size;
        safeHeight = MAX(screenSize.width, screenSize.height); // 横屏/竖屏都自动适配
    }
    static const CGFloat baseHeight = 932.0; // iPhone 16 Pro Max 高度为设计基准
    return (safeHeight / baseHeight) * designHeight;
}
#pragma mark —— 安全区域
///【竖屏】顶部的安全距离
///【横屏】距离灵动岛左边10，距离灵动岛右边46，灵动岛高度36pt，灵动岛宽度120pt
NS_INLINE CGFloat JobsTopSafeAreaHeight(void){
    if (@available(iOS 11.0, *)) {
        return jobsGetMainWindow().safeAreaInsets.top;
    } else return 0.f;
}
///【竖屏】底部的安全距离：全面屏手机为34pt，非全面屏手机为0pt
///【横屏】底部的安全距离：全面屏手机为0pt，非全面屏手机为0pt。距离横杠上部12，距离横杠下部8，横杠高度4
NS_INLINE CGFloat JobsBottomSafeAreaHeight(void){
    if (@available(iOS 11.0, *)) {
        return jobsGetMainWindow().safeAreaInsets.bottom;
    } else return 0.f;
}
#pragma mark —— 状态栏高度
/**
【iOS 14前】
 刘海屏手机的状态栏高度 = 44pt
 非刘海屏手机的状态栏高度 = 20pt
 
【iOS 14后】刘海屏的状态栏高度不再是固定的44pt
 iPhone 11/X/XR的状态栏高度 = 48pt
 iPhone 12/12 Pro/13/13 Pro/14的状态栏高度 = 47pt
 iPhone 14 Pro/14 Pro Max的状态栏高度 = 59pt
 其他刘海屏的状态栏高度 = 44pt
 非刘海屏的状态栏高度 = 20pt
 */
/// 方法一：状态栏高度
NS_INLINE CGFloat JobsStatusBarHeightByAppleIncData(void) {
    if (UIDevice.currentDevice.systemVersion.floatValue < 14.0) {
        return isiPhoneX_series() ? 44 : 20; // iOS 14 以下的设备
    } else {
        // iPhone 11 系列及更早的全面屏设备
        if ([UIDevice.simulatorModel isEqualToString:@"iPhone12,1"] ||  // iPhone 11
            [UIDevice.simulatorModel isEqualToString:@"iPhone12,3"] ||  // iPhone 11 Pro
            [UIDevice.simulatorModel isEqualToString:@"iPhone12,5"] ||  // iPhone 11 Pro Max
            [UIDevice.simulatorModel isEqualToString:@"iPhone10,6"] ||  // iPhone X
            [UIDevice.simulatorModel isEqualToString:@"iPhone10,8"]) {  // iPhone XR
            return 48;
        }
        // iPhone 12 - iPhone 15 标准系列
        if ([UIDevice.simulatorModel isEqualToString:@"iPhone13,2"] ||  // iPhone 12
            [UIDevice.simulatorModel isEqualToString:@"iPhone13,3"] ||  // iPhone 12 Pro
            [UIDevice.simulatorModel isEqualToString:@"iPhone14,2"] ||  // iPhone 13 Pro
            [UIDevice.simulatorModel isEqualToString:@"iPhone14,5"] ||  // iPhone 13
            [UIDevice.simulatorModel isEqualToString:@"iPhone14,7"] ||  // iPhone 14
            [UIDevice.simulatorModel isEqualToString:@"iPhone14,8"] ||  // iPhone 14 Plus
            [UIDevice.simulatorModel isEqualToString:@"iPhone15,4"] ||  // iPhone 15
            [UIDevice.simulatorModel isEqualToString:@"iPhone15,5"]) {  // iPhone 15 Plus
            return 47;
        }
        // iPhone 14 Pro / Pro Max 及 iPhone 15 Pro / Pro Max
        if ([UIDevice.simulatorModel isEqualToString:@"iPhone15,2"] ||  // iPhone 14 Pro
            [UIDevice.simulatorModel isEqualToString:@"iPhone15,3"] ||  // iPhone 14 Pro Max
            [UIDevice.simulatorModel isEqualToString:@"iPhone16,1"] ||  // iPhone 15 Pro
            [UIDevice.simulatorModel isEqualToString:@"iPhone16,2"]) {  // iPhone 15 Pro Max
            return 59;
        }
        // iPhone 16 标准系列（占位，未来设备）
        if ([UIDevice.simulatorModel isEqualToString:@"iPhone17,2"] ||  // iPhone 16
            [UIDevice.simulatorModel isEqualToString:@"iPhone17,3"] ||  // iPhone 16 Plus
            [UIDevice.simulatorModel isEqualToString:@"iPhone18,2"] ||  // iPhone 16 Pro
            [UIDevice.simulatorModel isEqualToString:@"iPhone18,3"]) {  // iPhone 16 Pro Max
            return 59; // 假设 iPhone 16 Pro 系列继续沿用59高度
        }
        // 其他未来设备，默认返回全面屏或非全面屏高度
        return UIDevice.isFullScreen ? 44 : 20;
    }
}
/// 方法二：状态栏高度
NS_INLINE CGFloat JobsRectOfStatusbar(void){
    SuppressWdeprecatedDeclarationsWarning(
        if (@available(iOS 13.0, *)){
            UIStatusBarManager *statusBarManager = jobsGetMainWindow().windowScene.statusBarManager;
            return statusBarManager.statusBarHidden ? 0 : statusBarManager.statusBarFrame.size.height;
        }else return UIApplication.sharedApplication.statusBarFrame.size.height;);
}
/// 方法三：状态栏高度
NS_INLINE CGFloat JobsStatusBarHeight(void){
    if (@available(iOS 11.0, *)) {
        return jobsGetMainWindow().safeAreaInsets.top;
    } else return JobsRectOfStatusbar();
}
#pragma mark —— 导航栏高度
/// @param navigationController 传nil为系统默认navigationController高度；因为navigationController可以自定义高度，传自定义navigationController返回自定义的navigationController的高度
NS_INLINE CGFloat JobsNavigationHeight(UINavigationController * _Nullable navigationController){
    if (navigationController) {
        return CGRectGetHeight(navigationController.navigationBar.frame);
    }else return 44.f;
}
#pragma mark —— 状态栏 + 导航栏高度
/// 非刘海屏：状态栏高度(20.f) + 导航栏高度(44.f) = 64.f
/// 刘海屏系列：状态栏高度(44.f) + 导航栏高度(44.f) = 88.f
NS_INLINE CGFloat JobsNavigationBarAndStatusBarHeight(UINavigationController * _Nullable navigationController){
    return JobsStatusBarHeight() + JobsNavigationHeight(navigationController);
}
#pragma mark —— Tabbar高度：全面屏手机比普通手机多34的安全区域
/// @param tabBarController 传nil为系统默认tabbar高度；因为tabBarController可以自定义高度，传自定义tabBarController返回自定义的tabBarController的高度
NS_INLINE CGFloat JobsTabBarHeight(UITabBarController * _Nullable tabBarController){
    //因为tabbar可以自定义高度，所以这个地方返回系统默认的49像素的高度
    if (tabBarController) {
        return CGRectGetHeight(tabBarController.tabBar.frame);
    }else return 49.f;
}
/// tabbar高度：【包括了底部安全区域的TabBar高度，一般用这个】
NS_INLINE CGFloat JobsTabBarHeightByBottomSafeArea(UITabBarController * _Nullable tabBarController){
    return JobsTabBarHeight(tabBarController) + JobsBottomSafeAreaHeight();
}
#pragma mark —— 除开 tabBarController 和 navigationController 的内容可用区域的大小
NS_INLINE CGFloat JobsContentAreaHeight(UITabBarController * _Nullable tabBarController,
                                            UINavigationController * _Nullable navigationController){
    CGFloat tabBarHeightByBottomSafeArea = JobsTabBarHeightByBottomSafeArea(tabBarController);
    CGFloat navigationBarAndStatusBarHeight = JobsNavigationBarAndStatusBarHeight(navigationController);
    return JobsMainScreen_HEIGHT() - tabBarHeightByBottomSafeArea - navigationBarAndStatusBarHeight;
}
#pragma mark —— 尺寸相关的结构体判定
/// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
/// 判定一个Size是否是CGSizeZero
NS_INLINE BOOL jobsZeroSizeValue(CGSize sizeValue){
    return CGSizeEqualToSize(CGSizeZero, sizeValue);
}
/// 判定一个CGRect是否是CGRectZero
NS_INLINE BOOL jobsZeroRectValue(CGRect rectValue){
    return CGRectEqualToRect(CGRectZero, rectValue);
}
/// 判定一个CGPoint是否是CGPointZero
NS_INLINE BOOL jobsZeroPointValue(CGPoint pointValue){
    return CGPointEqualToPoint(CGPointZero, pointValue);
}
/// 构建一个宽高相等的 CGSize
NS_INLINE CGSize jobsSameSize(CGFloat x){
    return CGSizeMake(JobsWidth(x), JobsWidth(x));
}
/// 构建一个XY相等的 CGPoint
NS_INLINE CGPoint jobsSamePoint(CGFloat x){
    return CGPointMake(JobsWidth(x), JobsWidth(x));
}

NS_INLINE BOOL jobsEqualToZeroRect(CGRect x){
    return CGRectEqualToRect(x, CGRectZero);
}

NS_INLINE BOOL jobsEqualToZeroPoint(CGPoint x){
    return CGPointEqualToPoint(x, CGPointZero);
}

NS_INLINE BOOL jobsEqualToZeroSize(CGSize x){
    return CGSizeEqualToSize(x, CGSizeZero);
}

#endif /* MacroDef_Size_h */
