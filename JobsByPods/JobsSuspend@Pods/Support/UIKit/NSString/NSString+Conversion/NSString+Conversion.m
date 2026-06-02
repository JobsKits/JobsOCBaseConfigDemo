//
//  NSString+Conversion.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Conversion.h"

@implementation NSString (Conversion)

+(JobsRetStrByDataBlock _Nonnull)initByUTF8Data{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
    };
}

@end
