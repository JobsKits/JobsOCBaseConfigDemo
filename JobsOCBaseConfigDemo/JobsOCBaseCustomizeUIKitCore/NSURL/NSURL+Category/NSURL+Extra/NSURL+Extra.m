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
    return NSURLRequest.initBy(self).mutableCopy;
}

@end
