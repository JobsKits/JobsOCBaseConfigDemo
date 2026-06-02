//
//  UIImageView+GIF.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGEVIEW_GIF_E7B5D56465
#define JOBS_HEADER_GUARD_UIIMAGEVIEW_GIF_E7B5D56465

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h> // 提供图像编解码能力，支持多种图片格式的读取、写入和元数据处理。

@interface UIImageView (GIF)
/**
 *  输入路径，返回一个 UIImageView
 *
 *  @param file  路径
 *  @param frame frame
 *
 *  @return      UIImageView
 */
+ (UIImageView *)imageViewWithGIFFile:(NSString *)file
                                frame:(CGRect)frame;

@end
#endif /* JOBS_HEADER_GUARD_UIIMAGEVIEW_GIF_E7B5D56465 */
