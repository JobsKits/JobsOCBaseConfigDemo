//
//  NSObject+YTKRequest.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+YTKRequest.h"

@implementation NSObject (YTKRequest)
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    YTKBaseRequest *resultRequest = chainRequest.requestArray.lastObject;
    JobsLog(@"all requests are done");
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest *)request{
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    self.jobsHandelNoSuccess(request);
    JobsLog(@"请求失败");
}

@end
