//
//  NSURLRequest+Extra.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSURLRequest+Extra.h"

@implementation NSURLRequest (Extra)

+(JobsRetURLRequestByURLBlock _Nonnull)initBy{
    return ^__kindof NSURLRequest *_Nullable(NSURL *_Nullable url){
        return [NSURLRequest requestWithURL:url];
    };
}
/// 打印NSURLRequest有效内容，并转化为NSMutableURLRequest对外输出
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)print{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *_Nullable(){
        @jobs_strongify(self)
        JobsLog(@"请求URL:%@\n", self.URL);
        JobsLog(@"请求方式:%@\n", self.HTTPMethod);
        JobsLog(@"请求头信息:%@\n", self.allHTTPHeaderFields);
        JobsLog(@"请求正文信息:%@\n", self.HTTPBody.stringByUTF8Encoding);
        JobsLog(@"请求响应时间:%@\n", self.currentTimestampString(nil));
        return self.mutableCopy;
    };
}

@end
