//
//  JobsAppDoorResource.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsAppDoorResource.h"

@interface JobsAppDoorResourceToken : NSObject

@end

@implementation JobsAppDoorResourceToken

@end


NSBundle *JobsAppDoorResourceBundle(void){
    static NSBundle *resourceBundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSBundle *classBundle = [NSBundle bundleForClass:JobsAppDoorResourceToken.class];
        NSArray<NSBundle *> *candidateBundles = classBundle == NSBundle.mainBundle ?
            @[classBundle] : @[classBundle,NSBundle.mainBundle];
        for (NSBundle *candidateBundle in candidateBundles) {
            NSURL *bundleURL = [candidateBundle URLForResource:@"JobsAppDoorCore"
                                                 withExtension:@"bundle"];
            if (!bundleURL) continue;
            resourceBundle = [NSBundle bundleWithURL:bundleURL];
            if (resourceBundle) break;
        }
        if (!resourceBundle) resourceBundle = classBundle;
    });return resourceBundle;
}

UIImage *_Nullable JobsAppDoorImageNamed(NSString *_Nullable imageName){
    if (![imageName isKindOfClass:NSString.class] || !imageName.length) return nil;
    UIImage *image = [UIImage imageNamed:imageName
                                inBundle:JobsAppDoorResourceBundle()
           compatibleWithTraitCollection:nil];
    if (!image) {
        image = [UIImage imageNamed:[@"Images" stringByAppendingPathComponent:imageName]
                           inBundle:JobsAppDoorResourceBundle()
      compatibleWithTraitCollection:nil];
    };return image ? : [UIImage imageNamed:imageName];
}

UIImage *_Nullable JobsAppDoorCustomerServiceIconImage(void){
    static UIImage *customerServiceIconImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIImage *sourceImage = JobsAppDoorImageNamed(@"zaixiankefu_zh-Hans");
        CGImageRef sourceCGImage = sourceImage.CGImage;
        if (!sourceCGImage) {
            customerServiceIconImage = JobsAppDoorImageNamed(@"用户名称");
            return;
        }
        CGFloat sourceWidth = CGImageGetWidth(sourceCGImage);
        CGFloat sourceHeight = CGImageGetHeight(sourceCGImage);
        CGFloat cropSide = sourceHeight * 0.72f;
        CGRect cropRect = CGRectMake(sourceWidth * 0.25f,
                                     sourceHeight * 0.14f,
                                     cropSide,
                                     cropSide);
        CGImageRef croppedCGImage = CGImageCreateWithImageInRect(sourceCGImage,cropRect);
        if (!croppedCGImage) return;
        /// 原资源把头像与黄色底图烘焙在一起；这里只抠除黄色，保留耳麦头像作为按钮前景图。
        size_t pixelWidth = CGImageGetWidth(croppedCGImage);
        size_t pixelHeight = CGImageGetHeight(croppedCGImage);
        size_t bytesPerRow = pixelWidth * 4;
        uint8_t *bitmapData = calloc(pixelHeight,bytesPerRow);
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = bitmapData ?
            CGBitmapContextCreate(bitmapData,
                                  pixelWidth,
                                  pixelHeight,
                                  8,
                                  bytesPerRow,
                                  colorSpace,
                                  kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast) : nil;
        if (context) {
            CGContextDrawImage(context,CGRectMake(0,0,pixelWidth,pixelHeight),croppedCGImage);
            for (size_t y = 0; y < pixelHeight; y++) {
                for (size_t x = 0; x < pixelWidth; x++) {
                    uint8_t *pixel = bitmapData + y * bytesPerRow + x * 4;
                    CGFloat maskAlpha = MAX(0.0f,MIN(1.0f,(165.0f - pixel[1]) / 70.0f));
                    pixel[0] = (uint8_t)(pixel[0] * maskAlpha);
                    pixel[1] = (uint8_t)(pixel[1] * maskAlpha);
                    pixel[2] = (uint8_t)(pixel[2] * maskAlpha);
                    pixel[3] = (uint8_t)(pixel[3] * maskAlpha);
                }
            }
            /// 补齐耳麦的麦克风杆，让 18pt 小尺寸下仍能一眼识别为客服头像。
            CGContextSetRGBStrokeColor(context,0.42f,0.17f,0.01f,1.0f);
            CGContextSetRGBFillColor(context,0.42f,0.17f,0.01f,1.0f);
            CGContextSetLineWidth(context,pixelWidth * 0.045f);
            CGContextSetLineCap(context,kCGLineCapRound);
            CGContextMoveToPoint(context,pixelWidth * 0.76f,pixelHeight * 0.62f);
            CGContextAddCurveToPoint(context,
                                     pixelWidth * 0.84f,pixelHeight * 0.54f,
                                     pixelWidth * 0.82f,pixelHeight * 0.43f,
                                     pixelWidth * 0.67f,pixelHeight * 0.43f);
            CGContextStrokePath(context);
            CGContextFillEllipseInRect(context,
                                       CGRectMake(pixelWidth * 0.63f,
                                                  pixelHeight * 0.40f,
                                                  pixelWidth * 0.08f,
                                                  pixelHeight * 0.08f));
            CGImageRef iconCGImage = CGBitmapContextCreateImage(context);
            if (iconCGImage) {
                customerServiceIconImage = [UIImage imageWithCGImage:iconCGImage
                                                               scale:sourceImage.scale
                                                         orientation:sourceImage.imageOrientation];
                CGImageRelease(iconCGImage);
            }
        }
        if (context) CGContextRelease(context);
        if (colorSpace) CGColorSpaceRelease(colorSpace);
        if (bitmapData) free(bitmapData);
        CGImageRelease(croppedCGImage);
        if (!customerServiceIconImage) customerServiceIconImage = JobsAppDoorImageNamed(@"用户名称");
    });return customerServiceIconImage;
}

NSURL *_Nullable JobsAppDoorResourceURL(NSString *_Nullable resourceName){
    if (![resourceName isKindOfClass:NSString.class] || !resourceName.length) return nil;
    NSString *resourceExtension = resourceName.pathExtension;
    NSString *resourceBaseName = resourceExtension.length ? resourceName.stringByDeletingPathExtension : resourceName;
    NSURL *resourceURL = [JobsAppDoorResourceBundle() URLForResource:resourceBaseName
                                                      withExtension:resourceExtension.length ? resourceExtension : nil];
    if (!resourceURL) {
        resourceURL = [JobsAppDoorResourceBundle() URLForResource:resourceBaseName
                                                    withExtension:resourceExtension.length ? resourceExtension : nil
                                                     subdirectory:@"Videos"];
    }
    if (!resourceURL) {
        resourceURL = [NSBundle.mainBundle URLForResource:resourceBaseName
                                            withExtension:resourceExtension.length ? resourceExtension : nil];
    };return resourceURL;
}
