//
//  UIImage+YBGIF.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_YBGIF_17DB6BBDC6
#define JOBS_HEADER_GUARD_UIIMAGE_YBGIF_17DB6BBDC6

#import <ImageIO/ImageIO.h> // 提供图像编解码能力，支持多种图片格式的读取、写入和元数据处理。
#import <UIKit/UIKit.h>
#import "NSMutableArray+Extra.h"
#import "NSString+Path.h"
#import "NSObject+image.h"
#import "NSString+Replace.h"
#import "UIImage+Extra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YBGIF)
/// 根据NSData* 创建gif图片
+(JobsRetImageByDataBlock _Nonnull)animatedGIFWithData;
/// 根据图片名字创建gif图片
+(JobsRetImageByStrBlock _Nonnull)animatedGIFByName;
/// 貌似废弃了，不管用，再研究
/// 根据大小裁剪图片
-(JobsRetImageByCGSizeBlock _Nonnull)animatedImageByScalingAndCroppingBySize;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGE_YBGIF_17DB6BBDC6 */
