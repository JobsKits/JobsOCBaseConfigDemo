//
//  JobsResponseModel+YTKNetwork.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsResponseModel+YTKNetwork.h"

@implementation JobsResponseModel (YTKNetwork)
JobsKey(_code)
@dynamic code;

-(HTTPResponseCode)code{
    NSNumber *code = Jobs_getAssociatedObject(_code);
    return (HTTPResponseCode)code.integerValue;
}

-(void)setCode:(HTTPResponseCode)code{
    Jobs_setAssociatedRETAIN_NONATOMIC(_code, @(code))
    @jobs_weakify(self)
    [(id<YTKNetworkProtocols>)self jobsHandelHTTPResponseCode:code actionBlock:^(HTTPResponseCode data) {
        @jobs_strongify(self)
        if(data == HTTPResponseCodeNoOK) toastBy(self.msg);
    }];
}

@end
