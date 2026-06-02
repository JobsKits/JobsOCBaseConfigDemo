//
//  NSString+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
/// 对系统方法 initWithData.NSUTF8StringEncoding 的二次封装
+(JobsRetStrByDataBlock _Nonnull)initByUTF8Data{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
    };
}

@end
