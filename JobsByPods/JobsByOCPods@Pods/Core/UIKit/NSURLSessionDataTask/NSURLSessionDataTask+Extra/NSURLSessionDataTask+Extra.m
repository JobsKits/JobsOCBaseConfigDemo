//
//  NSURLSessionDataTask+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSURLSessionDataTask+Extra.h"

@implementation NSURLSessionDataTask (Extra)
/// 打印请求体
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)print{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *_Nullable(){
        @jobs_strongify(self)
        return self.originalRequest.print();
    };
}

@end
