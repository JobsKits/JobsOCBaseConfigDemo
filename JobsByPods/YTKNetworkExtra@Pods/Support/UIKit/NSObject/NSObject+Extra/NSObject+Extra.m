//
//  NSObject+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#import "NSObject+Extra.h"
#import <YTKNetworkExtra/NSURLRequest+Extra.h>

@implementation NSObject (YTKNetworkExtraExtra)
/// 万能解析
+(JobsRetIDByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^id _Nullable(id _Nullable data){
        @jobs_strongify(self)
        if(KindOfDicCls(data)) return [self.class mj_objectWithKeyValues:data];
        if(KindOfArrCls(data)) return [self.class mj_objectArrayWithKeyValuesArray:data];
        return nil;
    };
}
/// 打印请求体
-(JobsRetURLRequestByURLSessionTaskBlock _Nullable)printURLSessionRequestMessage{
    return ^__kindof NSMutableURLRequest *_Nullable(__kindof NSURLSessionDataTask *_Nullable task) {
        if(!task){JobsLog(@"NSURLSessionDataTask *task 为空,请检查");return nil;
};return task.originalRequest.print();
    };
}
/// 打印URLRequest
-(JobsRetMutableURLRequestByURLRequestBlock _Nullable)printRequestMessage{
    return ^__kindof NSMutableURLRequest *_Nullable(__kindof NSURLRequest *_Nullable data) {
        if (!data) {JobsLog(@"NSURLRequest *data 为空,请检查");return nil;
};return data.print();
    };
}

@end
