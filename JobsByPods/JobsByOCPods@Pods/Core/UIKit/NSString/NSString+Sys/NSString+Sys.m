//
//  NSString+Sys.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Sys.h"

@implementation NSString (JobsByOCPodsSys)
-(UIColor *)cor{
    return UIColor.jobsCor(self);
}

-(UIColor *)namedCor{
    return [UIColor colorNamed:self];
}
/// 取UIStoryboard
-(JobsRetStoryboardByBundleBlock _Nonnull)sbByBundle{
    @jobs_weakify(self)
    return ^__kindof UIStoryboard *_Nullable(NSBundle *_Nullable bundle){
        @jobs_strongify(self)
        return [UIStoryboard storyboardWithName:self bundle:bundle];
    };
}
/// 对系统方法 substringFromIndex 的二次封装
-(JobsRetStrByUIntegerBlock _Nonnull)substringFromIndex{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self substringFromIndex:data];
    };
}
/// 对系统方法 substringToIndex 的二次封装
-(JobsRetStrByUIntegerBlock _Nonnull)substringToIndex{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self substringToIndex:data];
    };
}
/// 对系统方法 substringWithRange 的二次封装
-(JobsRetStrByRangeBlock _Nonnull)substringByRange{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSRange data){
        @jobs_strongify(self)
        return [self substringWithRange:data];
    };
}
/// 对系统方法 rangeOfString 的二次封装
-(JobsRetRangeByStrBlock _Nonnull)rangeOfString{
    @jobs_weakify(self)
    return ^NSRange(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self rangeOfString:data];
    };
}
/// 对系统方法 rangeOfString 的二次封装（当执行参数是本字符串时）
-(NSRange)range{
    return [self rangeOfString:self];
}
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSCharacterSet *_Nullable data){
        @jobs_strongify(self)
        return [self stringByTrimmingCharactersInSet:data];
    };
}
/// 对系统方法 characterAtIndex 的二次封装
-(JobsRetUnsignedShortByNSUIntegerBlock _Nonnull)characterAtIndex{
    @jobs_weakify(self)
    return ^unichar(NSUInteger data){
        @jobs_strongify(self)
        return [self characterAtIndex:data];
    };
}
/// 对系统方法 stringWithCapacity 的二次封装
+(JobsRetStrByUIntegerBlock _Nonnull)initByCapacity{
    return ^NSMutableString *_Nullable(NSUInteger data){
        return [NSMutableString stringWithCapacity:data];
    };
}
/// 对系统方法 - (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
+(JobsRetStrByStrBlock _Nonnull)initByContentsOfFile{
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
/// 对系统方法 - (nullable instancetype)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error; 的二次封装
+(JobsRetStrByURLBlock _Nonnull)initByContentsOfURL{
    return ^__kindof NSString *_Nullable(NSURL *_Nullable url){
        NSError *error = nil;
        NSString *string = [NSString.alloc initWithContentsOfURL:url
                                                        encoding:NSUTF8StringEncoding
                                                           error:&error];
        if(error){
            JobsLog(@"error = %@",error);
            return nil;
        }else return string;
    };
}

@end
