//
//  NSURL+Others.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import "NSURL+Others.h"

@implementation NSURL (Others)
/// 对系统方法 fileURLWithPath 的二次封装
+(JobsRetURLByStrBlock _Nonnull)fileURLWithPath{
    return ^NSURL *_Nullable(__kindof NSString *_Nullable data){
        return NSURL.fileURLWithPath(data);
    };
}
///  能否正常打开Url
-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanOpenUrl{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [UIApplication.sharedApplication canOpenURL:self];
    };
}
/// 图片URL路径补齐
-(NSURL *)imageURLPlus{
    return (((JobsRetURLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSURL.class, @selector(jobsImageURLPlus)))(self, @selector(jobsImageURLPlus)))();
}
-(JobsRetURLByVoidBlock _Nonnull)jobsImageURLPlus{
    @jobs_weakify(self)
    return ^NSURL *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if(!This.BaseUrl_Image() || !This.jobsBaseUrl()) return self;
        if(!self.absoluteString.containsString(HTTP) && isValue(self.absoluteString)){
            return (isValue(This.BaseUrl_Image()) ? This.BaseUrl_Image() : This.jobsBaseUrl()).add(self.absoluteString).jobsURL();
        }else return self;
    };
}
/// 一般的URL路径补齐
-(JobsRetURLByVoidBlock _Nonnull)normalURLPlus{
    @jobs_weakify(self)
    return ^NSURL *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if(!This.BaseUrl_Image()) return self;
        if(!self.absoluteString.containsString(HTTP) && isValue(self.absoluteString)){
            return This.BaseUrl_Image().add(self.absoluteString).jobsURL();
        }else return self;
    };
}
/// NSString + NSURL => NSURL
-(JobsRetURLByStrBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSURL *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        if(!data) data = @"";
        /// 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return self.absoluteString.add(data).jobsURL();
    };
}
/// NSURL + NSURL => NSURL
-(JobsRetURLByURLBlock _Nonnull)Add{
    @jobs_weakify(self)
    return ^NSURL *_Nullable(NSURL *_Nullable data) {
        @jobs_strongify(self)
        /// 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return self.absoluteString.add(data.absoluteString ? : @"").jobsURL();
    };
}
/// NSURL => NSURLRequest
-(NSMutableURLRequest *)URLRequest{
    return (((JobsRetMutableURLRequestByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSURL.class, @selector(jobsURLRequest)))(self, @selector(jobsURLRequest)))();
}

-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSURLRequest.initBy(self).mutableCopy;
    };
}

@end
