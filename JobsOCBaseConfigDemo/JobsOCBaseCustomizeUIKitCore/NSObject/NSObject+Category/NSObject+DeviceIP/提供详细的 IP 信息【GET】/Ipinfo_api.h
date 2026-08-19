//
//  Ipinfo_api.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IPINFO_API_9FB76AB229

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#define JOBS_HEADER_GUARD_IPINFO_API_9FB76AB229

#import <Foundation/Foundation.h>

#import "JobsBaseProtocolHeader.h"
#import "YTKNetworkExtra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 提供详细的IP信息@GET
/// https://ipinfo.io/json
@interface Ipinfo_api : BaseRequest

@end

@interface IpinfoModel : NSObject

Prop_copy()NSString *ip;
Prop_copy()NSString *hostname;
Prop_copy()NSString *city;
Prop_copy()NSString *region;
Prop_copy()NSString *country;
Prop_copy()NSString *loc;
Prop_copy()NSString *org;
Prop_copy()NSString *postal;
Prop_copy()NSString *timezone;
Prop_copy()NSString *readme;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_IPINFO_API_9FB76AB229 */
