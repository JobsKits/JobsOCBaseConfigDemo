//
//  AFSecurityPolicy+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 25/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

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
