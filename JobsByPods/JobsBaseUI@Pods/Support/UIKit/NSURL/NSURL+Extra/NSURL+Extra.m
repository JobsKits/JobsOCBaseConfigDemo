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

-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSURLRequest.initBy(self).mutableCopy;
    };
}

@end
