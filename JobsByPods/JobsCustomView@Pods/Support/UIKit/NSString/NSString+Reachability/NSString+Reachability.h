//
//  NSString+Reachability.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_REACHABILITY_9338B21C4A
#define JOBS_HEADER_GUARD_NSSTRING_REACHABILITY_9338B21C4A

#import <Foundation/Foundation.h>

#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Reachability)

-(Reachability *_Nonnull)makeReachability;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_REACHABILITY_9338B21C4A */
