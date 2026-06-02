//
//  NSString+Extra.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
/// 对系统方法 initWithData.NSUTF8StringEncoding 的二次封装
+(JobsRetStrByDataBlock _Nonnull)initByUTF8Data{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
    };
}
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        @jobs_strongify(self)
        if(!str) str = JobsEmpty;
        /// 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([self stringByAppendingString:str]);// 原始字符串不会改变，输出一个新的字符串
    };
}
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSCharacterSet *_Nullable data){
        @jobs_strongify(self)
        return [self stringByTrimmingCharactersInSet:data];
    };
}


@end
