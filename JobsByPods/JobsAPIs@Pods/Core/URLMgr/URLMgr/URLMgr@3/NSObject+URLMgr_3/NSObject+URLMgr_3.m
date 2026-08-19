//
//  NSObject+URLMgr_3.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_3.h"

#import <JobsAPIs/NSObject+Extra.h>
/// 来自 http://18.162.73.145:18097/doc.html
@implementation NSObject (URLMgr_3)
#pragma mark —— APP游戏首页娱乐城
/// 菲站APP首页- 受欢迎的游戏列表查询@POST
-(URLManagerModel *_Nullable)post_game_home_queryTopGamesList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_queryTopGamesList)))(self, @selector(jobs_post_game_home_queryTopGamesList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_queryTopGamesList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/app/queryTopGamesList");
    };
}
#pragma mark —— CQ9电子游戏接口19
/// CheckPlayer@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_CQ9_checkPlayerByPlayerName{
    return ^URLManagerModel *_Nullable(NSString *_Nullable playerName){
        NSString *url = @"api/game/callback/cq9/slot/player/check/{".add(playerName).add(@"}");
        return JobsURL(url);
    };
}
/// getBalance@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_CQ9_getBalanceByPlayerName{
    return ^URLManagerModel *_Nullable(NSString *_Nullable playerName){
        NSString *url = @"/api/game/callback/cq9/slot/transaction/balance/{".add(playerName).add(@"}");
        return JobsURL(url);
    };
}
/// bet@POST
-(URLManagerModel *_Nullable)post_CQ9_bet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_bet)))(self, @selector(jobs_post_CQ9_bet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_bet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/bet");
    };
}
/// credit@POST
-(URLManagerModel *_Nullable)post_CQ9_credit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_credit)))(self, @selector(jobs_post_CQ9_credit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_credit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/credit");
    };
}
/// debit@POST
-(URLManagerModel *_Nullable)post_CQ9_debit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_debit)))(self, @selector(jobs_post_CQ9_debit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_debit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/debit");
    };
}
/// EndRound@POST
-(URLManagerModel *_Nullable)post_CQ9_EndRound{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_EndRound)))(self, @selector(jobs_post_CQ9_EndRound)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_EndRound{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/endround");
    };
}
/// refund@POST
-(URLManagerModel *_Nullable)post_CQ9_refund{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_refund)))(self, @selector(jobs_post_CQ9_refund)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_refund{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/refund");
    };
}
/// rollin@POST
-(URLManagerModel *_Nullable)post_CQ9_rollin{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_rollin)))(self, @selector(jobs_post_CQ9_rollin)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_rollin{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/rollin");
    };
}
/// rollOut@POST
-(URLManagerModel *_Nullable)post_CQ9_rollOut{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_rollOut)))(self, @selector(jobs_post_CQ9_rollOut)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_rollOut{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/rollout");
    };
}
/// takeAll@POST
-(URLManagerModel *_Nullable)post_CQ9_takeAll{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_takeAll)))(self, @selector(jobs_post_CQ9_takeAll)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_takeAll{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/takeall");
    };
}
/// record@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_CQ9_recordByMTCode{
    return ^URLManagerModel *_Nullable(NSString *_Nullable mtcode){
        NSString *url = @"/api/game/callback/cq9/slot/transaction/record/{".add(mtcode).add(@"}");
        return JobsURL(url);
    };
}
/// payoff@POST
-(URLManagerModel *_Nullable)post_CQ9_payoff{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_payoff)))(self, @selector(jobs_post_CQ9_payoff)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_payoff{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/cq9/slot/transaction/user/payoff");
    };
}
/// errorHtml@GET
-(URLManagerModel *_Nullable)get_CQ9_errorHtml{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_CQ9_errorHtml)))(self, @selector(jobs_get_CQ9_errorHtml)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_CQ9_errorHtml{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/error");
    };
}
/// errorHtml@POST
-(URLManagerModel *_Nullable)post_CQ9_errorHtml{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_CQ9_errorHtml)))(self, @selector(jobs_post_CQ9_errorHtml)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_CQ9_errorHtml{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/error");
    };
}
/// errorHtml@PUT
-(URLManagerModel *_Nullable)put_CQ9_errorHtml{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_CQ9_errorHtml)))(self, @selector(jobs_put_CQ9_errorHtml)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_CQ9_errorHtml{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/error");
    };
}
/// errorHtml@DELETE
-(URLManagerModel *_Nullable)delete_CQ9_errorHtml{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_delete_CQ9_errorHtml)))(self, @selector(jobs_delete_CQ9_errorHtml)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_CQ9_errorHtml{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/error");
    };
}
#pragma mark —— EVO真人游戏接口
/// balance@POST
-(URLManagerModel *_Nullable)post_EVO_balance{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_EVO_balance)))(self, @selector(jobs_post_EVO_balance)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_balance{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/evo/real/api/balance");
    };
}
/// cancel@POST
-(URLManagerModel *_Nullable)post_EVO_cancel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_EVO_cancel)))(self, @selector(jobs_post_EVO_cancel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_cancel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/evo/real/api/cancel");
    };
}
/// check@POST
-(URLManagerModel *_Nullable)post_EVO_check{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_EVO_check)))(self, @selector(jobs_post_EVO_check)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_check{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/evo/real/api/check");
    };
}
/// credit@POST
-(URLManagerModel *_Nullable)post_EVO_credit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_EVO_credit)))(self, @selector(jobs_post_EVO_credit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_credit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/evo/real/api/credit");
    };
}
/// debit@POST
-(URLManagerModel *_Nullable)post_EVO_debit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_EVO_debit)))(self, @selector(jobs_post_EVO_debit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_debit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/evo/real/api/debit");
    };
}
/// promo_payout@POST
-(URLManagerModel *_Nullable)post_EVO_promo_payout{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_EVO_promo_payout)))(self, @selector(jobs_post_EVO_promo_payout)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_promo_payout{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/evo/real/api/promo_payout");
    };
}
/// sid@POST
-(URLManagerModel *_Nullable)post_EVO_sid{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_EVO_sid)))(self, @selector(jobs_post_EVO_sid)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_EVO_sid{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/evo/real/api/sid");
    };
}
#pragma mark —— FC电子游戏接口
/// activityReward@POST
-(URLManagerModel *_Nullable)post_FC_activityReward{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_FC_activityReward)))(self, @selector(jobs_post_FC_activityReward)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_activityReward{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/fc/slot/activity");
    };
}
/// bet@POST
-(URLManagerModel *_Nullable)post_FC_bet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_FC_bet)))(self, @selector(jobs_post_FC_bet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_bet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/fc/slot/bet");
    };
}
/// betCancel@POST
-(URLManagerModel *_Nullable)post_FC_betCancel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_FC_betCancel)))(self, @selector(jobs_post_FC_betCancel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_betCancel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/fc/slot/betCancel");
    };
}
/// BetNInfo@POST
-(URLManagerModel *_Nullable)post_FC_betNInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_FC_betNInfo)))(self, @selector(jobs_post_FC_betNInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_betNInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/fc/slot/betInfo");
    };
}
/// CancelBetNInfo@POST
-(URLManagerModel *_Nullable)post_FC_cancelBetNInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_FC_cancelBetNInfo)))(self, @selector(jobs_post_FC_cancelBetNInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_cancelBetNInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/fc/slot/cancelBetInfo");
    };
}
/// 余额回调@POST
-(URLManagerModel *_Nullable)post_FC_getBalance{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_FC_getBalance)))(self, @selector(jobs_post_FC_getBalance)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_getBalance{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/fc/slot/getBalance");
    };
}
/// settle@POST
-(URLManagerModel *_Nullable)post_FC_settle{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_FC_settle)))(self, @selector(jobs_post_FC_settle)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_FC_settle{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/fc/slot/settle");
    };
}
#pragma mark —— JDB
/// 捕鱼游戏接口@POST
-(URLManagerModel *_Nullable)post_JDB_fish{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JDB_fish)))(self, @selector(jobs_post_JDB_fish)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_fish{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jdb/fish");
    };
}
/// 棋牌游戏接口@POST
-(URLManagerModel *_Nullable)post_JDB_poker{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JDB_poker)))(self, @selector(jobs_post_JDB_poker)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_poker{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jdb/poker");
    };
}
/// 电子接口@POST
-(URLManagerModel *_Nullable)post_JDB_{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JDB_)))(self, @selector(jobs_post_JDB_)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jdb");
    };
}
/// 电子游戏接口@POST
-(URLManagerModel *_Nullable)post_JDB_slot{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JDB_slot)))(self, @selector(jobs_post_JDB_slot)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JDB_slot{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jdb/slot");
    };
}
#pragma mark —— JiLi
/// slot_auth@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_auth{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JiLi_slot_auth)))(self, @selector(jobs_post_JiLi_slot_auth)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_auth{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jili/slot/auth");
    };
}
/// slot_bet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_bet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JiLi_slot_bet)))(self, @selector(jobs_post_JiLi_slot_bet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_bet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jili/slot/bet");
    };
}
/// slot_cancelBet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_cancelBet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JiLi_slot_cancelBet)))(self, @selector(jobs_post_JiLi_slot_cancelBet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_cancelBet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jili/slot/cancelBet");
    };
}
/// slot_cancelSessionBet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_cancelSessionBet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JiLi_slot_cancelSessionBet)))(self, @selector(jobs_post_JiLi_slot_cancelSessionBet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_cancelSessionBet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jili/slot/cancelSessionBet");
    };
}
/// slot_sessionBet@POST
-(URLManagerModel *_Nullable)post_JiLi_slot_sessionBet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_JiLi_slot_sessionBet)))(self, @selector(jobs_post_JiLi_slot_sessionBet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_JiLi_slot_sessionBet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/jili/slot/sessionBet");
    };
}
#pragma mark —— KA电子游戏接口
/// balance@POST
-(URLManagerModel *_Nullable)post_KA_balance{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_KA_balance)))(self, @selector(jobs_post_KA_balance)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_balance{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/ka/balance");
    };
}
/// credit@POST
-(URLManagerModel *_Nullable)post_KA_credit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_KA_credit)))(self, @selector(jobs_post_KA_credit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_credit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/ka/credit");
    };
}
/// end@POST
-(URLManagerModel *_Nullable)post_KA_end{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_KA_end)))(self, @selector(jobs_post_KA_end)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_end{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/ka/end");
    };
}
/// play@POST
-(URLManagerModel *_Nullable)post_KA_play{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_KA_play)))(self, @selector(jobs_post_KA_play)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_play{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/ka/play");
    };
}
/// revoke@POST
-(URLManagerModel *_Nullable)post_KA_revoke{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_KA_revoke)))(self, @selector(jobs_post_KA_revoke)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_revoke{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/ka/revoke");
    };
}
/// start@POST
-(URLManagerModel *_Nullable)post_KA_start{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_KA_start)))(self, @selector(jobs_post_KA_start)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_KA_start{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/ka/start");
    };
}
#pragma mark —— PB体育游戏接口
/// ping@POST
-(URLManagerModel *_Nullable)post_PB_ping{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_PB_ping)))(self, @selector(jobs_post_PB_ping)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PB_ping{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/pingbo/sports/ping");
    };
}
/// wagering⚠️@POST
-(URLManagerModel *_Nullable)post_PB_wagering{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_PB_wagering)))(self, @selector(jobs_post_PB_wagering)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PB_wagering{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/pingbo/sports/{agentcode}/wagering/usercode/{usercode}/request/{requestid}");
    };
}
#pragma mark —— PG电子游戏接口
/// cashAdjustment@POST
-(URLManagerModel *_Nullable)post_PG_cashAdjustment{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_PG_cashAdjustment)))(self, @selector(jobs_post_PG_cashAdjustment)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_cashAdjustment{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/pg/slot/Cash/Adjustment");
    };
}
/// cashGet@POST
-(URLManagerModel *_Nullable)post_PG_cashGet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_PG_cashGet)))(self, @selector(jobs_post_PG_cashGet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_cashGet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/pg/slot/Cash/Get");
    };
}
/// cashTransferInOut@POST
-(URLManagerModel *_Nullable)post_PG_cashTransferInOut{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_PG_cashTransferInOut)))(self, @selector(jobs_post_PG_cashTransferInOut)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_cashTransferInOut{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/pg/slot/Cash/TransferInOut");
    };
}
/// verifySession@POST
-(URLManagerModel *_Nullable)post_PG_verifySession{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_PG_verifySession)))(self, @selector(jobs_post_PG_verifySession)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_PG_verifySession{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/callback/pg/slot/VerifySession");
    };
}
#pragma mark —— 个人中心
/// 一键回收 返回中心钱包余额@POST
-(URLManagerModel *_Nullable)post_game_fund_collect{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_fund_collect)))(self, @selector(jobs_post_game_fund_collect)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_fund_collect{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/fund/collect");
    };
}
/// 转入@POST
-(URLManagerModel *_Nullable)post_game_fund_transferIn{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_fund_transferIn)))(self, @selector(jobs_post_game_fund_transferIn)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_fund_transferIn{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/fund/transferIn");
    };
}
/// 获取会员与转账场馆余额：缓存3秒@POST
-(URLManagerModel *_Nullable)post_game_fund_wallet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_fund_wallet)))(self, @selector(jobs_post_game_fund_wallet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_fund_wallet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/fund/wallet");
    };
}
#pragma mark —— 全平台投注记录相关接口
/// 跟单记录@POST
-(URLManagerModel *_Nullable)post_game_bet_followList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_bet_followList)))(self, @selector(jobs_post_game_bet_followList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_followList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/followList");
    };
}
/// mageXcess审计@GET
-(URLManagerModel *_Nullable)get_game_bet_mageXcess_queryRecord{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_game_bet_mageXcess_queryRecord)))(self, @selector(jobs_get_game_bet_mageXcess_queryRecord)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_bet_mageXcess_queryRecord{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/mageXcess/queryRecord");
    };
}
/// 根据传入的天数计算，返回超过days天数未登录的用户idlist@POST
-(URLManagerModel *_Nullable)post_game_bet_noLoginMemberIdList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_bet_noLoginMemberIdList)))(self, @selector(jobs_post_game_bet_noLoginMemberIdList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_noLoginMemberIdList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/noLoginMemberIdList");
    };
}
/// 按时间范围查询注单@POST
-(URLManagerModel *_Nullable)post_game_bet_orders{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_bet_orders)))(self, @selector(jobs_post_game_bet_orders)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_orders{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/orders");
    };
}
/// 全平台投注记录列表@POST
-(URLManagerModel *_Nullable)post_game_bet_pageList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_bet_pageList)))(self, @selector(jobs_post_game_bet_pageList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_pageList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/pageList");
    };
}
#pragma mark —— 场馆转入转出记录列表
/// 场馆转入转出记录列表@POST
-(URLManagerModel *_Nullable)post_game_pay_pageList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_pay_pageList)))(self, @selector(jobs_post_game_pay_pageList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_pay_pageList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/pay/pageList");
    };
}
#pragma mark —— 子游戏数据导入测试
/// 游戏gameLobby数据导入@GET
-(URLManagerModel *_Nullable)get_game_pagcor_gameLobbyImport{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_game_pagcor_gameLobbyImport)))(self, @selector(jobs_get_game_pagcor_gameLobbyImport)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_pagcor_gameLobbyImport{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/pagcor/gameLobbyImport");
    };
}
#pragma mark —— 对接PAGCOR的API
/// 游戏gameLobby数据导入@GET
-(URLManagerModel *_Nullable)get_game_pagcor_order_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_game_pagcor_order_list)))(self, @selector(jobs_get_game_pagcor_order_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_pagcor_order_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/pagcor/order/list");
    };
}
#pragma mark —— 数据同步相关
/// 同步厅方订单数据@POST
-(URLManagerModel *_Nullable)post_game_job_fetchBetOrders{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_job_fetchBetOrders)))(self, @selector(jobs_post_game_job_fetchBetOrders)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_job_fetchBetOrders{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/job/fetchBetOrders");
    };
}
/// 查询是否已经生成用户钱包@POST
-(URLManagerModel *_Nullable)post_game_syncData_checkExistWallet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_syncData_checkExistWallet)))(self, @selector(jobs_post_game_syncData_checkExistWallet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_syncData_checkExistWallet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/syncData/checkExistWallet");
    };
}
/// 同步用户钱包数据@POST
-(URLManagerModel *_Nullable)post_game_syncData_syncFundWallet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_syncData_syncFundWallet)))(self, @selector(jobs_post_game_syncData_syncFundWallet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_syncData_syncFundWallet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/syncData/syncFundWallet");
    };
}
#pragma mark —— 游戏数据统计
/// 统计注单流水稽核金额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryAuditAmount{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryAuditAmount)))(self, @selector(jobs_post_game_statis_queryAuditAmount)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryAuditAmount{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryAuditAmount");
    };
}
/// 查询会员投注记录统计@POST
-(URLManagerModel *_Nullable)post_game_statis_queryBetByLobbyName{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryBetByLobbyName)))(self, @selector(jobs_post_game_statis_queryBetByLobbyName)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryBetByLobbyName{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryBetByLobbyName");
    };
}
/// 统计下注会员数&投注金额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryBetInfoByAgent{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryBetInfoByAgent)))(self, @selector(jobs_post_game_statis_queryBetInfoByAgent)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryBetInfoByAgent{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryBetInfoByAgent");
    };
}
/// 查询游戏投注记录@POST
-(URLManagerModel *_Nullable)post_game_statis_queryBetListByPage{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryBetListByPage)))(self, @selector(jobs_post_game_statis_queryBetListByPage)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryBetListByPage{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryBetListByPage");
    };
}
/// 查询投注会员详情@POST
-(URLManagerModel *_Nullable)post_game_statis_queryGameOrderBetByPage{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryGameOrderBetByPage)))(self, @selector(jobs_post_game_statis_queryGameOrderBetByPage)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryGameOrderBetByPage{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryGameOrderBetByPage");
    };
}
/// 统计会员输赢@POST
-(URLManagerModel *_Nullable)post_game_statis_queryProfit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryProfit)))(self, @selector(jobs_post_game_statis_queryProfit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryProfit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryProfit");
    };
}
/// 查询会员总输赢@POST
-(URLManagerModel *_Nullable)post_game_statis_queryUserProfitLoss{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryUserProfitLoss)))(self, @selector(jobs_post_game_statis_queryUserProfitLoss)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryUserProfitLoss{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryUserProfitLoss");
    };
}
/// 统计游戏有效投注额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryValidBet{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryValidBet)))(self, @selector(jobs_post_game_statis_queryValidBet)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryValidBet{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryValidBet");
    };
}
/// 统计游戏有效投注额@POST
-(URLManagerModel *_Nullable)post_game_statis_queryValidBet2{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_statis_queryValidBet2)))(self, @selector(jobs_post_game_statis_queryValidBet2)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_statis_queryValidBet2{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/statis/queryValidBet2");
    };
}
#pragma mark —— 游戏配置模块
/// 获取游戏场馆大类信息@GET
-(URLManagerModel *_Nullable)get_game_lobby_getTopGameLobbyList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_game_lobby_getTopGameLobbyList)))(self, @selector(jobs_get_game_lobby_getTopGameLobbyList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_lobby_getTopGameLobbyList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/lobby/getTopGameLobbyList");
    };
}
#pragma mark —— 游戏首页娱乐城
/// 游戏导航列表：缓存1分钟@GET(仅适用于PC端)
-(URLManagerModel *_Nullable)get_game_home_bar_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_game_home_bar_list)))(self, @selector(jobs_get_game_home_bar_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_game_home_bar_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/bar/list");
    };
}
/// H5/APP 游戏导航列表：缓存10分钟 (仅适用于H5、App端)@GET
-(URLManagerModel *_Nullable)get_api_game_home_bar_mobile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_api_game_home_bar_mobile)))(self, @selector(jobs_get_api_game_home_bar_mobile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_api_game_home_bar_mobile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/bar/mobile");
    };
}
/// 游戏大厅喜爱的游戏-添加@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_favoriteGames_add)))(self, @selector(jobs_post_game_home_favoriteGames_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/favoriteGames/add");
    };
}
/// 菲站首页- 查询游戏收藏列表 仅适用于app端@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_app{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_favoriteGames_app)))(self, @selector(jobs_post_game_home_favoriteGames_app)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_app{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/favoriteGames/app");
    };
}
/// 游戏大厅喜爱的游戏-删除@DELETE
-(URLManagerModel *_Nullable)delete_game_home_favoriteGames_delete{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_delete_game_home_favoriteGames_delete)))(self, @selector(jobs_delete_game_home_favoriteGames_delete)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_game_home_favoriteGames_delete{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/favoriteGames/delete");
    };
}
/// 菲站首页- 查询游戏收藏列表 仅适用于H5端@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_h5{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_favoriteGames_h5)))(self, @selector(jobs_post_game_home_favoriteGames_h5)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_h5{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/favoriteGames/h5");
    };
}
/// 菲站首页- 查询所有厂商提供的老虎机游戏收藏列表@POST
-(URLManagerModel *_Nullable)post_game_home_favoriteGames_query{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_favoriteGames_query)))(self, @selector(jobs_post_game_home_favoriteGames_query)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_favoriteGames_query{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/favoriteGames/query");
    };
}
/// 菲站游戏大厅-模糊查询@POST
-(URLManagerModel *_Nullable)post_game_home_gameZone_fuzzyQuery{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_gameZone_fuzzyQuery)))(self, @selector(jobs_post_game_home_gameZone_fuzzyQuery)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_gameZone_fuzzyQuery{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/gameZone/fuzzyQuery");
    };
}
/// 菲站首页大厅场馆对应游戏列表-查询@POST
-(URLManagerModel *_Nullable)post_game_home_homeLobbyGame_query{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_homeLobbyGame_query)))(self, @selector(jobs_post_game_home_homeLobbyGame_query)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_homeLobbyGame_query{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/homeLobbyGame/query");
    };
}
/// 菲站首页大厅场馆对应累加资金-查询@POST
-(URLManagerModel *_Nullable)post_game_home_jackpotsGamesFunds_query{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_jackpotsGamesFunds_query)))(self, @selector(jobs_post_game_home_jackpotsGamesFunds_query)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_jackpotsGamesFunds_query{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/jackpotsGamesFunds/query");
    };
}
/// 菲站热门游戏/百家乐/轮盘/21点-查询@POST
-(URLManagerModel *_Nullable)post_game_home_liveCasino_quer{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_liveCasino_quer)))(self, @selector(jobs_post_game_home_liveCasino_quer)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_liveCasino_quer{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/liveCasino/query");
    };
}
/// 菲站首页- 受欢迎的游戏列表查询@POST
-(URLManagerModel *_Nullable)post_game_home_popularGames_query{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_popularGames_query)))(self, @selector(jobs_post_game_home_popularGames_query)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_popularGames_query{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/popularGames/query");
    };
}
/// 菲站电子游戏页面/热门游戏及最新游戏-查询@POST
-(URLManagerModel *_Nullable)post_game_home_slot_query{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_slot_query)))(self, @selector(jobs_post_game_home_slot_query)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_slot_query{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/slot/query");
    };
}
/// 前端- 查询所有厂商提供的老虎机游戏列表@POST
-(URLManagerModel *_Nullable)post_game_home_sub_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_home_sub_list)))(self, @selector(jobs_post_game_home_sub_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_home_sub_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/sub/list");
    };
}
/// 前端- 查询所有场馆提供的游戏列表 (仅适用于H5、App端)@POST
-(URLManagerModel *_Nullable)post_api_game_home_sub_mobile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_api_game_home_sub_mobile)))(self, @selector(jobs_post_api_game_home_sub_mobile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_api_game_home_sub_mobile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/home/sub/mobile");
    };
}
#pragma mark —— 进出游戏相关接口
/// 查询我的游戏注单详情@POST
-(URLManagerModel *_Nullable)post_game_bet_order_mybet_detail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_bet_order_mybet_detail)))(self, @selector(jobs_post_game_bet_order_mybet_detail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_order_mybet_detail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/order/mybet/detail");
    };
}
/// 查询我的游戏注单@POST
-(URLManagerModel *_Nullable)post_game_bet_order_mybet_sum{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_bet_order_mybet_sum)))(self, @selector(jobs_post_game_bet_order_mybet_sum)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_order_mybet_sum{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/order/mybet/sum");
    };
}
/// 获取游戏url@POST
-(URLManagerModel *_Nullable)post_game_bet_single_wallet_jump{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_game_bet_single_wallet_jump)))(self, @selector(jobs_post_game_bet_single_wallet_jump)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_game_bet_single_wallet_jump{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/game/bet/single-wallet/jump");
    };
}

@end
