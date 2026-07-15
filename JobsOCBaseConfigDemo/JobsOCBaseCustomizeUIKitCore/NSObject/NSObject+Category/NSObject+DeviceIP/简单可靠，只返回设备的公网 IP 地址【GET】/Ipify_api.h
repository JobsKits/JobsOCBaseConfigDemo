//
//  Ipify_api.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IPIFY_API_D7385C9EA3
#define JOBS_HEADER_GUARD_IPIFY_API_D7385C9EA3

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "YTKNetworkExtra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 简单可靠，只返回设备的公网IP地址@GET
/// https://api.ipify.org?format=json
@interface Ipify_api : BaseRequest

@end

@interface IpifyModel : NSObject

Prop_copy()NSString *ip;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_IPIFY_API_D7385C9EA3 */
