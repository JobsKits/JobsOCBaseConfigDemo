//
//  IP_api.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IP_API_322D6A993E

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#define JOBS_HEADER_GUARD_IP_API_322D6A993E

#import <Foundation/Foundation.h>

#import "JobsBaseProtocolHeader.h"
#import "YTKNetworkExtra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 提供丰富的地理位置信息@GET
/// http://ip-api.com/json/
@interface IP_api : BaseRequest

@end

@interface IPApiModel : NSObject

Prop_copy()NSString *status;
Prop_copy()NSString *country;
Prop_copy()NSString *countryCode;
Prop_copy()NSString *region;
Prop_copy()NSString *regionName;
Prop_copy()NSString *city;
Prop_copy()NSString *zip;
Prop_copy()NSString *lat;
Prop_copy()NSString *lon;
Prop_copy()NSString *timezone;
Prop_copy()NSString *isp;
Prop_copy()NSString *org;
Prop_copy()NSString *as;
Prop_copy()NSString *query;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_IP_API_322D6A993E */
