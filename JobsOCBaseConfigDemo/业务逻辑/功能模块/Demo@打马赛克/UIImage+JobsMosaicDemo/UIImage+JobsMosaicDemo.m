//
//  UIImage+JobsMosaicDemo.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "UIImage+JobsMosaicDemo.h"

@implementation UIImage (JobsMosaicDemo)
-(JobsRetImageByVoidBlock _Nonnull)jobs_mosaicNormalizedImage{
    @jobs_weakify(self)
    return ^UIImage *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.imageOrientation == UIImageOrientationUp) return self;
        UIGraphicsBeginImageContextWithOptions(self.size,
                                               NO,
                                               self.scale);
        [self drawInRect:CGRectMake(0,
                                    0,
                                    self.size.width,
                                    self.size.height)];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image ?: self;
    };
}

-(JobsRetImageByAlphaBlock _Nonnull)jobs_mosaicPixelatedImageWithBlockSize{
    @jobs_weakify(self)
    return ^UIImage *(CGFloat blockSize){
        @jobs_strongify(self)
        if (!self) return nil;
        UIImage *image = self.jobs_mosaicNormalizedImage();
        if (!image.CGImage) return image;
        CIImage *inputImage = [[CIImage alloc] initWithImage:image];
        if (!inputImage) return image;
        CIFilter *filter = [CIFilter filterWithName:@"CIPixellate"];
        [filter setValue:inputImage
                  forKey:kCIInputImageKey];
        [filter setValue:@(MAX(blockSize, 1))
                  forKey:kCIInputScaleKey];
        [filter setValue:[CIVector vectorWithX:CGRectGetMidX(inputImage.extent)
                                             Y:CGRectGetMidY(inputImage.extent)]
                  forKey:kCIInputCenterKey];
        CIImage *outputImage = [filter.outputImage imageByCroppingToRect:inputImage.extent];
        if (!outputImage) return image;
        static CIContext *context = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            context = [CIContext contextWithOptions:nil];
        });
        CGImageRef cgImage = [context createCGImage:outputImage
                                           fromRect:inputImage.extent];
        if (!cgImage) return image;
        UIImage *resultImage = [UIImage imageWithCGImage:cgImage
                                                   scale:image.scale
                                             orientation:UIImageOrientationUp];
        CGImageRelease(cgImage);
        return resultImage ?: image;
    };
}

-(UIImage *)jobs_mosaicPaintedImageWithMosaicImage:(UIImage *)mosaicImage
                                           centers:(NSArray<NSValue *> *)centers
                                     brushDiameter:(CGFloat)brushDiameter{
    UIImage *baseImage = self.jobs_mosaicNormalizedImage();
    UIImage *pixelImage = mosaicImage.jobs_mosaicNormalizedImage();
    if (!baseImage.CGImage || !pixelImage.CGImage || !centers.count) return baseImage;
    CGRect imageRect = CGRectMake(0,
                                  0,
                                  baseImage.size.width,
                                  baseImage.size.height);
    CGFloat diameter = MAX(brushDiameter, 1);
    UIGraphicsBeginImageContextWithOptions(baseImage.size,
                                           NO,
                                           baseImage.scale);
    [baseImage drawInRect:imageRect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (NSValue *pointValue in centers) {
        CGPoint center = pointValue.CGPointValue;
        CGRect brushRect = CGRectMake(center.x - diameter / 2.0,
                                      center.y - diameter / 2.0,
                                      diameter,
                                      diameter);
        CGContextSaveGState(context);
        CGContextAddEllipseInRect(context,
                                  brushRect);
        CGContextClip(context);
        [pixelImage drawInRect:imageRect];
        CGContextRestoreGState(context);
    }
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage ?: baseImage;
}

@end

@implementation UIImageView (JobsMosaicDemo)
-(JobsRetFrameByCGSizeBlock _Nonnull)jobs_mosaicImageFrameForImageSize{
    @jobs_weakify(self)
    return ^CGRect(CGSize imageSize){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        if (imageSize.width <= 0 || imageSize.height <= 0 || CGRectIsEmpty(self.bounds)) return CGRectZero;
        CGFloat widthScale = CGRectGetWidth(self.bounds) / imageSize.width;
        CGFloat heightScale = CGRectGetHeight(self.bounds) / imageSize.height;
        CGFloat scale = self.contentMode == UIViewContentModeScaleAspectFill ? MAX(widthScale, heightScale) : MIN(widthScale, heightScale);
        CGSize displaySize = CGSizeMake(imageSize.width * scale,
                                        imageSize.height * scale);
        return CGRectMake((CGRectGetWidth(self.bounds) - displaySize.width) / 2.0,
                          (CGRectGetHeight(self.bounds) - displaySize.height) / 2.0,
                          displaySize.width,
                          displaySize.height);
    };
}

-(CGPoint)jobs_mosaicImagePointFromViewPoint:(CGPoint)viewPoint
                                   imageSize:(CGSize)imageSize
                                       valid:(BOOL *)valid{
    CGRect imageFrame = self.jobs_mosaicImageFrameForImageSize(imageSize);
    BOOL inside = !CGRectIsEmpty(imageFrame) && CGRectContainsPoint(imageFrame,
                                                                    viewPoint);
    if (valid) *valid = inside;
    if (!inside) return CGPointZero;
    CGPoint imagePoint = CGPointMake((viewPoint.x - CGRectGetMinX(imageFrame)) / CGRectGetWidth(imageFrame) * imageSize.width,
                                     (viewPoint.y - CGRectGetMinY(imageFrame)) / CGRectGetHeight(imageFrame) * imageSize.height);
    return imagePoint;
}

@end
