//
//  JobsDebugPanelProbeRequest.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugPanelProbeRequest.h"

#if DEBUG
@implementation JobsDebugPanelProbeRequest

-(NSString *)baseUrl {
    return This.jobsBaseUrl();
}

-(NSString *)requestUrl {
    return @"/get";
}

-(NSTimeInterval)requestTimeoutInterval {
    return 3;
}

-(NSInteger)cacheTimeInSeconds {
    return -1;
}

@end
#endif

