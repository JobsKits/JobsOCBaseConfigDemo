//
//  NSURLRequest+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#import "NSURLRequest+Extra.h"
#import <YTKNetworkExtra/NSObject+YTKNetwork.h>

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
        JobsPrintURLRequest(self);
        return self.mutableCopy;
    };
}

@end
