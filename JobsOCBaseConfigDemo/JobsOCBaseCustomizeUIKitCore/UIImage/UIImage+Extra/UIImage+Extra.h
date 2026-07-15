//
//  UIImage+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_EXTRA_699525A7E8
#define JOBS_HEADER_GUARD_UIIMAGE_EXTRA_699525A7E8

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAsset.h>               // 用于处理音视频数据，支持加载和操作媒体资源。
#import <AVFoundation/AVAssetImageGenerator.h> // 用于从视频生成缩略图。
#import <AVFoundation/AVTime.h>                // 提供时间相关的功能，用于音视频处理。
#import <CoreImage/CoreImage.h>                // 提供图像处理功能，包括滤镜和特效。
#import "NSObject+Extra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extra)
/// NSString 转 UIImage
/// @param string 准备转换的字符串
/// @param font 该字符串的字号
/// @param width 该字符串的线宽
/// @param textAlignment 字符串位置
/// @param backGroundColor 背景色
/// @param textColor 字体颜色
+(UIImage *)imageWithString:(NSString *)string
                       font:(UIFont *)font
                      width:(CGFloat)width
              textAlignment:(NSTextAlignment)textAlignment
            backGroundColor:(UIColor *)backGroundColor
                  textColor:(UIColor *)textColor;
/// NSString 转 UIImage
/// @param string 准备转换的字符串
/// @param size 字符串的尺寸
+(UIImage *)createNonInterpolatedUIImageFormString:(NSString *)string
                                          withSize:(CGFloat)size;
/// 对UIImage对象进行缩放，并返回一个指定尺寸的新图像
-(JobsRetImageByCGSizeBlock _Nonnull)imageResize;
/// 图像模糊化
-(JobsRetImageByAlphaBlock _Nonnull)alpha;
/// 截取当前image对象rect区域内的图像
-(JobsRetImageByFrameBlock _Nonnull)dw_SubImageWithRect;
/// 压缩图片至指定尺寸
-(JobsRetImageByCGSizeBlock _Nonnull)dw_RescaleImageToSize;
/// 裁剪图片
-(JobsRetImageByCGSizeBlock _Nonnull)imageScaleToSize;
/// 按给定path剪裁图片
/// @param path 路径，剪裁区域
/// @param mode 填充模式
-(UIImage *)dw_ClipImageWithPath:(UIBezierPath *)path mode:(DWContentMode)mode;
/// 对系统方法 initWithData 的二次封装
+(JobsRetImageByDataBlock _Nonnull)initByData;
/// 对系统方法 imageWithData 的二次封装
+(JobsRetImageByDataBlock _Nonnull)imageWithData;
/// 对系统方法 imageWithCGImage 的二次封装
+(JobsRetImageByCGImageRefBlock _Nonnull)imageWithCGImage;
/// 对系统方法 imageWithContentsOfFile 的二次封装
+(JobsRetImageByStrBlock _Nonnull)imageWithContentsOfFile;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGE_EXTRA_699525A7E8 */
