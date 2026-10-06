//
//  JobsAPIUploadConstraintFixture.m
//  JobsAPIs
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsAPIUploadConstraintFixture.h"

@implementation JobsAPIUploadConstraintFixture

-(NSString *)requestUrl{
    return @"https://jobs-stability.invalid/upload";
}

-(NSTimeInterval)requestTimeoutInterval{
    return 7.25;
}

-(BOOL)allowsCellularAccess{
    return NO;
}

@end
