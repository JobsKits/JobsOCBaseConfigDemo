//
//  JobsResponseModel+YTKNetwork.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsResponseModel+YTKNetwork.h"
#import <objc/runtime.h>

@implementation JobsResponseModel (YTKNetwork)

-(HTTPResponseCode)code{
    NSNumber *code = objc_getAssociatedObject(self, @selector(code));
    return (HTTPResponseCode)code.integerValue;
}

-(void)setCode:(HTTPResponseCode)code{
    objc_setAssociatedObject(self, @selector(code), @(code), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    @jobs_weakify(self)
    [(id<YTKNetworkProtocols>)self jobsHandelHTTPResponseCode:code
                                                  actionBlock:^(HTTPResponseCode data) {
        @jobs_strongify(self)
        if(data == HTTPResponseCodeNoOK) toastBy(self.msg);
    }];
}

@end
