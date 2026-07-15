//
//  NSURLSession+AllowAllCertificates.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSURLSession+AllowAllCertificates.h"

@implementation NSURLSession (AllowAllCertificates)
+(BOOL)setAllowsAnyHTTPSCertificateForHost:(NSString *)host{
    return YES;
}

@end
