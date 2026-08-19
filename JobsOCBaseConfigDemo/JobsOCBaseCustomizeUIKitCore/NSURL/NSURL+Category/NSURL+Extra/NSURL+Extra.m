//
//  NSURL+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#import "NSURL+Extra.h"

@implementation NSURL (Extra)
/// NSURL => NSURLRequest
-(NSMutableURLRequest *)URLRequest{
    return (((JobsRetMutableURLRequestByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSURL.class, @selector(jobsURLRequest)))(self, @selector(jobsURLRequest)))();
}

@end
