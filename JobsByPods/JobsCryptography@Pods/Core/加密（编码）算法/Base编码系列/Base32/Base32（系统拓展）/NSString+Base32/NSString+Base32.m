//
//  NSString+Base32.m
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Base32.h"

@implementation NSString (Base32)
#pragma mark —— Base32 <==> NSString
///【类方法】以Base32编码的字符串 转换为 普通的字符串
+(JobsRetStrByStrBlock _Nonnull)stringByBase32String{
    return ^__kindof NSString *_Nullable(NSString *_Nullable base32String){
        NSData *utf8encoding = MF_Base32Codec.dataFromBase32String(base32String);
        return NSString.initByUTF8Data(utf8encoding);
    };
}
///【实例方法】以Base32编码的字符串 转换为 普通的字符串
-(JobsRetStrByVoidBlock _Nonnull)stringByBase32String{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSData *utf8encoding = MF_Base32Codec.dataFromBase32String(self);
        return NSString.initByUTF8Data(utf8encoding);
    };
}
///【类方法】普通的字符串 转换为 以Base32编码的字符串
+(JobsRetStrByStrBlock _Nonnull)base32String{
    return ^__kindof NSString *_Nullable(NSString *_Nullable string){
        return MF_Base32Codec.base32StringFromData(string.jobsUTF8Encoding());
    };
}
///【实例方法】普通的字符串 转换为 以Base32编码的字符串
-(JobsRetStrByVoidBlock _Nonnull)base32String{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return MF_Base32Codec.base32StringFromData(self.jobsUTF8Encoding());
    };
}
#pragma mark —— Base32 <==> UIImage
///【类方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
+(JobsRetImageByStrBlock _Nonnull)imageByBase32String{
    return ^UIImage *_Nullable(NSString *_Nullable base32String){
        return UIImage.imageByData(NSData.dataWithBase32String(base32String));
    };
}
///【实例方法】将以Base32编码的字符串 转换为 NSData对象，然后再转成UIImage
-(JobsRetImageByVoidBlock _Nonnull)imageByBase32String{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
       return UIImage.imageByData(NSData.dataWithBase32String(self));
    };
}
#pragma mark —— Base32 <==> NSData
/// 将Base32编码的字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataWithBase32String{
    return ^NSData *_Nullable(__kindof NSString *_Nullable base32String){
       return MF_Base32Codec.dataFromBase32String(base32String);
    };
}
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(JobsRetDataByVoidBlock _Nonnull)dataWithBase32String{
    @jobs_weakify(self)
    return ^NSData *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return MF_Base32Codec.dataFromBase32String(self);
    };
}

@end
