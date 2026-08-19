//
//  NSString+URL.m
//  GKCustomNavigationBarExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+URL.h"

@implementation NSString (URL)
/// 返回网址相关的NSURL *
-(NSURL *)jobsUrl{
    return (((JobsRetURLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsURL)))(self, @selector(jobsURL)))();
}
-(JobsRetURLByVoidBlock _Nonnull)jobsURL{
    @jobs_weakify(self)
    return ^NSURL *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *s = self.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        if (!isValue(s)) { return nil; }
        if ([s hasPrefix:@"//"]) { s = @"https:".add(s); }
        // 允许中文与特殊字符
        NSString *encoded = [s stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLFragmentAllowedCharacterSet];
        return [NSURL URLWithString:encoded ?: s];
    };
}
/// NSString => NSURLRequest
-(NSMutableURLRequest *)URLRequest{
    return (((JobsRetMutableURLRequestByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsURLRequest)))(self, @selector(jobsURLRequest)))();
}

-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSURLRequest.initBy(self.jobsURL()).mutableCopy;
    };
}
/// 返回文件路径相关的NSURL *
/// 增加file://
-(JobsRetURLByVoidBlock _Nonnull)jobsFileUrl{
    @jobs_weakify(self)
    return ^NSURL *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSURL fileURLWithPath:self];
    };
}
///  能否正常打开Url
-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanOpenUrl{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [UIApplication.sharedApplication canOpenURL:self.jobsURL()];
    };
}
/**

     问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
     解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *)urlProtect{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsURLProtect)))(self, @selector(jobsURLProtect)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsURLProtect{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if ([self containsString:零宽转义字符]) {
            return self.remove200BMark();
        }else return self;
    };
}

-(NSString *)byHttp{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsByHttp)))(self, @selector(jobsByHttp)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsByHttp{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return HTTPHeader.add(self).jobsURLProtect();
    };
}

-(NSString *)byHttps{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsByHttps)))(self, @selector(jobsByHttps)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsByHttps{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return HTTPSHeader.add(self).jobsURLProtect();
    };
}

@end
