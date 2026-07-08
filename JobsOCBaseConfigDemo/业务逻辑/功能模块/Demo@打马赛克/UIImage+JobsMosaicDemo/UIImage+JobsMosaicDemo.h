//
//  UIImage+JobsMosaicDemo.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JobsMosaicDemo)

-(UIImage *)jobs_mosaicNormalizedImage;
-(UIImage *)jobs_mosaicPixelatedImageWithBlockSize:(CGFloat)blockSize;
-(UIImage *)jobs_mosaicPaintedImageWithMosaicImage:(UIImage *)mosaicImage
                                           centers:(NSArray <NSValue *>*)centers
                                     brushDiameter:(CGFloat)brushDiameter;

@end

@interface UIImageView (JobsMosaicDemo)

-(CGRect)jobs_mosaicImageFrameForImageSize:(CGSize)imageSize;
-(CGPoint)jobs_mosaicImagePointFromViewPoint:(CGPoint)viewPoint
                                   imageSize:(CGSize)imageSize
                                       valid:(BOOL *_Nullable)valid;

@end

NS_ASSUME_NONNULL_END
