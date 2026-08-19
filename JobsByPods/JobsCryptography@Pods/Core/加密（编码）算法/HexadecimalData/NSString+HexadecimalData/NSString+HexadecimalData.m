//
//  NSString+HexadecimalData.m
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+HexadecimalData.h"

@implementation NSString (HexadecimalData)
#pragma mark —— HexadecimalData <==> NSString
///【类方法】16进制字符串 转换成 普通的NSString对象
+(JobsRetStrByStrBlock _Nonnull)stringByHexString{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable hexString){
        return jobsMakeMutString(^(__kindof NSMutableString * _Nullable string) {
            for (int i = 0; i < hexString.length; i += 2) {
                NSString *hex = hexString.substringWithRange(NSMakeRange(i, 2));
                NSScanner *scanner = [NSScanner scannerWithString:hex];
                unsigned int intValue;
                [scanner scanHexInt:&intValue];
                [string appendFormat:@"%c", (char)intValue];
            }
        });
    };
}
///【实例方法】16进制字符串 转换成 普通的NSString对象
-(JobsRetStrByVoidBlock _Nonnull)stringByHexString{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.stringByHexString(self);
    };
}
///【类方法】普通的NSString对象 转换成 16进制字符串
+(JobsRetStrByStrBlock _Nonnull)hexStringByString{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable string){
        NSData *data = string.jobsUTF8Encoding();
        NSMutableString *hexString = NSMutableString.initByCapacity(data.length * 2);
        const unsigned char *bytes = data.bytes;
        for (int i = 0; i < data.length; ++i) {
            [hexString appendFormat:@"%02x", bytes[i]];
        };return hexString;
    };
}
///【实例方法】普通的NSString对象 转换成 16进制字符串
-(JobsRetStrByVoidBlock _Nonnull)hexStringByString{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.hexStringByString(self);
    };
}
#pragma mark —— HexadecimalData ==> UIImage
///【类方法】16进制字符串 转换为 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByHexString{
    return ^UIImage *_Nullable(__kindof NSString *_Nullable hexString){
        return UIImage.initByData(jobsMakeMutData(^(__kindof NSMutableData * _Nullable imageData) {
            for (int i = 0; i + 1 < hexString.length; i += 2) {
                NSString *hexByte = hexString.substringWithRange(NSMakeRange(i, 2));
                NSScanner *scanner = [NSScanner scannerWithString:hexByte];
                unsigned int byteValue;
                [scanner scanHexInt:&byteValue];
                uint8_t byte = (uint8_t)byteValue;
                [imageData appendBytes:&byte length:1];
            }
        }));
    };
}
///【实例方法】16进制字符串 转换为 UIImage对象
-(JobsRetImageByVoidBlock _Nonnull)imageByHexString{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.imageByHexString(self);
    };
}
#pragma mark —— HexadecimalData ==> NSData
///【类方法】16进制字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByHexString{
    return ^__kindof NSData *_Nullable(__kindof NSString *_Nullable hexString){
        return jobsMakeMutData(^(__kindof NSMutableData * _Nullable data) {
            for (int i = 0; i + 1 < hexString.length; i += 2) {
                NSString *hexByte = hexString.substringWithRange(NSMakeRange(i, 2));
                NSScanner *scanner = [NSScanner scannerWithString:hexByte];
                unsigned int byteValue;
                [scanner scanHexInt:&byteValue];
                uint8_t byte = (uint8_t)byteValue;
                [data appendBytes:&byte length:1];
            }
        }).copy;
    };
}
///【实例方法】16进制字符串 转换为 NSData对象
-(JobsRetDataByVoidBlock _Nonnull)dataByHexString{
    @jobs_weakify(self)
    return ^NSData *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.dataByHexString(self);
    };
}

@end
