//
//  NSObject+URLMgr_2.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_URLMGR_2_E210EE2BA0
#define JOBS_HEADER_GUARD_NSOBJECT_URLMGR_2_E210EE2BA0

#import <Foundation/Foundation.h>
#import "URLMgr.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://18.162.73.145:18100/api/promotion/doc.html#/default
@interface NSObject (URLMgr_2)
#pragma mark —— feign-support-controller
/// 查看是否有流水卷或者存送卷@POST
-(URLManagerModel *_Nullable)post_promotion_feign_rolls_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_feign_rolls_list;
/// 批量使用流水卷或者存送卷@POST
-(URLManagerModel *_Nullable)post_promotion_feign_rolls_use;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_feign_rolls_use;
#pragma mark —— health-controller
/// hearbeat@GET
-(URLManagerModel *_Nullable)get_promotion_heartbeat;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_heartbeat;
#pragma mark —— 大转盘
/// 查询大转盘活动参数配置@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_detail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_detail;
/// 大转盘抽奖@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_prize_get;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_prize_get;
/// 分页查询大转盘活动抽奖记录@POST
-(URLManagerModel *_Nullable)post_promotion_activity_turntable_record;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_activity_turntable_record;
/// 查询用户大转盘抽奖次数@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_user_num;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_user_num;
/// 查询用户大转盘活动抽奖记录@GET
-(URLManagerModel *_Nullable)get_promotion_activity_turntable_user_record;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_turntable_user_record;
#pragma mark —— 广告配置所有接口
/// 查询广告列表-支持游客:活动推广专区@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_activity;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_activity;
/// 查询广告列表-支持游客:APP首页右下3Banner@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_infoP_list_appIndex;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_infoP_list_appIndex;
/// 查询广告列表-支持游客:APP会员中心@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_appMember;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_appMember;
/// 查询广告列表-支持游客:首页天顶轮播大Banner@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_index;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_index;
/// 查询广告列表-支持游客:导航栏4小Banner@GET
-(URLManagerModel *_Nullable)get_promotion_advertise_info_list_navigationBar;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_advertise_info_list_navigationBar;
#pragma mark —— 新手活动
/// 查询新手活动参数配置@GET
-(URLManagerModel *_Nullable)get_promotion_activity_newbie_detail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_activity_newbie_detail;
/// 查询登录用户新手大礼包完成情况@GET
-(URLManagerModel *_Nullable)get_promotion_get_user_newbie_gift_detail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_get_user_newbie_gift_detail;
/// 查询登录用户参加新手活动资格@GET
-(URLManagerModel *_Nullable)get_promotion_get_user_newbie_qualifications;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_get_user_newbie_qualifications;
/// 查询登录用户签到完成情况@GET
-(URLManagerModel *_Nullable)get_promotion_get_user_sign_gift_detail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_get_user_sign_gift_detail;
/// 新手活动复活大礼包用户领取@GET
-(URLManagerModel *_Nullable)get_promotion_newbie_user_resurrection_receive;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_newbie_user_resurrection_receive;
/// 新手活动用户复活大礼包状态查询@GET
-(URLManagerModel *_Nullable)get_promotion_newbie_user_resurrection_statusGet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_newbie_user_resurrection_statusGet;
/// 新手活动签到大礼包用户签到@GET
-(URLManagerModel *_Nullable)get_promotion_newbie_user_sign;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_newbie_user_sign;
#pragma mark —— 活动相关接口
/// 存款优惠活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_api_client_activity_getActivity;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_api_client_activity_getActivity;
/// 存款优惠活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_api_client_activity_getDepositDiscountActivityRecord;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_api_client_activity_getDepositDiscountActivityRecord;
/// 会员签到活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_api_client_activity_getMemberSignActivityRecord;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_api_client_activity_getMemberSignActivityRecord;
/// 获取存款金额奖励@GET
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_getObtainDepositBonus;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_getObtainDepositBonus;
/// 查询活动信息@GET
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_queryActivityInfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_queryActivityInfo;
/// 查询用户123存款活动的在途订单数量@GET
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_queryInTransit123DepositOrdersCount;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_queryInTransit123DepositOrdersCount;
/// 会员签到@POST
-(URLManagerModel *_Nullable)get_promotion_api_client_activity_sign;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_api_client_activity_sign;
/// 首存活动-查询累计流水@GET
-(URLManagerModel *_Nullable)get_promotion_event_activity_bet_total;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_event_activity_bet_total;
/// 活动领取-传返回记录的id@POST
-(URLManagerModel *_Nullable)post_promotion_event_activity_claimp;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_event_activity_claimp;
/// 查询首存活动记录@GET
-(URLManagerModel *_Nullable)get_promotion_event_activity_record;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_event_activity_record;
/// 会员签到@POST
-(URLManagerModel *_Nullable)post_promotion_event_memberSign;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_event_memberSign;
/// 会员签到活动信息@POST
-(URLManagerModel *_Nullable)post_promotion_event_memberSignEvent;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_event_memberSignEvent;
#pragma mark —— 福利中心所有接口
/// 福利领取 ，目前只限2现金券 3存送卷 4流水卷@GET
-(URLManagerModel *_Nullable)get_promotion_welfare_claim;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_welfare_claim;
/// 用户查询福利中心列表@POST
-(URLManagerModel *_Nullable)post_promotion_welfare_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_welfare_list;
/// 用户福利中心统计@GET
-(URLManagerModel *_Nullable)get_promotion_welfare_statistic;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_promotion_welfare_statistic;
/// vip模块领取福利@POST
-(URLManagerModel *_Nullable)post_promotion_welfare_vip_claim;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_promotion_welfare_vip_claim;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_URLMGR_2_E210EE2BA0 */
