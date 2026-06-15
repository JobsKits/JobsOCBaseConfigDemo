//
//  NSString+Extra.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (JobsLinkageMenuViewExtra)
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
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl{
    NSString *checkStr = @"https://".add(@"http://");
    return [self rangeOfString:checkStr].location != NSNotFound;
}
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
-(JobsRetStrByStrBlock _Nonnull)initByContentsOfFile{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable filePath){
        NSError *error = nil;
        NSString *string = [NSString.alloc initWithContentsOfFile:filePath
                                                         encoding:NSUTF8StringEncoding
                                                            error:&error];
        if(error){
            JobsLog(@"error = %@",error);
            return nil;
        }else return string;
    };
}

@end
