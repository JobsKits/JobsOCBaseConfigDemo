//
//  JobsDefineSysEnums.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineSysEnums_h
#define JobsDefineSysEnums_h
#pragma mark —— 系统相关
/// 系统相关@当前对象类型
#ifndef MyEnums_h
#define MyEnums_h
typedef NS_ENUM(NSInteger, ComponentType) {
    ComponentTypeUnknown,       // 其他
    ComponentTypeView,          // 视图
    ComponentTypeViewController // 控制器
};
#endif /* MyEnums_h */
/// 系统相关@图片编码格式
#ifndef PIC_TO_STR_STYLE_ENUM_DEFINED
#define PIC_TO_STR_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, PicToStrStyle) {
    PicToStrStyle_Hexadecimal = 0,// 图片 转 十六进制
    PicToStrStyle_Base16,         // 图片 转 Base16字符编码
    PicToStrStyle_Base32,         // 图片 转 Base32字符编码
    PicToStrStyle_Base64,         // 图片 转 Base64字符编码
    PicToStrStyle_Base85,         // 图片 转 Base85字符编码
    PicToStrStyle_MIME,           // 图片 转 MIME
};
#endif /* PIC_TO_STR_STYLE_ENUM_DEFINED */
/// 系统相关@排序方向
#ifndef SortingTypeDefinition
#define SortingTypeDefinition
typedef NS_ENUM(NSInteger, SortingType) {
    SortingType_Positive = 0, // 排序方向@正序
    SortingType_Reverse       // 排序方向@倒序
};
#endif
/// 系统相关@屏幕方向
#ifndef DeviceOrientation_typedef
#define DeviceOrientation_typedef
typedef NS_ENUM(NSInteger, DeviceOrientation) {
    DeviceOrientationUnknown,  // 未知方向
    DeviceOrientationPortrait, // 竖屏
    DeviceOrientationLandscape // 横屏
};
#endif /* DeviceOrientation_typedef */
/// 系统相关@文字方向
#ifndef JobsDirectionType_h
#define JobsDirectionType_h
typedef NS_ENUM(NSInteger, JobsDirectionType) {
    JobsDirectionUp = 0,    // 文字方向朝上(默认正常)
    JobsDirectionLeft,      // 文字方向朝左
    JobsDirectionDown,      // 文字方向朝下
    JobsDirectionRight      // 文字方向朝右
};
#ifndef JobsDirection_h
#define JobsDirection_h
typedef JobsDirectionType JobsDirection;
#endif /* JobsDirection_h */
#endif /* JobsDirectionType_h */
/// 系统相关@Label的表现方式
#ifndef JobsLabelDef_h
#define JobsLabelDef_h
typedef enum : NSUInteger {
    /// 一行显示。定宽、定高、定字体。多余部分用…表示（省略号的位置由NSLineBreakMode控制）
    UILabelShowingType_01 = 1,
    /// 一行显示。定宽、定高、定字体。多余部分scrollerView
    UILabelShowingType_02,
    /// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
    UILabelShowingType_03,
    /// 一行显示。定宽、定高。缩小字体方式全展示 【单行：ByWidth】
    UILabelShowingType_04,
    /// 多行显示。定宽、不定高、定字体 【多行：ByFont】
    UILabelShowingType_05,
} UILabelShowingType;// UILabel的显示样式
#endif /* JobsLabelDef_h */
/// 系统相关@终端类型
#ifndef JOBS_OPERATION_TYPE_ENUM_DEFINED
#define JOBS_OPERATION_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsOperationType) {
    JobsOperationType_Undefined = 0,  // 终端类型@未定义
    JobsOperationType_PC,             // 终端类型@PC端
    JobsOperationType_iOSNative,      // 终端类型@原生iOS
    JobsOperationType_iOSWebView,     // 终端类型@iOS内嵌WebView网页
    JobsOperationType_iOSBrowser,     // 终端类型@iOS浏览器网页
    JobsOperationType_AndroidNative,  // 终端类型@原生Android
    JobsOperationType_AndroidWebView, // 终端类型@Android内嵌WebView网页
    JobsOperationType_AndroidBrowser, // 终端类型@Android浏览器网页
    JobsOperationType_Unknown,        // 终端类型@未知
};
#endif /* JOBS_OPERATION_TYPE_ENUM_DEFINED */
/// 系统相关@控制器的推进方式
#ifndef COMING_STYLE_ENUM_DEFINED
#define COMING_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, ComingStyle) {
    ComingStyle_Unknown = 0,
    ComingStyle_PUSH,
    ComingStyle_PRESENT,
    ComingStyle_POP,
};
#endif
/// 系统相关@屏幕分辨率
#ifndef iPhScrPxType_h
#define iPhScrPxType_h
typedef NS_ENUM(NSUInteger, iPhScrPxType) {
    iPhScrPxType_None,
    iPhScrPxType_4_4S,             // 屏幕分辨率(px) = 640 × 960
    iPhScrPxType_5_5C_5S_SE,       // 屏幕分辨率(px) = 640 × 1136
    iPhScrPxType_6_6S_7_8_SE2_SE3, // 屏幕分辨率(px) = 750 × 1334
    iPhScrPxType_6_6S_7_8Plus,     // 屏幕分辨率(px) = 1242 × 2208
    /// 从这里开始全面屏
    iPhScrPxType_X_XS_11Pro,       // 屏幕分辨率(px) = 1125 × 2436
    iPhScrPxType_XR_11,            // 屏幕分辨率(px) = 828 × 1792
    iPhScrPxType_XSMax_11ProMax,   // 屏幕分辨率(px) = 1242 × 2688
    /// iPhone 12 系列
    iPhScrPxType_12mini,           // 屏幕分辨率(px) = 1125 × 2436
    iPhScrPxType_12_12Pro,         // 屏幕分辨率(px) = 1170 × 2532
    iPhScrPxType_12ProMax,         // 屏幕分辨率(px) = 1284 × 2778
    /// iPhone 13 系列
    iPhScrPxType_13mini,           // 屏幕分辨率(px) = 1125 × 2436
    iPhScrPxType_13_13Pro,         // 屏幕分辨率(px) = 1170 × 2532
    iPhScrPxType_13ProMax,         // 屏幕分辨率(px) = 1284 × 2778
    /// iPhone 14 系列
    iPhScrPxType_14,               // 屏幕分辨率(px) = 1170 × 2532
    iPhScrPxType_14Plus,           // 屏幕分辨率(px) = 1284 × 2778
    iPhScrPxType_14Pro,            // 屏幕分辨率(px) = 1179 × 2556
    iPhScrPxType_14ProMax,         // 屏幕分辨率(px) = 1290 × 2796
    /// iPhone 15 系列
    iPhScrPxType_15,               // 屏幕分辨率(px) = 1179 × 2556
    iPhScrPxType_15Plus,           // 屏幕分辨率(px) = 1290 × 2796
    iPhScrPxType_15Pro,            // 屏幕分辨率(px) = 1179 × 2556
    iPhScrPxType_15ProMax,         // 屏幕分辨率(px) = 1290 × 2796
    /// iPhone 16 系列
    iPhScrPxType_16e,              // 屏幕分辨率(px) = 1170 × 2532
    iPhScrPxType_16,               // 屏幕分辨率(px) = 1179 × 2556
    iPhScrPxType_16Plus,           // 屏幕分辨率(px) = 1290 × 2796
    iPhScrPxType_16Pro,            // 屏幕分辨率(px) = 1206 × 2622
    iPhScrPxType_16ProMax,         // 屏幕分辨率(px) = 1320 × 2868
    /// iPhone 17 系列
    iPhScrPxType_17e,              // 屏幕分辨率(px) = 1170 × 2532
    iPhScrPxType_17,               // 屏幕分辨率(px) = 1179 × 2556
    iPhScrPxType_17Air,            // 屏幕分辨率(px) = 1290 × 2796
    iPhScrPxType_17Pro,            // 屏幕分辨率(px) = 1206 × 2622
    iPhScrPxType_17ProMax          // 屏幕分辨率(px) = 1320 × 2868
};
#endif /* iPhScrPxType_h */
/// 系统相关@文件类型
#ifndef FILE_TYPE_ENUM_DEFINED
#define FILE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, FileType) {
    FileType_TXT = 0,      // 文件类型@文本文件
    FileType_IMAGE,        // 文件类型@图片文件
    FileType_VIDEO,        // 文件类型@视频文件
    FileType_SOUND,        // 文件类型@音频文件
    FileType_PLIST         // 文件类型@属性列表文件
};
#endif /* FILE_TYPE_ENUM_DEFINED */
/// 系统相关@图片填充模式
#ifndef DW_CONTENT_MODE_ENUM_DEFINED
#define DW_CONTENT_MODE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, DWContentMode) {
    DWContentModeScaleAspectFit,   // 图片填充@适应模式
    DWContentModeScaleAspectFill,  // 图片填充@填充模式
    DWContentModeScaleToFill       // 图片填充@拉伸模式
};
#endif /* DW_CONTENT_MODE_ENUM_DEFINED */

#endif /* JobsDefineSysEnums_h */
