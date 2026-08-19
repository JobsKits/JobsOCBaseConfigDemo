//
//  NSData+MIME.m
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSData+MIME.h"

@implementation NSData (MIME)
#pragma mark —— MIME编码的数据 <==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByMIMEString{
    return ^NSData *_Nullable(__kindof NSString *_Nullable MIMEString){
        return [NSData.alloc initWithBase64EncodedString:MIMEString
                                                 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    };
}
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(JobsRetDataByStrBlock _Nonnull)dataByMIMEString{
    @jobs_weakify(self)
    return ^NSData *_Nullable(NSString *_Nonnull MIMEString){
        @jobs_strongify(self)
        if (!self) return nil;
        return NSData.dataByMIMEString(MIMEString);
    };
}
///【类方法】NSData对象 转换成 以MIME编码的数据
+(JobsRetStrByDataBlock _Nonnull)MIMEStringByImage{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    };
}
///【实例方法】NSData对象 转换成 以MIME编码的数据
-(JobsRetStrByVoidBlock _Nonnull)MIMEStringByImage{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSData.MIMEStringByImage(self);
    };
}

@end
