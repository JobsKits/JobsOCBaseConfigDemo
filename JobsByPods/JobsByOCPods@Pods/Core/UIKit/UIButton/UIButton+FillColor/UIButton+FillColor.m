//
//  UIButton+FillColor.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButton+FillColor.h"

@implementation UIButton (FillColor)
#pragma mark —— Associated Object (titleName)
static const void *kUIButtonTitleNameKey = &kUIButtonTitleNameKey;
@dynamic titleName;
- (void)setTitleName:(NSString *)titleName {
    objc_setAssociatedObject(self,
                             kUIButtonTitleNameKey,
                             titleName,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)titleName {
    return objc_getAssociatedObject(self, kUIButtonTitleNameKey);
}
#pragma mark —— Background Color For State
- (void)by_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    UIImage *img = [UIButton by_imageWithColor:backgroundColor];
    [self setBackgroundImage:img forState:state];
}
/// 生成 1×1 纯色图，并做成可拉伸
+(UIImage *)by_imageWithColor:(UIColor *)color {
    if (!color) { return nil; }
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // 可拉伸，避免某些情况下的边缘采样问题
    return [image resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
}

@end
