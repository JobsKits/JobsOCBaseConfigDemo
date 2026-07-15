//
//  Ipdata_api.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IPDATA_API_F37B2F79FD
#define JOBS_HEADER_GUARD_IPDATA_API_F37B2F79FD

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsBaseProtocolHeader.h"
#import "YTKNetworkExtra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 提供详细的IP信息@GET
/// https://api.ipdata.co/?api-key=YOUR_API_KEY
@interface Ipdata_api : BaseRequest

@end

NS_ASSUME_NONNULL_END
/*
 
     https://ipdata.co/

     ipdata.co 免费额度
      免费计划：每天可免费调用 1,500 次 API。
      获取密钥：需要在 ipdata.co 官方网站 注册一个免费账号后，生成 API 密钥。

     获取免费密钥步骤
      访问 ipdata.co 注册页面.
      注册一个账户（免费）。
      登录后，进入 API 密钥管理页面，生成一个 API 密钥。
      使用该密钥调用 API。
 */
#endif /* JOBS_HEADER_GUARD_IPDATA_API_F37B2F79FD */
