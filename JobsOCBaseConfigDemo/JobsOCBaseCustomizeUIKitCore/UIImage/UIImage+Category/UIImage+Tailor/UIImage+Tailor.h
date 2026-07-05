//
//  UIImage+Tailor.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_TAILOR_01CF861DFD
#define JOBS_HEADER_GUARD_UIIMAGE_TAILOR_01CF861DFD

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Tailor)
/// 以图片中心为中心，以最小边为边长，裁剪正方形图片
+(JobsRetImageByImageBlock _Nonnull)cropSquareImage;
///生成一张圆形图片
+(JobsRetImageByImageBlock _Nonnull)imageWithClipImage;
/**
 *  生成一张带有边框的圆形图片
 *
 *  @param borderW     边框宽度
 *  @param borderColor 边框颜色
 *  @param image       要添加边框的图片
 *
 *  @return 生成的带有边框的圆形图片
 */
+(UIImage *)imageWithBorder:(CGFloat)borderW
                      color:(UIColor *)borderColor
                      image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGE_TAILOR_01CF861DFD */
