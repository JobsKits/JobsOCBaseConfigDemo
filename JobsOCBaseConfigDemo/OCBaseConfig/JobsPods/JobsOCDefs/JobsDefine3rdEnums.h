//
//  JobsDefine3rdEnums.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefine3rdEnums_h
#define JobsDefine3rdEnums_h
#pragma mark —— 3rd相关
/// WGradientProgress
#ifndef WGradientProgressType_h
#define WGradientProgressType_h
typedef enum : NSUInteger {
    WGradientProgressType_colorNormal = 0, // WGradientProgress@单一色
    WGradientProgressType_colorRoll        // WGradientProgress@色彩在不断的翻滚
} WGradientProgressType;
#endif /* WGradientProgressType_h */
/// SPAlertController
#ifndef SPAlertControllerInitType_h
#define SPAlertControllerInitType_h
typedef enum : NSUInteger {
    /// alertControllerWithTitle/message/preferredStyle
    NSObject_SPAlertControllerInitType_1 = 0,
    /// alertControllerWithTitle/message/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_2,
    /// alertControllerWithCustomAlertView/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_3,
    /// alertControllerWithCustomHeaderView/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_4,
    /// alertControllerWithCustomActionSequenceView/title/message/preferredStyle/animationType
    NSObject_SPAlertControllerInitType_5,
} NSObject_SPAlertControllerInitType;
#endif /* SPAlertControllerInitType_h */
/// JPImageresizerView
#ifndef JPIMAGERESIZER_CONFIGURE_TYPE_ENUM
#define JPIMAGERESIZER_CONFIGURE_TYPE_ENUM
typedef enum : NSInteger {
    /// 默认配置裁剪图片/GIF（UIImage）
    JPImageresizerConfigureType_1 = 0,
    /// 默认配置裁剪图片/GIF（NSData）
    JPImageresizerConfigureType_2,
    /// 默认配置裁剪视频（NSURL）
    JPImageresizerConfigureType_3,
    /// 默认配置裁剪视频（AVURLAsset）
    JPImageresizerConfigureType_4,
    /// 浅色毛玻璃配置裁剪图片/GIF（UIImage）
    JPImageresizerConfigureType_5,
    /// 浅色毛玻璃配置裁剪图片/GIF（NSData）
    JPImageresizerConfigureType_6,
    /// 浅色毛玻璃配置裁剪视频（NSURL）
    JPImageresizerConfigureType_7,
    /// 浅色毛玻璃配置裁剪视频（AVURLAsset）
    JPImageresizerConfigureType_8,
    /// 深色毛玻璃配置裁剪图片/GIF（UIImage）
    JPImageresizerConfigureType_9,
    /// 深色毛玻璃配置裁剪图片/GIF（NSData）
    JPImageresizerConfigureType_10,
    /// 深色毛玻璃配置裁剪视频（NSURL）
    JPImageresizerConfigureType_11,
    /// 深色毛玻璃配置裁剪视频（AVURLAsset）
    JPImageresizerConfigureType_12
} JPImageresizerConfigureType;
#endif /* JPIMAGERESIZER_CONFIGURE_TYPE_ENUM */
/// https://github.com/91renb/BRPickerView
#ifndef BR_TEXT_PICKER_MODE_DEFINED
#define BR_TEXT_PICKER_MODE_DEFINED
/// 文本选择器类型
typedef NS_ENUM(NSInteger, BRTextPickerMode) {
    /// 单列选择器
    BRTextPickerComponentSingle,
    /// 多列选择器
    BRTextPickerComponentMulti,
    /// 多列联动选择器
    BRTextPickerComponentCascade
};
#endif

#endif /* JobsDefine3rdEnums_h */
