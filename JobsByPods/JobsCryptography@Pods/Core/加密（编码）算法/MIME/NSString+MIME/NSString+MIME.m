//
//  NSString+MIME.m
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+MIME.h"

@implementation NSString (MIME)
#pragma mark —— MIME编码的数据 <==> NSString对象
///【类方法】以MIME编码的字符串数据 转换成 普通NSString对象
+(JobsRetStrByStrBlock _Nonnull)stringByMIMEData{
    return ^__kindof NSString *_Nullable(NSString *_Nullable MIMEString){
        return NSString.initByUTF8Data([NSData.alloc initWithBase64EncodedString:MIMEString options:NSDataBase64DecodingIgnoreUnknownCharacters]);
    };
}
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(JobsRetStrByVoidBlock _Nonnull)mimeData{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.stringByMIMEData(self);
    };
}
#pragma mark —— MIME编码的数据 ==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByMIMEString{
    return ^NSData *_Nullable(__kindof NSString *_Nullable MIMEString){
        return [NSData.alloc initWithBase64EncodedString:MIMEString
                                                 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    };
}
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(JobsRetDataByVoidBlock _Nonnull)dataByMIMEString{
    @jobs_weakify(self)
    return ^NSData *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.dataByMIMEString(self);
    };
}
#pragma mark —— MIME编码的数据 ==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByMIMEString{
    return ^UIImage *_Nullable(NSString *_Nullable MIMEString){
        return UIImage.imageByData(NSData.dataByMIMEString(MIMEString));
    };
}
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(JobsRetImageByVoidBlock _Nonnull)imageByMIMEString{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.imageByMIMEString(self);
    };
}

@end
