//
//  AFSecurityPolicy+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AFSecurityPolicy+Extra.h"

@implementation AFSecurityPolicy (Extra)

+(JobsReturnAFSecurityPolicyByAFSSLPinningModeBlock _Nonnull)initBy{
    return ^AFSecurityPolicy *_Nonnull(AFSSLPinningMode data){
        return [AFSecurityPolicy policyWithPinningMode:data];
    };
}

+(AFSecurityPolicy *_Nonnull)initByModeNone{
    return [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
}

+(AFSecurityPolicy *_Nonnull)initByModePublicKey{
    return [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
}

+(AFSecurityPolicy *_Nonnull)initByModeCertificate{
    return [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
}

@end
