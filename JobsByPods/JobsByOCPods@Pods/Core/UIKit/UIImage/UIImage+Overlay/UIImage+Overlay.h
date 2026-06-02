//
//  UIImage+Overlay.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMAGE_OVERLAY_74BFEDC591
#define JOBS_HEADER_GUARD_UIIMAGE_OVERLAY_74BFEDC591

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Overlay)
///融合两个图片为一个新图
+(UIImage *)addImage:(UIImage *)image1
           withImage:(UIImage *)image2
   image2Coefficient:(CGFloat)image2Coefficient;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMAGE_OVERLAY_74BFEDC591 */
