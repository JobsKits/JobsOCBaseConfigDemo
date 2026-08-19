//
//  NSString+Reachability.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_REACHABILITY_CCF15001DF

#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"
#endif

#define JOBS_HEADER_GUARD_NSSTRING_REACHABILITY_CCF15001DF

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Reachability)

-(Reachability *_Nonnull)makeReachability;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_REACHABILITY_CCF15001DF */
