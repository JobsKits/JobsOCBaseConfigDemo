//
//  NSObject+URLMgr_3.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_URLMGR_3_C41014CD9F
#define JOBS_HEADER_GUARD_NSOBJECT_URLMGR_3_C41014CD9F

#import <Foundation/Foundation.h>
#import <JobsAPIs/URLMgr.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

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

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://18.162.73.145:18097/doc.html
@interface NSObject (URLMgr_3)
#pragma mark —— APP游戏首页娱乐城
/// 菲站APP首页- 受欢迎的游戏列表查询@POST
-(URLManagerModel *_Nullable)post_game_home_queryTopGamesList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_queryTopGamesList;
#pragma mark —— CQ9电子游戏接口19
/// CheckPlayer@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_CQ9_checkPlayerByPlayerName;
/// getBalance@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_CQ9_getBalanceByPlayerName;
/// bet@POST
-(URLManagerModel *_Nullable)post_CQ9_bet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_bet;
/// credit@POST
-(URLManagerModel *_Nullable)post_CQ9_credit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_credit;
/// debit@POST
-(URLManagerModel *_Nullable)post_CQ9_debit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_debit;
/// EndRound@POST
-(URLManagerModel *_Nullable)post_CQ9_EndRound;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_EndRound;
/// refund@POST
-(URLManagerModel *_Nullable)post_CQ9_refund;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_refund;
/// rollin@POST
-(URLManagerModel *_Nullable)post_CQ9_rollin;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_rollin;
/// rollOut@POST
-(URLManagerModel *_Nullable)post_CQ9_rollOut;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_rollOut;
/// takeAll@POST
-(URLManagerModel *_Nullable)post_CQ9_takeAll;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_takeAll;
/// record@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_CQ9_recordByMTCode;
/// payoff@POST
-(URLManagerModel *_Nullable)post_CQ9_payoff;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_payoff;
/// errorHtml@GET
-(URLManagerModel *_Nullable)get_CQ9_errorHtml;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_CQ9_errorHtml;
/// errorHtml@POST
-(URLManagerModel *_Nullable)post_CQ9_errorHtml;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_errorHtml;
/// errorHtml@PUT
-(URLManagerModel *_Nullable)put_CQ9_errorHtml;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_CQ9_errorHtml;
/// errorHtml@DELETE
-(URLManagerModel *_Nullable)delete_CQ9_errorHtml;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_CQ9_errorHtml;
#pragma mark —— EVO真人游戏接口
/// balance@POST
-(URLManagerModel *_Nullable)post_EVO_balance;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_balance;
/// cancel@POST
-(URLManagerModel *_Nullable)post_EVO_cancel;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_cancel;
/// check@POST
-(URLManagerModel *_Nullable)post_EVO_check;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_check;
/// credit@POST
-(URLManagerModel *_Nullable)post_EVO_credit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_credit;
/// debit@POST
-(URLManagerModel *_Nullable)post_EVO_debit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_debit;
/// promo_payout@POST
-(URLManagerModel *_Nullable)post_EVO_promo_payout;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_promo_payout;
/// sid@POST
-(URLManagerModel *_Nullable)post_EVO_sid;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_sid;
#pragma mark —— FC电子游戏接口
/// activityReward@POST
-(URLManagerModel *_Nullable)post_FC_activityReward;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_activityReward;
/// bet@POST
-(URLManagerModel *_Nullable)post_FC_bet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_bet;
/// betCancel@POST
-(URLManagerModel *_Nullable)post_FC_betCancel;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_betCancel;
/// BetNInfo@POST
-(URLManagerModel *_Nullable)post_FC_betNInfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_betNInfo;
/// CancelBetNInfo@POST
-(URLManagerModel *_Nullable)post_FC_cancelBetNInfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_cancelBetNInfo;
/// 余额回调@POST
-(URLManagerModel *_Nullable)post_FC_getBalance;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_getBalance;
/// settle@POST
-(URLManagerModel *_Nullable)post_FC_settle;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_settle;
#pragma mark —— JDB
/// 捕鱼游戏接口@POST
-(URLManagerModel *_Nullable)post_JDB_fish;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_fish;
/// 棋牌游戏接口@POST
-(URLManagerModel *_Nullable)post_JDB_poker;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_poker;
/// 电子接口@POST
-(URLManagerModel *_Nullable)post_JDB_;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_;
/// 电子游戏接口@POST
-(URLManagerModel *_Nullable)post_JDB_slot;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_slot;
#pragma mark —— JiLi
/// slot_auth@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_auth;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_auth;
/// slot_bet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_bet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_bet;
/// slot_cancelBet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_cancelBet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_cancelBet;
/// slot_cancelSessionBet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_cancelSessionBet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_cancelSessionBet;
/// slot_sessionBet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_sessionBet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_sessionBet;
#pragma mark —— KA电子游戏接口
/// balance@POST
-(URLManagerModel *_Nullable)post_KA_balance;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_balance;
/// credit@POST
-(URLManagerModel *_Nullable)post_KA_credit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_credit;
/// end@POST
-(URLManagerModel *_Nullable)post_KA_end;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_end;
/// play@POST
-(URLManagerModel *_Nullable)post_KA_play;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_play;
/// revoke@POST
-(URLManagerModel *_Nullable)post_KA_revoke;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_revoke;
/// start@POST
-(URLManagerModel *_Nullable)post_KA_start;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_start;
#pragma mark —— PB体育游戏接口
/// ping@POST
-(URLManagerModel *_Nullable)post_PB_ping;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PB_ping;
/// wagering⚠️@POST
-(URLManagerModel *_Nullable)post_PB_wagering;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PB_wagering;
#pragma mark —— PG电子游戏接口
/// cashAdjustment@POST
-(URLManagerModel *_Nullable)post_PG_cashAdjustment;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_cashAdjustment;
/// cashGet@POST
-(URLManagerModel *_Nullable)post_PG_cashGet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_cashGet;
/// cashTransferInOut@POST
-(URLManagerModel *_Nullable)post_PG_cashTransferInOut;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_cashTransferInOut;
/// verifySession@POST
-(URLManagerModel *_Nullable)post_PG_verifySession;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_verifySession;
#pragma mark —— 个人中心
/// 一键回收 返回中心钱包余额@POST
-(URLManagerModel *_Nullable)post_game_fund_collect;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_fund_collect;
/// 转入@POST
-(URLManagerModel *_Nullable)post_game_fund_transferIn;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_fund_transferIn;
/// 获取会员与转账场馆余额：缓存3秒@POST
-(URLManagerModel *_Nullable)post_game_fund_wallet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_fund_wallet;
#pragma mark —— 全平台投注记录相关接口
/// 跟单记录@POST
-(URLManagerModel *_Nullable)post_game_bet_followList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_followList;
/// mageXcess审计@GET
-(URLManagerModel *_Nullable)get_game_bet_mageXcess_queryRecord;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_bet_mageXcess_queryRecord;
/// 根据传入的天数计算，返回超过days天数未登录的用户idlist@POST
-(URLManagerModel *_Nullable)post_game_bet_noLoginMemberIdList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_noLoginMemberIdList;
/// 按时间范围查询注单@POST
-(URLManagerModel *_Nullable)post_game_bet_orders;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_orders;
/// 全平台投注记录列表@POST
-(URLManagerModel *_Nullable)post_game_bet_pageList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_pageList;
#pragma mark —— 场馆转入转出记录列表
/// 场馆转入转出记录列表@POST
-(URLManagerModel *_Nullable)post_game_pay_pageList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_pay_pageList;
#pragma mark —— 子游戏数据导入测试
/// 游戏gameLobby数据导入@GET
-(URLManagerModel *_Nullable)get_game_pagcor_gameLobbyImport;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_pagcor_gameLobbyImport;
#pragma mark —— 对接PAGCOR的API
/// 游戏gameLobby数据导入@GET
-(URLManagerModel *_Nullable)get_game_pagcor_order_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_pagcor_order_list;
#pragma mark —— 数据同步相关
/// 同步厅方订单数据@POST
-(URLManagerModel *_Nullable)post_game_job_fetchBetOrders;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_job_fetchBetOrders;
/// 查询是否已经生成用户钱包@POST
-(URLManagerModel *_Nullable)post_game_syncData_checkExistWallet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_syncData_checkExistWallet;
/// 同步用户钱包数据@POST
-(URLManagerModel *_Nullable)post_game_syncData_syncFundWallet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_syncData_syncFundWallet;
#pragma mark —— 游戏数据统计
/// 统计注单流水稽核金额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryAuditAmount;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryAuditAmount;
/// 查询会员投注记录统计@POST
-(URLManagerModel *_Nullable)post_game_statis_queryBetByLobbyName;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryBetByLobbyName;
/// 统计下注会员数&投注金额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryBetInfoByAgent;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryBetInfoByAgent;
/// 查询游戏投注记录@POST
-(URLManagerModel *_Nullable)post_game_statis_queryBetListByPage;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryBetListByPage;
/// 查询投注会员详情@POST
-(URLManagerModel *_Nullable)post_game_statis_queryGameOrderBetByPage;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryGameOrderBetByPage;
/// 统计会员输赢@POST
-(URLManagerModel *_Nullable)post_game_statis_queryProfit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryProfit;
/// 查询会员总输赢@POST
-(URLManagerModel *_Nullable)post_game_statis_queryUserProfitLoss;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryUserProfitLoss;
/// 统计游戏有效投注额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryValidBet;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryValidBet;
/// 统计游戏有效投注额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryValidBet2;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryValidBet2;
#pragma mark —— 游戏配置模块
/// 获取游戏场馆大类信息@GET
-(URLManagerModel *_Nullable)get_game_lobby_getTopGameLobbyList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_lobby_getTopGameLobbyList;
#pragma mark —— 游戏首页娱乐城
/// 游戏导航列表：缓存1分钟@GET(仅适用于PC端)
-(URLManagerModel *_Nullable)get_game_home_bar_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_home_bar_list;
/// H5/APP 游戏导航列表：缓存10分钟 (仅适用于H5、App端)@GET
-(URLManagerModel *_Nullable)get_api_game_home_bar_mobile;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_api_game_home_bar_mobile;
/// 游戏大厅喜爱的游戏-添加@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_add;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_add;
/// 菲站首页- 查询游戏收藏列表 仅适用于app端@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_app;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_app;
/// 游戏大厅喜爱的游戏-删除@DELETE
-(URLManagerModel *_Nullable)delete_game_home_favoriteGames_delete;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_game_home_favoriteGames_delete;
/// 菲站首页- 查询游戏收藏列表 仅适用于H5端@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_h5;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_h5;
/// 菲站首页- 查询所有厂商提供的老虎机游戏收藏列表@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_query;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_query;
/// 菲站游戏大厅-模糊查询@POST
-(URLManagerModel *_Nullable)post_game_home_gameZone_fuzzyQuery;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_gameZone_fuzzyQuery;
/// 菲站首页大厅场馆对应游戏列表-查询@POST
-(URLManagerModel *_Nullable)post_game_home_homeLobbyGame_query;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_homeLobbyGame_query;
/// 菲站首页大厅场馆对应累加资金-查询@POST
-(URLManagerModel *_Nullable)post_game_home_jackpotsGamesFunds_query;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_jackpotsGamesFunds_query;
/// 菲站热门游戏/百家乐/轮盘/21点-查询@POST
-(URLManagerModel *_Nullable)post_game_home_liveCasino_quer;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_liveCasino_quer;
/// 菲站首页- 受欢迎的游戏列表查询@POST
-(URLManagerModel *_Nullable)post_game_home_popularGames_query;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_popularGames_query;
/// 菲站电子游戏页面/热门游戏及最新游戏-查询@POST
-(URLManagerModel *_Nullable)post_game_home_slot_query;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_slot_query;
/// 前端- 查询所有厂商提供的老虎机游戏列表@POST
-(URLManagerModel *_Nullable)post_game_home_sub_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_sub_list;
/// 前端- 查询所有场馆提供的游戏列表 (仅适用于H5、App端)@POST
-(URLManagerModel *_Nullable)post_api_game_home_sub_mobile;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_api_game_home_sub_mobile;
#pragma mark —— 进出游戏相关接口
/// 查询我的游戏注单详情@POST
-(URLManagerModel *_Nullable)post_game_bet_order_mybet_detail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_order_mybet_detail;
/// 查询我的游戏注单@POST
-(URLManagerModel *_Nullable)post_game_bet_order_mybet_sum;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_order_mybet_sum;
/// 获取游戏url@POST
-(URLManagerModel *_Nullable)post_game_bet_single_wallet_jump;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_single_wallet_jump;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_URLMGR_3_C41014CD9F */
