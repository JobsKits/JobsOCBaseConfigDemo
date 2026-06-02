//
//  NSURL+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#ifndef JOBS_HEADER_GUARD_NSURL_EXTRA_C7EC502FFB
#define JOBS_HEADER_GUARD_NSURL_EXTRA_C7EC502FFB

#import <Foundation/Foundation.h>
#import <YTKNetworkExtra/NSURLRequest+Extra.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Extra)
/// NSURL => NSURLRequest
-(NSMutableURLRequest *)URLRequest;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURL_EXTRA_C7EC502FFB */
