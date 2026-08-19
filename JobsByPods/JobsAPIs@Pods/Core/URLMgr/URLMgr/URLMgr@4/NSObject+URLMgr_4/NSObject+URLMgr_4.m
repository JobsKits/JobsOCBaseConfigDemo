//
//  NSObject+URLMgr_4.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_4.h"

#import <JobsAPIs/NSObject+Extra.h>
/// 来自 http://18.162.73.145:18099/doc.html#/default
@implementation NSObject (URLMgr_4)
#pragma mark —— 信息配置
/// 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】@GET
-(URLManagerModel *_Nullable)get_operation_announce_config_queryAnnByMember{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_operation_announce_config_queryAnnByMember)))(self, @selector(jobs_get_operation_announce_config_queryAnnByMember)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_operation_announce_config_queryAnnByMember{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/announce/config/queryAnnByMember");
    };
}
/// 站内信全部变为已读【建议前端每5s刷新一次】@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_allReadStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_operation_letter_config_allReadStatus)))(self, @selector(jobs_put_operation_letter_config_allReadStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_allReadStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/letter/config/allReadStatus");
    };
}
/// 站内信全部删除@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_deleteAll{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_operation_letter_config_deleteAll)))(self, @selector(jobs_put_operation_letter_config_deleteAll)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_deleteAll{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/letter/config/deleteAll");
    };
}
/// 站内信删除@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_deleteLetter{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_operation_letter_config_deleteLetter)))(self, @selector(jobs_put_operation_letter_config_deleteLetter)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_deleteLetter{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/letter/config/deleteLetter");
    };
}
/// 是否有未读站内信【建议前端每5s刷新一次】@POST
-(URLManagerModel *_Nullable)post_operation_letter_config_hasUnRead{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_operation_letter_config_hasUnRead)))(self, @selector(jobs_post_operation_letter_config_hasUnRead)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_letter_config_hasUnRead{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/letter/config/hasUnRead");
    };
}
/// 站内信记录查询@POST
-(URLManagerModel *_Nullable)post_operation_letter_config_queryLetterConfigSendList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_operation_letter_config_queryLetterConfigSendList)))(self, @selector(jobs_post_operation_letter_config_queryLetterConfigSendList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_letter_config_queryLetterConfigSendList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/letter/config/queryLetterConfigSendList");
    };
}
/// 站内信变为已读@PUT
-(URLManagerModel *_Nullable)put_operation_letter_config_toReadStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_operation_letter_config_toReadStatus)))(self, @selector(jobs_put_operation_letter_config_toReadStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_operation_letter_config_toReadStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/letter/config/toReadStatus");
    };
}
#pragma mark —— 全站维护
/// 全站维护@POST
-(URLManagerModel *_Nullable)post_operation_siteMain_queryDetail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_operation_siteMain_queryDetail)))(self, @selector(jobs_post_operation_siteMain_queryDetail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_siteMain_queryDetail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/siteMain/queryDetail");
    };
}
#pragma mark —— 公共资源
/// 教程子项详情@POST
-(URLManagerModel *_Nullable)post_operation_tutorial_config_detailItem{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_operation_tutorial_config_detailItem)))(self, @selector(jobs_post_operation_tutorial_config_detailItem)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_tutorial_config_detailItem{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/tutorial/config/detailItem");
    };
}
/// 教程列表@POST
-(URLManagerModel *_Nullable)post_api_operation_tutorial_config_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_api_operation_tutorial_config_list)))(self, @selector(jobs_post_api_operation_tutorial_config_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_api_operation_tutorial_config_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/tutorial/config/list");
    };
}
/// 教程子项列表@POST
-(URLManagerModel *_Nullable)post_operation_tutorial_config_listItem{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_operation_tutorial_config_listItem)))(self, @selector(jobs_post_operation_tutorial_config_listItem)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_tutorial_config_listItem{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/tutorial/config/listItem");
    };
}
#pragma mark —— 资源配置
/// 意见保存@POST
-(URLManagerModel *_Nullable)post_operation_advice_config_saveAdviceConfig{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_operation_advice_config_saveAdviceConfig)))(self, @selector(jobs_post_operation_advice_config_saveAdviceConfig)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_operation_advice_config_saveAdviceConfig{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/advice/config/saveAdviceConfig");
    };
}
#pragma mark —— 赞助模块
/// 查询赞助集锦列表@GET
-(URLManagerModel *_Nullable)get_operation_sponsor_high_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_operation_sponsor_high_list)))(self, @selector(jobs_get_operation_sponsor_high_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_operation_sponsor_high_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/sponsor/high/list");
    };
}
/// 查询赞助图集列表@GET
-(URLManagerModel *_Nullable)get_operation_sponsor_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_operation_sponsor_list)))(self, @selector(jobs_get_operation_sponsor_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_operation_sponsor_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/operation/sponsor/list");
    };
}
#pragma mark —— 接口文档里面没有的
/// 获取好友邀请规则（邀请人数）@GET
-(URLManagerModel *_Nullable)get_invite_getInviteTerms{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_invite_getInviteTerms)))(self, @selector(jobs_get_invite_getInviteTerms)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_invite_getInviteTerms{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/getInviteTerms");
    };
}
/// 收益统计@POST
-(URLManagerModel *_Nullable)post_invite_inviteBetAwardStatistic{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_invite_inviteBetAwardStatistic)))(self, @selector(jobs_post_invite_inviteBetAwardStatistic)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_invite_inviteBetAwardStatistic{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/inviteBetAwardStatistic");
    };
}
/// 邀请好友链接@GET
-(URLManagerModel *_Nullable)get_getReferralCode{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_getReferralCode)))(self, @selector(jobs_get_getReferralCode)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_getReferralCode{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/getReferralCode");
    };
}
/// 银行-Deposit 提交@POST
-(URLManagerModel *_Nullable)post_fundDepositOrder{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fundDepositOrder)))(self, @selector(jobs_post_fundDepositOrder)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fundDepositOrder{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/fund/deposit/order");
    };
}

@end
