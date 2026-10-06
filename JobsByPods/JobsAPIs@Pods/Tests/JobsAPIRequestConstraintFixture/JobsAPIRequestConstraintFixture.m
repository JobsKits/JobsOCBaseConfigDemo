//
//  JobsAPIRequestConstraintFixture.m
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAPIRequestConstraintFixture.h"

@implementation JobsAPIRequestConstraintFixture

-(NSString *)requestUrl{
    return [@"https://jobs-stability.invalid" stringByAppendingString:self.fixturePath ?: @"/get"];
}

-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

-(NSTimeInterval)requestTimeoutInterval{
    return 7.25;
}

-(BOOL)allowsCellularAccess{
    return NO;
}

-(id)requestArgument{
    return @{@"unicode": @"空 格&+", @"integer": @42};
}

-(NSURLRequest *)buildCustomUrlRequest{
    if (!self.usesRawRequest) {
        return [super buildCustomUrlRequest];
    }
    return self.jobsMakeRequestByBlock(^(NSMutableURLRequest *request) {
        request.HTTPMethod = @"GET";
    });
}

@end
