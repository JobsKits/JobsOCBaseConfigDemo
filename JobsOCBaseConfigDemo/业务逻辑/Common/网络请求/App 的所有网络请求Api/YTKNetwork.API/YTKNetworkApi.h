//
//  YTKNetworkApi.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef YTKNetworkApi_h
#define YTKNetworkApi_h

#if __has_include(<JobsAPIs/JobsBaseApi.h>)
#import <JobsAPIs/JobsBaseApi.h>
#else
#import "JobsBaseApi.h"
#endif

#import "FM_user_logout_api.h" /// 用户登出@POST
#import "FM_promotion_advertise_api.h" /// 查询广告列表-支持游客：APP首页右下3Banner@GET
#import "FM_getDepositDiscountActivityRecord_api.h" /// 存款优惠活动信息@POST
#import "FM_GetKYCInfo_api.h" /// 获取会员KYC信息@GET
#import "FM_kyc_image_upload_api.h" /// KYC身份证上传@POST

#if __has_include(<YTKNetworkExtra/NSObject+YTKNetwork.h>)
#import <YTKNetworkExtra/NSObject+YTKNetwork.h>
#else
#import "NSObject+YTKNetwork.h"
#endif

#endif /* YTKNetworkApi_h */
