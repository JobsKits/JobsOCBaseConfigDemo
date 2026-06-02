//
//  NSString+CIFilter.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+CIFilter.h"

@implementation NSString (CIFilter)
/// 根据字符串生成二维码图像
-(UIImage *_Nonnull)createQRcode{
    // 1、实例化一个滤镜
    CIFilter *filter = @"CIQRCodeGenerator".filter;
    // 1.1、设置filter的默认值
    // 因为之前如果使用过滤镜，输入有可能会被保留，因此，在使用滤镜之前，最好恢复默认设置
    [filter setDefaults];
    // 2、将传入的字符串转换为NSData
    NSData *data = self.UTF8Encoding;
    // 3、将NSData传递给滤镜（通过KVC的方式，设置inputMessage）
    filter.jobsKVC(@"inputMessage",data);
    // 4、由filter输出图像
    CIImage *outputImage = filter.outputImage;
    // 5、将CIImage转换为UIImage
    UIImage *qrImage = [UIImage imageWithCIImage:outputImage];
    // 6、返回二维码图像
    return qrImage;
}
/// 制作滤镜
-(CIFilter *_Nonnull)filter{
    return [CIFilter filterWithName:self];
}

@end
