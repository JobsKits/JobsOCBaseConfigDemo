//
//  UIImage+JobsMosaicDemo.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

#import <CoreImage/CoreImage.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JobsMosaicDemo)

-(JobsRetImageByVoidBlock _Nonnull)jobs_mosaicNormalizedImage;
-(JobsRetImageByAlphaBlock _Nonnull)jobs_mosaicPixelatedImageWithBlockSize;
-(UIImage *)jobs_mosaicPaintedImageWithMosaicImage:(UIImage *)mosaicImage
                                           centers:(NSArray <NSValue *>*)centers
                                     brushDiameter:(CGFloat)brushDiameter;

@end

@interface UIImageView (JobsMosaicDemo)

-(JobsRetFrameByCGSizeBlock _Nonnull)jobs_mosaicImageFrameForImageSize;
-(CGPoint)jobs_mosaicImagePointFromViewPoint:(CGPoint)viewPoint
                                   imageSize:(CGSize)imageSize
                                       valid:(BOOL *_Nullable)valid;

@end

NS_ASSUME_NONNULL_END
