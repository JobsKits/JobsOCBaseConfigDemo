//
//  AFSecurityPolicy+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AFSECURITYPOLICY_EXTRA_7EC76A31CF
#define JOBS_HEADER_GUARD_AFSECURITYPOLICY_EXTRA_7EC76A31CF

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AFSecurityPolicy (Extra)

+(JobsReturnAFSecurityPolicyByAFSSLPinningModeBlock _Nonnull)initBy;
+(AFSecurityPolicy *_Nonnull)initByModeNone;
+(AFSecurityPolicy *_Nonnull)initByModePublicKey;
+(AFSecurityPolicy *_Nonnull)initByModeCertificate;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_AFSECURITYPOLICY_EXTRA_7EC76A31CF */
