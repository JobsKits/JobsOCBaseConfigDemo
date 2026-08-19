//
//  NSObject+URLMgr_4.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_URLMGR_4_9D0D73B104
#define JOBS_HEADER_GUARD_NSOBJECT_URLMGR_4_9D0D73B104

#import <Foundation/Foundation.h>
#import "URLMgr.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://18.162.73.145:18099/doc.html#/default
@interface NSObject (URLMgr_4)
#pragma mark —— 信息配置
/// 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】@GET
-(URLManagerModel *_Nullable)get_operation_announce_config_queryAnnByMember;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_operation_announce_config_queryAnnByMember;
/// 站内信全部变为已读【建议前端每5s刷新一次】@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_allReadStatus;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_allReadStatus;
/// 站内信全部删除@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_deleteAll;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_deleteAll;
/// 站内信删除@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_deleteLetter;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_deleteLetter;
/// 是否有未读站内信【建议前端每5s刷新一次】@POST
-(URLManagerModel *_Nullable)post_operation_letter_config_hasUnRead;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_letter_config_hasUnRead;
/// 站内信记录查询@POST
-(URLManagerModel *_Nullable)post_operation_letter_config_queryLetterConfigSendList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_letter_config_queryLetterConfigSendList;
/// 站内信变为已读@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_toReadStatus;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_toReadStatus;
#pragma mark —— 全站维护
/// 全站维护@POST
-(URLManagerModel *_Nullable)post_operation_siteMain_queryDetail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_siteMain_queryDetail;
#pragma mark —— 公共资源
/// 教程子项详情@POST
-(URLManagerModel *_Nullable)post_operation_tutorial_config_detailItem;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_tutorial_config_detailItem;
/// 教程列表@POST
-(URLManagerModel *_Nullable)post_api_operation_tutorial_config_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_api_operation_tutorial_config_list;
/// 教程子项列表@POST
-(URLManagerModel *_Nullable)post_operation_tutorial_config_listItem;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_tutorial_config_listItem;
#pragma mark —— 资源配置
/// 意见保存@POST
-(URLManagerModel *_Nullable)post_operation_advice_config_saveAdviceConfig;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_advice_config_saveAdviceConfig;
#pragma mark —— 赞助模块
/// 查询赞助集锦列表@GET
-(URLManagerModel *_Nullable)get_operation_sponsor_high_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_operation_sponsor_high_list;
/// 查询赞助图集列表@GET
-(URLManagerModel *_Nullable)get_operation_sponsor_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_operation_sponsor_list;
#pragma mark —— 接口文档里面没有的
/// 获取好友邀请规则（邀请人数）@GET
-(URLManagerModel *_Nullable)get_invite_getInviteTerms;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_invite_getInviteTerms;
/// 收益统计@GET
-(URLManagerModel *_Nullable)post_invite_inviteBetAwardStatistic;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_invite_inviteBetAwardStatistic;
/// 邀请好友链接@GET
-(URLManagerModel *_Nullable)get_getReferralCode;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_getReferralCode;
/// 银行-Deposit 提交@POST
-(URLManagerModel *_Nullable)post_fundDepositOrder;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fundDepositOrder;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_URLMGR_4_9D0D73B104 */
