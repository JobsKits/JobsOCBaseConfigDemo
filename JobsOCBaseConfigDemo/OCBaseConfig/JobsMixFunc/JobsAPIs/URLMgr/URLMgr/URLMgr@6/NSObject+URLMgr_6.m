//
//  NSObject+URLMgr_6.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_6.h"

#import "NSObject+Extra.h"
/// 来自  http://18.162.73.145:19201/doc.html#/home
@implementation NSObject (URLMgr_6)
#pragma mark —— C2C-充提黑名单
/// 新增C2C充提黑名单@POST
-(URLManagerModel *_Nullable)post_fund_c2c_dw_blackList_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_c2c_dw_blackList_add)))(self, @selector(jobs_post_fund_c2c_dw_blackList_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_c2c_dw_blackList_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/dw/blackList/add";
        return JobsURL(url);
    };
}
/// 修改C2C充提黑名单状态@PUT
-(URLManagerModel *_Nullable)put_fund_c2c_dw_blackList_change_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_fund_c2c_dw_blackList_change_status)))(self, @selector(jobs_put_fund_c2c_dw_blackList_change_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_fund_c2c_dw_blackList_change_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/dw/blackList/change/status";
        return JobsURL(url);
    };
}
/// 删除C2C充提黑名单@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_c2c_dw_blackList_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/fund/c2c/dw/blackList/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 查询C2C充提黑名单列表@GET
-(URLManagerModel *_Nullable)get_fund_c2c_dw_blackList_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_c2c_dw_blackList_list)))(self, @selector(jobs_get_fund_c2c_dw_blackList_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_c2c_dw_blackList_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/dw/blackList/list";
        return JobsURL(url);
    };
}
#pragma mark —— C2C-存取款占比
/// 新增C2C存取款占比配置@POST
-(URLManagerModel *_Nullable)post_fund_c2c_dwRatio_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_c2c_dwRatio_add)))(self, @selector(jobs_post_fund_c2c_dwRatio_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_c2c_dwRatio_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/dwRatio/add";
        return JobsURL(url);
    };
}
/// 删除C2C存取款占比配置@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_fund_c2c_dwRatio_deleteBy{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/fund/c2c/dwRatio/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 修改C2C存取款占比配置@PUT
-(URLManagerModel *_Nullable)put_fund_c2c_dwRatio_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_fund_c2c_dwRatio_edit)))(self, @selector(jobs_put_fund_c2c_dwRatio_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_fund_c2c_dwRatio_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/dwRatio/edit";
        return JobsURL(url);
    };
}
/// 获取C2C存取款占比配置详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_c2c_dwRatio_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/fund/c2c/dwRatio/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询C2C存取款占比配置列表@GET
-(URLManagerModel *_Nullable)get_fund_c2c_dwRatio_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_c2c_dwRatio_list)))(self, @selector(jobs_get_fund_c2c_dwRatio_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_c2c_dwRatio_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"fund/c2c/dwRatio/list";
        return JobsURL(url);
    };
}
#pragma mark —— C2C-提款搁置列表
/// 批量操作搁置订单@POST
-(URLManagerModel *_Nullable)post_fund_c2c_withdraw_hold_batch_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_c2c_withdraw_hold_batch_update)))(self, @selector(jobs_post_fund_c2c_withdraw_hold_batch_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_c2c_withdraw_hold_batch_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/withdraw/hold/batch/update";
        return JobsURL(url);
    };
}
/// 查询C2C提款搁置列表@GET
-(URLManagerModel *_Nullable)get_fund_c2c_withdraw_hold_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_c2c_withdraw_hold_list)))(self, @selector(jobs_get_fund_c2c_withdraw_hold_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_c2c_withdraw_hold_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/withdraw/hold/list";
        return JobsURL(url);
    };
}
#pragma mark —— C2C-提款搁置设置
/// 修改C2C提现风控配置@PUT
-(URLManagerModel *_Nullable)put_fund_c2c_risk_config_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_fund_c2c_risk_config_edit)))(self, @selector(jobs_put_fund_c2c_risk_config_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_fund_c2c_risk_config_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/risk/config/edit";
        return JobsURL(url);
    };
}
/// 获取C2C提现风控配置信息@GET
-(URLManagerModel *_Nullable)get_fund_c2c_risk_config_getInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_c2c_risk_config_getInfo)))(self, @selector(jobs_get_fund_c2c_risk_config_getInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_c2c_risk_config_getInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/risk/config/getInfo";
        return JobsURL(url);
    };
}
#pragma mark —— C2C-提现拆单开关设置
/// 拆单开关状态修改@PUT
-(URLManagerModel *_Nullable)put_fund_c2c_split_switch_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_fund_c2c_split_switch_edit)))(self, @selector(jobs_put_fund_c2c_split_switch_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_fund_c2c_split_switch_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/split/switch/edit";
        return JobsURL(url);
    };
}
/// 查询拆单开关状态@GET
-(URLManagerModel *_Nullable)get_fund_c2c_split_switch_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_c2c_split_switch_status)))(self, @selector(jobs_get_fund_c2c_split_switch_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_c2c_split_switch_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/split/switch/status";
        return JobsURL(url);
    };
}
#pragma mark —— C2C-提现拆单配置
/// 新增C2C提现拆单规则配置@POST
-(URLManagerModel *_Nullable)post_fund_c2c_split_rule_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_c2c_split_rule_add)))(self, @selector(jobs_post_fund_c2c_split_rule_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_c2c_split_rule_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/split/rule/add";
        return JobsURL(url);
    };
}
/// 删除C2C提现拆单规则配置@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_fund_c2c_split_rule_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/fund/c2c/split/rule/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 修改C2C提现拆单规则配置@PUT
-(URLManagerModel *_Nullable)put_fund_c2c_split_switch_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_fund_c2c_split_switch_status)))(self, @selector(jobs_put_fund_c2c_split_switch_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_fund_c2c_split_switch_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/split/rule/edit";
        return JobsURL(url);
    };
}
/// 查询C2C提现拆单规则配置列表@GET
-(URLManagerModel *_Nullable)get_fund_c2c_split_rule_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_c2c_split_rule_list)))(self, @selector(jobs_get_fund_c2c_split_rule_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_c2c_split_rule_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/split/rule/list";
        return JobsURL(url);
    };
}
#pragma mark —— C2C-提现风控配置日志
/// 查询C2C提现风控配置日志列表@GET
-(URLManagerModel *_Nullable)get_fund_c2c_risk_config_log_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_fund_c2c_risk_config_log_list)))(self, @selector(jobs_get_fund_c2c_risk_config_log_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_fund_c2c_risk_config_log_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/c2c/risk/config/log/list";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-代理转账审核接口
/// 保存代理转账@POST
-(URLManagerModel *_Nullable)post_agent_agentTransferAudit_agentTransferSave{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransferAudit_agentTransferSave)))(self, @selector(jobs_post_agent_agentTransferAudit_agentTransferSave)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransferAudit_agentTransferSave{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransferAudit/agentTransferSave";
        return JobsURL(url);
    };
}
/// 代理转账一审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_agentTransferAudit_firstPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransferAudit_firstPassOrRejection)))(self, @selector(jobs_post_agent_agentTransferAudit_firstPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransferAudit_firstPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransferAudit/firstPassOrRejection";
        return JobsURL(url);
    };
}
/// 查询代理转账审核列表@POST
-(URLManagerModel *_Nullable)post_agent_agentTransferAudit_getAgentTransferAuditList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransferAudit_getAgentTransferAuditList)))(self, @selector(jobs_post_agent_agentTransferAudit_getAgentTransferAuditList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransferAudit_getAgentTransferAuditList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransferAudit/getAgentTransferAuditList";
        return JobsURL(url);
    };
}
/// 代理转账二审审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_agentTransferAudit_secondPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransferAudit_secondPassOrRejection)))(self, @selector(jobs_post_agent_agentTransferAudit_secondPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransferAudit_secondPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransferAudit/secondPassOrRejection";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-配置中心_代存转账配置
/// 代存转账配置-查询@POST
-(URLManagerModel *_Nullable)post_configs_deposit_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_deposit_list)))(self, @selector(jobs_post_configs_deposit_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_deposit_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/deposit/list";
        return JobsURL(url);
    };
}
/// 代存转账配置-编辑@PUT
-(URLManagerModel *_Nullable)put_configs_deposit_saveOrUpdate{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_configs_deposit_saveOrUpdate)))(self, @selector(jobs_put_configs_deposit_saveOrUpdate)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_configs_deposit_saveOrUpdate{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/deposit/saveOrUpdate";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-配置中心_帮助中心(内容)
/// 帮助中心-查询问题分类@POST
-(URLManagerModel *_Nullable)post_config_help_center_classify_lists{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_help_center_classify_lists)))(self, @selector(jobs_post_config_help_center_classify_lists)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_help_center_classify_lists{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/help/center/classify/lists";
        return JobsURL(url);
    };
}
/// 帮助中心-删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)config_help_center_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/config/help/center/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心-查询@POST
-(URLManagerModel *_Nullable)post_config_help_center_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_help_center_list)))(self, @selector(jobs_post_config_help_center_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_help_center_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/help/center/list";
        return JobsURL(url);
    };
}
/// 帮助中心-新增@POST
-(URLManagerModel *_Nullable)post_config_help_center_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_help_center_save)))(self, @selector(jobs_post_config_help_center_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_help_center_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/help/center/save";
        return JobsURL(url);
    };
}
/// 帮助中心-编辑@POST
-(URLManagerModel *_Nullable)post_config_help_center_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_help_center_update)))(self, @selector(jobs_post_config_help_center_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_help_center_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/help/center/update";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-配置中心_帮助中心(分类)
/// 帮助中心分类问题-删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_config_help_center_classify_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/config/help/center/classify/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-查询@POST
-(URLManagerModel *_Nullable)post_config_help_center_classify_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_help_center_classify_list)))(self, @selector(jobs_post_config_help_center_classify_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_help_center_classify_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/help/center/classify/list";
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-新增@POST
-(URLManagerModel *_Nullable)post_config_help_center_classify_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_help_center_classify_save)))(self, @selector(jobs_post_config_help_center_classify_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_help_center_classify_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/help/center/classify/save";
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-编辑@POST
-(URLManagerModel *_Nullable)post_config_help_center_classify_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_help_center_classify_update)))(self, @selector(jobs_post_config_help_center_classify_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_help_center_classify_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/help/center/classify/update";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-配置中心_提现配置
/// 提款配置-查询@POST
-(URLManagerModel *_Nullable)post_configs_withdrawal_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_withdrawal_list)))(self, @selector(jobs_post_configs_withdrawal_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_withdrawal_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/withdrawal/list";
        return JobsURL(url);
    };
}
/// 提款配置-编辑@PUT
-(URLManagerModel *_Nullable)put_configs_withdrawal_saveOrUpdate{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_configs_withdrawal_saveOrUpdate)))(self, @selector(jobs_put_configs_withdrawal_saveOrUpdate)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_configs_withdrawal_saveOrUpdate{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/withdrawal/saveOrUpdate";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-配置中心_标签关系配置
/// 新增代理标签关系@POST
-(URLManagerModel *_Nullable)post_configs_tags_ref_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_tags_ref_add)))(self, @selector(jobs_post_configs_tags_ref_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_tags_ref_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/tags/ref/add";
        return JobsURL(url);
    };
}
/// 删除代理标签关系@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_configs_tags_ref_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/configs/tags/ref/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理标签信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_configs_tags_ref_getAgentTagRefListByAgentId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable agentId){
        NSString *url = @"/configs/tags/ref/getAgentTagRefList/{".add(agentId).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理所有标签信息@GET
-(URLManagerModel *_Nullable)get_configs_tags_ref_getAllTagList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_configs_tags_ref_getAllTagList)))(self, @selector(jobs_get_configs_tags_ref_getAllTagList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_configs_tags_ref_getAllTagList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/tags/ref/getAllTagList";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-配置中心_标签配置
/// 删除标签@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_configs_tags_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/configs/tags/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询标签用户数列表@POST
-(URLManagerModel *_Nullable)post_configs_tags_getTagAgentList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_tags_getTagAgentList)))(self, @selector(jobs_post_configs_tags_getTagAgentList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_tags_getTagAgentList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/tags/getTagAgentList";
        return JobsURL(url);
    };
}
/// 查询标签列表@POST
-(URLManagerModel *_Nullable)post_configs_tags_getTagList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_tags_getTagList)))(self, @selector(jobs_post_configs_tags_getTagList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_tags_getTagList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/tags/getTagList";
        return JobsURL(url);
    };
}
/// 新增标签@POST
-(URLManagerModel *_Nullable)post_configs_tags_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_tags_save)))(self, @selector(jobs_post_configs_tags_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_tags_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/tags/save";
        return JobsURL(url);
    };
}
/// 修改标签@POST
-(URLManagerModel *_Nullable)post_configs_tags_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_tags_update)))(self, @selector(jobs_post_configs_tags_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_tags_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/tags/update";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-配置中心_联系方式配置
/// 代理后台帮助中心联系方式查询@POST
-(URLManagerModel *_Nullable)post_configs_contact_getContactListForHelp{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_contact_getContactListForHelp)))(self, @selector(jobs_post_configs_contact_getContactListForHelp)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_contact_getContactListForHelp{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/contact/getContactListForHelp";
        return JobsURL(url);
    };
}
/// 联系方式配置-查询@POST
-(URLManagerModel *_Nullable)post_configs_contact_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_contact_list)))(self, @selector(jobs_post_configs_contact_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_contact_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/contact/list";
        return JobsURL(url);
    };
}
/// 联系方式配置-查询@POST
-(URLManagerModel *_Nullable)post_configs_contact_list_noLogin{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_contact_list_noLogin)))(self, @selector(jobs_post_configs_contact_list_noLogin)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_contact_list_noLogin{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/contact/list/noLogin";
        return JobsURL(url);
    };
}
/// 联系方式配置-查询@POST
-(URLManagerModel *_Nullable)post_configs_contact_saveOrUpdate{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_configs_contact_saveOrUpdate)))(self, @selector(jobs_post_configs_contact_saveOrUpdate)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_configs_contact_saveOrUpdate{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/configs/contact/saveOrUpdate";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-门店设备所有相关接口
/// 删除门店设备@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_store_device_info_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/store/device/info/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询门店设备列表@POST
-(URLManagerModel *_Nullable)post_store_device_info_getStoreDeviceInfoList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_store_device_info_getStoreDeviceInfoList)))(self, @selector(jobs_post_store_device_info_getStoreDeviceInfoList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_store_device_info_getStoreDeviceInfoList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/device/info/getStoreDeviceInfoList";
        return JobsURL(url);
    };
}
/// 新增门店设备@POST
-(URLManagerModel *_Nullable)post_store_device_info_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_store_device_info_save)))(self, @selector(jobs_post_store_device_info_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_store_device_info_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/device/info/save";
        return JobsURL(url);
    };
}
/// 修改门店设备@PUT
-(URLManagerModel *_Nullable)put_store_device_info_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_store_device_info_update)))(self, @selector(jobs_put_store_device_info_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_store_device_info_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/device/info/update";
        return JobsURL(url);
    };
}
#pragma mark —— PH_AGT-门店资讯接口
/// 查询ip所属区域名称@POST
-(URLManagerModel *_Nullable)post_ip_region_getRegion{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_ip_region_getRegion)))(self, @selector(jobs_post_ip_region_getRegion)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_ip_region_getRegion{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/ip/region/getRegion";
        return JobsURL(url);
    };
}
/// 删除门店@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_store_info_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/store/info/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询门店列表@POST
-(URLManagerModel *_Nullable)post_store_info_getStoreIfoByStoreId{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_store_info_getStoreIfoByStoreId)))(self, @selector(jobs_post_store_info_getStoreIfoByStoreId)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_store_info_getStoreIfoByStoreId{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/info/getStoreIfoByStoreId";
        return JobsURL(url);
    };
}
/// 查询门店列表@POST
-(URLManagerModel *_Nullable)post_store_info_getStoreIfoList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_store_info_getStoreIfoList)))(self, @selector(jobs_post_store_info_getStoreIfoList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_store_info_getStoreIfoList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/info/getStoreIfoList";
        return JobsURL(url);
    };
}
/// 新增门店@POST
-(URLManagerModel *_Nullable)post_store_info_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_store_info_save)))(self, @selector(jobs_post_store_info_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_store_info_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/info/save";
        return JobsURL(url);
    };
}
/// 修改门店@PUT
-(URLManagerModel *_Nullable)put_store_info_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_store_info_update)))(self, @selector(jobs_put_store_info_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_store_info_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/info/update";
        return JobsURL(url);
    };
}
/// 修改门店为停业@PUT
-(URLManagerModel *_Nullable)put_store_info_update_forstop{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_store_info_update_forstop)))(self, @selector(jobs_put_store_info_update_forstop)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_store_info_update_forstop{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/store/info/update/forstop";
        return JobsURL(url);
    };
}
#pragma mark —— VIP变更记录接口
/// 会员VIP等级自动降级--后台任务测试用@GET
-(URLManagerModel *_Nullable)get_member_vipLog_dwMemberVipLevel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_vipLog_dwMemberVipLevel)))(self, @selector(jobs_get_member_vipLog_dwMemberVipLevel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_vipLog_dwMemberVipLevel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLog/dwMemberVipLevel";
        return JobsURL(url);
    };
}
/// 查询会员VIP变更列表@GET
-(URLManagerModel *_Nullable)get_member_vipLog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_vipLog_list)))(self, @selector(jobs_get_member_vipLog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_vipLog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLog/list";
        return JobsURL(url);
    };
}
/// 查询某一个会员VIP变更列表@GET
-(URLManagerModel *_Nullable)get_member_vipLog_memberList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_vipLog_memberList)))(self, @selector(jobs_get_member_vipLog_memberList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_vipLog_memberList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLog/memberList";
        return JobsURL(url);
    };
}
/// 会员VIP等级自动升级--后台任务测试用@GET
-(URLManagerModel *_Nullable)get_member_vipLog_upMemberVipLevel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_vipLog_upMemberVipLevel)))(self, @selector(jobs_get_member_vipLog_upMemberVipLevel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_vipLog_upMemberVipLevel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLog/upMemberVipLevel";
        return JobsURL(url);
    };
}
/// upMemberVipZero@POST
-(URLManagerModel *_Nullable)post_member_vipLog_upMemberVipZero{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_vipLog_upMemberVipZero)))(self, @selector(jobs_post_member_vipLog_upMemberVipZero)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_vipLog_upMemberVipZero{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLog/upMemberVipZero";
        return JobsURL(url);
    };
}
#pragma mark —— VIP权益配置接口
/// 查询VIP权益配置列表@GET
-(URLManagerModel *_Nullable)get_vipRights_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vipRights_list)))(self, @selector(jobs_get_vipRights_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vipRights_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRights/list";
        return JobsURL(url);
    };
}
/// 查询vip开关配置---对外提供的接口@GET
-(URLManagerModel *_Nullable)get_vipRights_queryVipSwitchConfig{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vipRights_queryVipSwitchConfig)))(self, @selector(jobs_get_vipRights_queryVipSwitchConfig)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vipRights_queryVipSwitchConfig{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRights/queryVipSwitchConfig";
        return JobsURL(url);
    };
}
/// 查询VIP权益配置列表--对外提供的接口@POST
-(URLManagerModel *_Nullable)post_vipRights_rightsList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_vipRights_rightsList)))(self, @selector(jobs_post_vipRights_rightsList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_vipRights_rightsList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRights/rightsList";
        return JobsURL(url);
    };
}
/// 保存VIP权益配置@PUT
-(URLManagerModel *_Nullable)put_vipRights_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_vipRights_save)))(self, @selector(jobs_put_vipRights_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_vipRights_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRights/save";
        return JobsURL(url);
    };
}
/// 修改权益开关状态@PUT
-(URLManagerModel *_Nullable)put_vipRights_update_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_vipRights_update_status)))(self, @selector(jobs_put_vipRights_update_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_vipRights_update_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRights/update/status";
        return JobsURL(url);
    };
}
#pragma mark —— VIP等级配置内部服务接口
/// getVipLevelConfig@GET
-(URLManagerModel *)get_vip_api_levelConfigByTenantId:(NSString *)tenantId vipLevel:(NSString *)vipLevel{
    NSString *url = @"/vip/api/levelConfig/{".add(tenantId).add(@"}/{").add(vipLevel).add(@"}");
    return JobsURL(url);
}
#pragma mark —— VIP等级配置接口
/// 保存VIP等级配置@PUT
-(URLManagerModel *_Nullable)put_member_vipLevel_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_vipLevel_edit)))(self, @selector(jobs_put_member_vipLevel_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_vipLevel_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLevel/edit";
        return JobsURL(url);
    };
}
/// 查询VIP等级配置列表--对外接口@POST
-(URLManagerModel *_Nullable)post_member_vipLevel_levelList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_vipLevel_levelList)))(self, @selector(jobs_post_member_vipLevel_levelList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_vipLevel_levelList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLevel/levelList";
        return JobsURL(url);
    };
}
/// 查询VIP等级配置列表@GET
-(URLManagerModel *_Nullable)get_member_vipLevel_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_vipLevel_list)))(self, @selector(jobs_get_member_vipLevel_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_vipLevel_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLevel/list";
        return JobsURL(url);
    };
}
/// 查询所有VIP等级@GET
-(URLManagerModel *_Nullable)get_member_vipLevel_selectAll{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_vipLevel_selectAll)))(self, @selector(jobs_get_member_vipLevel_selectAll)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_vipLevel_selectAll{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/vipLevel/selectAll";
        return JobsURL(url);
    };
}
#pragma mark —— VIP返水配置接口
/// 根据等级获取VIP返水子项配置--代理服务用@POST
-(URLManagerModel *_Nullable)post_vipRebate_getConfigByLevel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_vipRebate_getConfigByLevel)))(self, @selector(jobs_post_vipRebate_getConfigByLevel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_vipRebate_getConfigByLevel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRebate/getConfigByLevel";
        return JobsURL(url);
    };
}
/// 查询VIP返水配置列表@GET
-(URLManagerModel *_Nullable)get_vipRebate_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vipRebate_list)))(self, @selector(jobs_get_vipRebate_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vipRebate_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRebate/list";
        return JobsURL(url);
    };
}
/// 查询VIP返水配置子项@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_vipRebate_queryConfigItem{
    return ^URLManagerModel *_Nullable(NSString *_Nullable lobbyCode){
        NSString *url = @"/vipRebate/queryConfigItem/{".add(lobbyCode).add(@"}");
        return JobsURL(url);
    };
}
/// 查询VIP返水配置列表--对外提供的接口@POST
-(URLManagerModel *_Nullable)post_vipRebate_rebateList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_vipRebate_rebateList)))(self, @selector(jobs_post_vipRebate_rebateList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_vipRebate_rebateList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRebate/rebateList";
        return JobsURL(url);
    };
}
/// 修改VIP返水配置@PUT
-(URLManagerModel *_Nullable)put_vipRebate_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_vipRebate_save)))(self, @selector(jobs_put_vipRebate_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_vipRebate_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRebate/save";
        return JobsURL(url);
    };
}
/// 保存VIP返水配置子项@POST
-(URLManagerModel *_Nullable)post_vipRebate_saveConfigItem{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_vipRebate_saveConfigItem)))(self, @selector(jobs_post_vipRebate_saveConfigItem)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_vipRebate_saveConfigItem{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRebate/saveConfigItem";
        return JobsURL(url);
    };
}
/// 修改返水开关状态@PUT
-(URLManagerModel *_Nullable)put_vipRebate_update_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_vipRebate_update_status)))(self, @selector(jobs_put_vipRebate_update_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_vipRebate_update_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRebate/update/status";
        return JobsURL(url);
    };
}
/// 修改返水提款流水倍数@PUT
-(URLManagerModel *_Nullable)put_vipRebate_updateRebateMultiple{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_vipRebate_updateRebateMultiple)))(self, @selector(jobs_put_vipRebate_updateRebateMultiple)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_vipRebate_updateRebateMultiple{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vipRebate/updateRebateMultiple";
        return JobsURL(url);
    };
}
#pragma mark —— activity-report-controller
/// 查询新手大礼包记录@POST
-(URLManagerModel *_Nullable)post_activity_newbie_gift_record_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_newbie_gift_record_list)))(self, @selector(jobs_post_activity_newbie_gift_record_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_newbie_gift_record_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/newbie/gift/record/list";
        return JobsURL(url);
    };
}
/// 导出新手大礼包记录@POST
-(URLManagerModel *_Nullable)post_activity_newbie_gift_record_list_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_newbie_gift_record_list_export)))(self, @selector(jobs_post_activity_newbie_gift_record_list_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_newbie_gift_record_list_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/newbie/gift/record/list/export";
        return JobsURL(url);
    };
}
/// 查询新手活动总详情@POST
-(URLManagerModel *_Nullable)post_activity_newbie_record_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_newbie_record_list)))(self, @selector(jobs_post_activity_newbie_record_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_newbie_record_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/newbie/record/list";
        return JobsURL(url);
    };
}
/// 导出活动总详情@POST
-(URLManagerModel *_Nullable)post_activity_newbie_record_list_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_newbie_record_list_export)))(self, @selector(jobs_post_activity_newbie_record_list_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_newbie_record_list_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/newbie/record/list/export";
        return JobsURL(url);
    };
}
/// 导出活动总详情@POST
-(URLManagerModel *_Nullable)post_activity_newbie_report_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_newbie_report_export)))(self, @selector(jobs_post_activity_newbie_report_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_newbie_report_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/newbie/report/export";
        return JobsURL(url);
    };
}
/// 查询新手活动统计报表@POST
-(URLManagerModel *_Nullable)post_activity_newbie_report_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_newbie_report_list)))(self, @selector(jobs_post_activity_newbie_report_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_newbie_report_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/newbie/report/list";
        return JobsURL(url);
    };
}
/// 查询复活大礼包记录@POST
-(URLManagerModel *_Nullable)post_activity_resurrection_gift_record_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_resurrection_gift_record_list)))(self, @selector(jobs_post_activity_resurrection_gift_record_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_resurrection_gift_record_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/resurrection/gift/record/list";
        return JobsURL(url);
    };
}
/// 导出复活大礼包记录@POST
-(URLManagerModel *_Nullable)post_activity_resurrection_gift_record_list_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_resurrection_gift_record_list_export)))(self, @selector(jobs_post_activity_resurrection_gift_record_list_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_resurrection_gift_record_list_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/resurrection/gift/record/list/export";
        return JobsURL(url);
    };
}
/// 查询签到大礼包记录@POST
-(URLManagerModel *_Nullable)post_activity_sign_gift_record_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_sign_gift_record_list)))(self, @selector(jobs_post_activity_sign_gift_record_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_sign_gift_record_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/sign/gift/record/list";
        return JobsURL(url);
    };
}
/// 导出签到大礼包记录@POST
-(URLManagerModel *_Nullable)post_activity_sign_gift_record_list_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_sign_gift_record_list_export)))(self, @selector(jobs_post_activity_sign_gift_record_list_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_sign_gift_record_list_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/sign/gift/record/list/export";
        return JobsURL(url);
    };
}
/// 查询签到记录@POST
-(URLManagerModel *_Nullable)post_activity_sign_record_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_sign_record_list)))(self, @selector(jobs_post_activity_sign_record_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_sign_record_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/sign/record/list";
        return JobsURL(url);
    };
}
/// 导出签到记录@POST
-(URLManagerModel *_Nullable)post_activity_sign_record_list_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_activity_sign_record_list_export)))(self, @selector(jobs_post_activity_sign_record_list_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_activity_sign_record_list_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/activity/sign/record/list/export";
        return JobsURL(url);
    };
}
#pragma mark —— agent-auto-package-controller
/// 保存自动打包信息@POST
-(URLManagerModel *_Nullable)post_agent_autoPackage_saveAutoPackageInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_autoPackage_saveAutoPackageInfo)))(self, @selector(jobs_post_agent_autoPackage_saveAutoPackageInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_autoPackage_saveAutoPackageInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/autoPackage/saveAutoPackageInfo";
        return JobsURL(url);
    };
}
#pragma mark —— member-kyc-controller
/// 查询用户KYC认证信息详情@GET
-(URLManagerModel *_Nullable)get_member_kyc_detail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_kyc_detail)))(self, @selector(jobs_get_member_kyc_detail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_kyc_detail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/kyc/detail";
        return JobsURL(url);
    };
}
/// 用户KYC认证信息编辑@POST
-(URLManagerModel *_Nullable)post_member_kyc_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_kyc_edit)))(self, @selector(jobs_post_member_kyc_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_kyc_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/kyc/edit";
        return JobsURL(url);
    };
}
/// 查询KYC列表@POST
-(URLManagerModel *_Nullable)post_member_kyc_page_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_kyc_page_list)))(self, @selector(jobs_post_member_kyc_page_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_kyc_page_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/kyc/page/list";
        return JobsURL(url);
    };
}
/// 用户KYC认证信息重置@GET
-(URLManagerModel *_Nullable)get_member_kyc_reset{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_kyc_reset)))(self, @selector(jobs_get_member_kyc_reset)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_kyc_reset{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/kyc/reset";
        return JobsURL(url);
    };
}
/// 查询KYC审核记录@GET
-(URLManagerModel *_Nullable)get_member_kyc_review_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_kyc_review_list)))(self, @selector(jobs_get_member_kyc_review_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_kyc_review_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/kyc/review/list";
        return JobsURL(url);
    };
}
/// 用户KYC认证信息审批@POST
-(URLManagerModel *_Nullable)post_member_kyc_review_option{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_kyc_review_option)))(self, @selector(jobs_post_member_kyc_review_option)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_kyc_review_option{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/kyc/review/option";
        return JobsURL(url);
    };
}
#pragma mark —— report-user-controller
-(URLManagerModel *_Nullable)get_oms_report_user_heartBeatSaveLogin{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_oms_report_user_heartBeatSaveLogin)))(self, @selector(jobs_get_oms_report_user_heartBeatSaveLogin)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_oms_report_user_heartBeatSaveLogin{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/oms/report/user/heartBeatSaveLogin";
        return JobsURL(url);
    };
}
#pragma mark —— 专家信息接口
/// 删除专家信息@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_expert_info_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/info/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取专家信息详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_expert_info_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/info/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询专家信息列表@GET
-(URLManagerModel *_Nullable)get_expert_info_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_expert_info_list)))(self, @selector(jobs_get_expert_info_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_expert_info_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/expert/info/list";
        return JobsURL(url);
    };
}
/// 新增专家信息@POST
-(URLManagerModel *_Nullable)post_expert_info_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_expert_info_save)))(self, @selector(jobs_post_expert_info_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_expert_info_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/expert/info/save";
        return JobsURL(url);
    };
}
/// 修改专家信息@PUT
-(URLManagerModel *_Nullable)put_expert_info_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_expert_info_update)))(self, @selector(jobs_put_expert_info_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_expert_info_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/expert/info/update";
        return JobsURL(url);
    };
}
/// 删除专家爆料方案信息@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_expert_plan_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/plan/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取专家爆料方案信息详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_expert_plan_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/plan/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询专家爆料方案信息列表@GET
-(URLManagerModel *_Nullable)get_expert_plan_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_expert_plan_list)))(self, @selector(jobs_get_expert_plan_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_expert_plan_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/expert/plan/list";
        return JobsURL(url);
    };
}
/// 新增专家爆料方案信息@POST
-(URLManagerModel *_Nullable)post_expert_plan_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_expert_plan_save)))(self, @selector(jobs_post_expert_plan_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_expert_plan_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/expert/plan/save";
        return JobsURL(url);
    };
}
/// 修改专家爆料方案信息@PUT
-(URLManagerModel *_Nullable)put_expert_plan_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_expert_plan_update)))(self, @selector(jobs_put_expert_plan_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_expert_plan_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/expert/plan/update";
        return JobsURL(url);
    };
}
#pragma mark —— 业务字典国际化管理
/// 创建字典类型@POST
-(URLManagerModel *_Nullable)post_oms_dict_bussiness_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_oms_dict_bussiness_add)))(self, @selector(jobs_post_oms_dict_bussiness_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_oms_dict_bussiness_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/oms/dict/bussiness/add";
        return JobsURL(url);
    };
}
/// 删除业务字典类型@GET
-(URLManagerModel *_Nullable)get_oms_dict_bussiness_delete{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_oms_dict_bussiness_delete)))(self, @selector(jobs_get_oms_dict_bussiness_delete)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_oms_dict_bussiness_delete{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/oms/dict/bussiness/delete";
        return JobsURL(url);
    };
}
/// 修改业务字典类型@POST
-(URLManagerModel *_Nullable)post_oms_dict_bussiness_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_oms_dict_bussiness_edit)))(self, @selector(jobs_post_oms_dict_bussiness_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_oms_dict_bussiness_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/oms/dict/bussiness/edit";
        return JobsURL(url);
    };
}
/// 获得字典类型的分页列表@GET
-(URLManagerModel *_Nullable)get_oms_dict_bussiness_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_oms_dict_bussiness_list)))(self, @selector(jobs_get_oms_dict_bussiness_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_oms_dict_bussiness_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/oms/dict/bussiness/list";
        return JobsURL(url);
    };
}
#pragma mark —— 个人中心接口
/// 获取个人信息@GET
-(URLManagerModel *_Nullable)get_user_profile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_profile)))(self, @selector(jobs_get_user_profile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_profile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/user/profile";
        return JobsURL(url);
    };
}
/// 修改个人信息@PUT
-(URLManagerModel *_Nullable)put_user_profile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_user_profile)))(self, @selector(jobs_put_user_profile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_user_profile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/user/profile";
        return JobsURL(url);
    };
}
/// 修改用户头像@POST
-(URLManagerModel *_Nullable)post_user_profile_avatar{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_profile_avatar)))(self, @selector(jobs_post_user_profile_avatar)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_profile_avatar{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/user/profile/avatar";
        return JobsURL(url);
    };
}
/// 修改密码@PUT
-(URLManagerModel *_Nullable)put_user_profile_updatePwd{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_user_profile_updatePwd)))(self, @selector(jobs_put_user_profile_updatePwd)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_user_profile_updatePwd{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/user/profile/updatePwd";
        return JobsURL(url);
    };
}
#pragma mark —— 中心钱包
/// 一键回收@POST
-(JobsRetURLManagerModelByStrBlock _Nonnull)post_fund_wallet_collectWalletByUserName{
    return ^URLManagerModel *_Nullable(NSString *_Nullable userName){
        NSString *url = @"/fund/wallet/collectWallet/{".add(userName).add(@"}");
        return JobsURL(url);
    };
}
/// 获取会员与转账场馆余额@POST
-(JobsRetURLManagerModelByStrBlock _Nonnull)post_fund_wallet_getMemberWallet{
    return ^URLManagerModel *_Nullable(NSString *_Nullable userName){
        NSString *url = @"/fund/wallet/getMemberWallet/{".add(userName).add(@"}");
        return JobsURL(url);
    };
}
/// 转入@POST
-(URLManagerModel *_Nullable)post_fund_wallet_transferIn{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_fund_wallet_transferIn)))(self, @selector(jobs_post_fund_wallet_transferIn)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_fund_wallet_transferIn{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/fund/wallet/transferIn";
        return JobsURL(url);
    };
}
#pragma mark —— 主播动态接口
/// 删除主播动态@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_presenter_dynamics_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/presenter/dynamics/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 获取主播动态详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_presenter_dynamics_getInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/presenter/dynamics/getInfo/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 查询主播动态列表@GET
-(URLManagerModel *_Nullable)get_presenter_dynamics_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_presenter_dynamics_list)))(self, @selector(jobs_get_presenter_dynamics_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_presenter_dynamics_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/presenter/dynamics/list";
        return JobsURL(url);
    };
}
/// 新增主播动态@POST
-(URLManagerModel *_Nullable)post_presenter_dynamics_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_presenter_dynamics_save)))(self, @selector(jobs_post_presenter_dynamics_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_presenter_dynamics_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/presenter/dynamics/save";
        return JobsURL(url);
    };
}
/// 修改主播动态@PUT
-(URLManagerModel *_Nullable)put_presenter_dynamics_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_presenter_dynamics_update)))(self, @selector(jobs_put_presenter_dynamics_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_presenter_dynamics_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/presenter/dynamics/update";
        return JobsURL(url);
    };
}
#pragma mark —— 主播管理接口
/// 删除超管信息@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_managerdelete{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/manager/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 导出超管信息列表@POST
-(URLManagerModel *_Nullable)post_manager_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_manager_export)))(self, @selector(jobs_post_manager_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_manager_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/manager/export";
        return JobsURL(url);
    };
}
/// 获取超管详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_manager_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/manager/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询超管信息列表@GET
-(URLManagerModel *_Nullable)get_manager_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_manager_list)))(self, @selector(jobs_get_manager_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_manager_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/manager/list";
        return JobsURL(url);
    };
}
/// 新增超管信息@POST
-(URLManagerModel *_Nullable)post_manager_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_manager_save)))(self, @selector(jobs_post_manager_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_manager_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/manager/save";
        return JobsURL(url);
    };
}
/// 修改超管信息@PUT
-(URLManagerModel *_Nullable)put_manager_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_manager_update)))(self, @selector(jobs_put_manager_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_manager_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/manager/update";
        return JobsURL(url);
    };
}
/// 删除主播信息@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_presenter_delete{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/presenter/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 导出主播信息列表@POST
-(URLManagerModel *_Nullable)post_presenter_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_presenter_export)))(self, @selector(jobs_post_presenter_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_presenter_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/presenter/export";
        return JobsURL(url);
    };
}
/// 获取主播详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_presenter_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/presenter/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询主播信息列表@GET
-(URLManagerModel *_Nullable)get_presenter_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_presenter_list)))(self, @selector(jobs_get_presenter_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_presenter_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/presenter/list";
        return JobsURL(url);
    };
}
/// 新增主播信息@POST
-(URLManagerModel *_Nullable)post_presenter_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_presenter_save)))(self, @selector(jobs_post_presenter_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_presenter_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/presenter/save";
        return JobsURL(url);
    };
}
/// 修改主播信息@PUT
-(URLManagerModel *_Nullable)put_presenter_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_presenter_update_6)))(self, @selector(jobs_put_presenter_update_6)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_presenter_update_6{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/presenter/update";
        return JobsURL(url);
    };
}
#pragma mark —— 代理-代理配置-所有接口
/// 银行管理 禁用或者开启【 0、禁用】【1、开启】@PUT
-(URLManagerModel *_Nullable)put_agent_config_bank_ban{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_bank_ban)))(self, @selector(jobs_put_agent_config_bank_ban)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_bank_ban{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/bank/ban";
        return JobsURL(url);
    };
}
/// 银行管理-删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_agent_config_bank_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/bank/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 银行管理-查询@POST
-(URLManagerModel *_Nullable)post_agent_config_bank_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_bank_list)))(self, @selector(jobs_post_agent_config_bank_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_bank_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/bank/list";
        return JobsURL(url);
    };
}
/// 银行管理-新增@POST
-(URLManagerModel *_Nullable)post_agent_config_bank_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_bank_save)))(self, @selector(jobs_post_agent_config_bank_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_bank_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/bank/save";
        return JobsURL(url);
    };
}
/// 银行管理-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_bank_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_bank_update)))(self, @selector(jobs_put_agent_config_bank_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_bank_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/bank/update";
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_agent_config_classify_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/classify/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-查询@POST
-(URLManagerModel *_Nullable)post_agent_config_classify_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_classify_list)))(self, @selector(jobs_post_agent_config_classify_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_classify_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/classify/list";
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-新增@POST
-(URLManagerModel *_Nullable)post_agent_config_classify_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_classify_save)))(self, @selector(jobs_post_agent_config_classify_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_classify_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/classify/save";
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_classify_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_classify_update)))(self, @selector(jobs_put_agent_config_classify_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_classify_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/classify/update";
        return JobsURL(url);
    };
}
/// 佣金配置-删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_agent_config_commission_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/commission/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 佣金配置-新增初始化@POST
-(URLManagerModel *_Nullable)post_agent_config_commission_init{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_commission_init)))(self, @selector(jobs_post_agent_config_commission_init)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_commission_init{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/commission/init";
        return JobsURL(url);
    };
}
/// 佣金配置-查询@GET
-(URLManagerModel *_Nullable)get_agent_config_commission_init{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_config_commission_init)))(self, @selector(jobs_get_agent_config_commission_init)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_config_commission_init{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/commission/list";
        return JobsURL(url);
    };
}
/// 佣金算法配置-查询@GET
-(URLManagerModel *_Nullable)get_agent_config_commission_math_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_config_commission_math_list)))(self, @selector(jobs_get_agent_config_commission_math_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_config_commission_math_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/commission/math/list";
        return JobsURL(url);
    };
}
/// 佣金算法配置-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_commission_math_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_commission_math_update)))(self, @selector(jobs_put_agent_config_commission_math_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_commission_math_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/commission/math/update";
        return JobsURL(url);
    };
}
/// 佣金配置-新增@POST
-(URLManagerModel *_Nullable)post_agent_config_commission_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_commission_save)))(self, @selector(jobs_post_agent_config_commission_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_commission_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/commission/save";
        return JobsURL(url);
    };
}
/// 佣金配置-编辑-不含场馆费率@PUT
-(URLManagerModel *_Nullable)put_agent_config_commission_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_commission_update)))(self, @selector(jobs_put_agent_config_commission_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_commission_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/commission/update";
        return JobsURL(url);
    };
}
/// 佣金配置-编辑-场馆费率@PUT
-(URLManagerModel *_Nullable)put_agent_config_commission_update_venue{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_commission_update_venue)))(self, @selector(jobs_put_agent_config_commission_update_venue)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_commission_update_venue{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/commission/update/venue";
        return JobsURL(url);
    };
}
/// 代存配置-查询@GET
-(URLManagerModel *_Nullable)get_agent_config_common_deposit_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_config_common_deposit_list)))(self, @selector(jobs_get_agent_config_common_deposit_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_config_common_deposit_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/deposit/list";
        return JobsURL(url);
    };
}
/// 代存配置-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_common_deposit_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_common_deposit_update)))(self, @selector(jobs_put_agent_config_common_deposit_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_common_deposit_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/deposit/update";
        return JobsURL(url);
    };
}
/// 提现汇率配置-查询@GET
-(URLManagerModel *_Nullable)get_agent_config_common_rate_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_config_common_rate_list)))(self, @selector(jobs_get_agent_config_common_rate_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_config_common_rate_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/rate/list";
        return JobsURL(url);
    };
}
/// 提现汇率配置-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_common_rate_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_common_rate_update)))(self, @selector(jobs_put_agent_config_common_rate_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_common_rate_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/rate/update";
        return JobsURL(url);
    };
}
/// 代理相关配置-查询@GET
-(URLManagerModel *_Nullable)get_agent_config_common_relation_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_config_common_relation_list)))(self, @selector(jobs_get_agent_config_common_relation_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_config_common_relation_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/relation/list";
        return JobsURL(url);
    };
}
/// 代理相关配置-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_common_relation_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_common_relation_update)))(self, @selector(jobs_put_agent_config_common_relation_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_common_relation_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/relation/update";
        return JobsURL(url);
    };
}
/// 提现方式配置-查询@GET
-(URLManagerModel *_Nullable)get_agent_config_common_type_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_config_common_type_list)))(self, @selector(jobs_get_agent_config_common_type_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_config_common_type_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/type/list";
        return JobsURL(url);
    };
}
/// 提现方式配置-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_common_type_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_common_type_update)))(self, @selector(jobs_put_agent_config_common_type_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_common_type_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/common/type/update";
        return JobsURL(url);
    };
}
/// 佣金配置-场馆费列表@GET
-(URLManagerModel *_Nullable)get_agent_config_getGameLobbyList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_config_getGameLobbyList)))(self, @selector(jobs_get_agent_config_getGameLobbyList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_config_getGameLobbyList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/getGameLobbyList";
        return JobsURL(url);
    };
}
/// 帮助中心-查询问题分类@POST
-(URLManagerModel *_Nullable)post_agent_config_help_classify_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_help_classify_list)))(self, @selector(jobs_post_agent_config_help_classify_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_help_classify_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/help/classify/list";
        return JobsURL(url);
    };
}
/// 帮助中心-删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_agent_config_help_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/help/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心-查询@POST
-(URLManagerModel *_Nullable)post_agent_config_help_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_help_list)))(self, @selector(jobs_post_agent_config_help_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_help_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/help/list";
        return JobsURL(url);
    };
}
/// 帮助中心-新增@POST
-(URLManagerModel *_Nullable)post_agent_config_help_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_help_save)))(self, @selector(jobs_post_agent_config_help_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_help_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/help/save";
        return JobsURL(url);
    };
}
/// 帮助中心-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_help_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_help_update)))(self, @selector(jobs_put_agent_config_help_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_help_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/help/update";
        return JobsURL(url);
    };
}
/// 出款通道-禁用或者开启@PUT
-(URLManagerModel *_Nullable)put_agent_config_outward_ban{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_outward_ban)))(self, @selector(jobs_put_agent_config_outward_ban)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_outward_ban{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/outward/ban";
        return JobsURL(url);
    };
}
/// 出款通道-删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_agent_config_outward_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/outward/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 出款通道-查询@POST
-(URLManagerModel *_Nullable)post_agent_config_outward_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_outward_list)))(self, @selector(jobs_post_agent_config_outward_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_outward_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/outward/list";
        return JobsURL(url);
    };
}
/// 出款通道-新增@POST
-(URLManagerModel *_Nullable)post_agent_config_outward_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_outward_save)))(self, @selector(jobs_post_agent_config_outward_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_outward_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/outward/save";
        return JobsURL(url);
    };
}
/// 出款通道-编辑@PUT
-(URLManagerModel *_Nullable)put_agent_config_outward_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_config_outward_update)))(self, @selector(jobs_put_agent_config_outward_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_config_outward_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/outward/update";
        return JobsURL(url);
    };
}
/// 佣金配置-同步场馆费@POST
-(URLManagerModel *_Nullable)post_agent_config_synchronizeVenueRate{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_config_synchronizeVenueRate)))(self, @selector(jobs_post_agent_config_synchronizeVenueRate)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_config_synchronizeVenueRate{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/config/synchronizeVenueRate";
        return JobsURL(url);
    };
}
#pragma mark —— 代理代存记录接口
/// 查询代理存款记录@POST
-(URLManagerModel *_Nullable)post_agent_depositRecord_getDepositRecord{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_depositRecord_getDepositRecord)))(self, @selector(jobs_post_agent_depositRecord_getDepositRecord)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_depositRecord_getDepositRecord{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/depositRecord/getDepositRecord";
        return JobsURL(url);
    };
}
/// 查询代存记录列表@POST
-(URLManagerModel *_Nullable)post_agent_depositRecord_getDepositRecordList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_depositRecord_getDepositRecordList)))(self, @selector(jobs_post_agent_depositRecord_getDepositRecordList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_depositRecord_getDepositRecordList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/depositRecord/getDepositRecordList";
        return JobsURL(url);
    };
}
/// 更新代理存款记录状态@POST
-(URLManagerModel *_Nullable)post_agent_depositRecord_updateDepositRecordStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_depositRecord_updateDepositRecordStatus)))(self, @selector(jobs_post_agent_depositRecord_updateDepositRecordStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_depositRecord_updateDepositRecordStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/depositRecord/updateDepositRecordStatus";
        return JobsURL(url);
    };
}
#pragma mark —— 代理代理接口
/// 查询代理树形列表@GET
-(URLManagerModel *_Nullable)get_agent_agentProxy_getCommissionAuditAgentProxyList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentProxy_getCommissionAuditAgentProxyList)))(self, @selector(jobs_get_agent_agentProxy_getCommissionAuditAgentProxyList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentProxy_getCommissionAuditAgentProxyList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentProxy/getCommissionAuditAgentProxyList";
        return JobsURL(url);
    };
}
/// 查询代理代理列表@GET
-(URLManagerModel *_Nullable)get_agent_agentProxy_getSuperiorAgentProxyList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentProxy_getSuperiorAgentProxyList)))(self, @selector(jobs_get_agent_agentProxy_getSuperiorAgentProxyList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentProxy_getSuperiorAgentProxyList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentProxy/getSuperiorAgentProxyList";
        return JobsURL(url);
    };
}
/// 根据佣金审核id查询代理@GET
-(URLManagerModel *_Nullable)get_agent_agentProxy_queryByAuditId{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentProxy_queryByAuditId)))(self, @selector(jobs_get_agent_agentProxy_queryByAuditId)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentProxy_queryByAuditId{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentProxy/queryByAuditId";
        return JobsURL(url);
    };
}
/// 根据代理id获取下级代理数据@GET
-(URLManagerModel *_Nullable)get_agent_agentProxy_querySubAgentByAgentId{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentProxy_querySubAgentByAgentId)))(self, @selector(jobs_get_agent_agentProxy_querySubAgentByAgentId)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentProxy_querySubAgentByAgentId{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentProxy/querySubAgentByAgentId";
        return JobsURL(url);
    };
}
#pragma mark —— 代理佣金审核接口
/// 佣金一审审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_commissionRecordAudit_firstPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionRecordAudit_firstPassOrRejection)))(self, @selector(jobs_post_agent_commissionRecordAudit_firstPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionRecordAudit_firstPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionRecordAudit/firstPassOrRejection";
        return JobsURL(url);
    };
}
/// 查询佣金方案详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_commissionRecordAudit_getCommissionRebateDetailInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/commissionRecordAudit/getCommissionRebateDetailInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询佣金审核列表@POST
-(URLManagerModel *_Nullable)post_agent_commissionRecordAudit_getCommissionRecordAuditList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionRecordAudit_getCommissionRecordAuditList)))(self, @selector(jobs_post_agent_commissionRecordAudit_getCommissionRecordAuditList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionRecordAudit_getCommissionRecordAuditList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionRecordAudit/getCommissionRecordAuditList";
        return JobsURL(url);
    };
}
/// 查询佣金场馆费列表@POST
-(URLManagerModel *_Nullable)post_agent_commissionRecordAudit_getCommissionVenueRateList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionRecordAudit_getCommissionVenueRateList)))(self, @selector(jobs_post_agent_commissionRecordAudit_getCommissionVenueRateList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionRecordAudit_getCommissionVenueRateList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionRecordAudit/getCommissionVenueRateList";
        return JobsURL(url);
    };
}
/// 查询公司输赢调整列表@GET
-(URLManagerModel *_Nullable)get_agent_commissionRecordAudit_getCompanyProfitAndLossAdjustRecordList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_commissionRecordAudit_getCompanyProfitAndLossAdjustRecordList)))(self, @selector(jobs_get_agent_commissionRecordAudit_getCompanyProfitAndLossAdjustRecordList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_commissionRecordAudit_getCompanyProfitAndLossAdjustRecordList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionRecordAudit/getCompanyProfitAndLossAdjustRecordList";
        return JobsURL(url);
    };
}
/// 查询佣金审核详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_commissionRecordAudit_getDetailInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/commissionRecordAudit/getDetailInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询下级代理佣金记录列表@POST
-(URLManagerModel *_Nullable)post_agent_commissionRecordAudit_getSubProxyCommissionDetailList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionRecordAudit_getSubProxyCommissionDetailList)))(self, @selector(jobs_post_agent_commissionRecordAudit_getSubProxyCommissionDetailList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionRecordAudit_getSubProxyCommissionDetailList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionRecordAudit/getSubProxyCommissionDetailList";
        return JobsURL(url);
    };
}
/// 佣金二审审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_commissionRecordAudit_secondPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionRecordAudit_secondPassOrRejection)))(self, @selector(jobs_post_agent_commissionRecordAudit_secondPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionRecordAudit_secondPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionRecordAudit/secondPassOrRejection";
        return JobsURL(url);
    };
}
#pragma mark —— 代理佣金记录明细接口
/// 查询佣金记录列表@POST
-(URLManagerModel *_Nullable)post_agent_commissionDetail_getCommissionDetailList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionDetail_getCommissionDetailList)))(self, @selector(jobs_post_agent_commissionDetail_getCommissionDetailList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionDetail_getCommissionDetailList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionDetail/getCommissionDetailList";
        return JobsURL(url);
    };
}
/// 查询场馆费明细列表@POST
-(URLManagerModel *_Nullable)post_agent_commissionDetail_getVenueFeeDetail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionDetail_getVenueFeeDetail)))(self, @selector(jobs_post_agent_commissionDetail_getVenueFeeDetail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionDetail_getVenueFeeDetail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionDetail/getVenueFeeDetail";
        return JobsURL(url);
    };
}
#pragma mark —— 代理佣金调加减录接口
/// 新增佣金加减记录@POST
-(URLManagerModel *_Nullable)post_agent_commissionAddSubRecord_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionAddSubRecord_add)))(self, @selector(jobs_post_agent_commissionAddSubRecord_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionAddSubRecord_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionAddSubRecord/add";
        return JobsURL(url);
    };
}
/// 查询佣金加减记录列表@POST
-(URLManagerModel *_Nullable)post_agent_commissionAddSubRecord_getCommissionAddSubRecordList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_commissionAddSubRecord_getCommissionAddSubRecordList)))(self, @selector(jobs_post_agent_commissionAddSubRecord_getCommissionAddSubRecordList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_commissionAddSubRecord_getCommissionAddSubRecordList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/commissionAddSubRecord/getCommissionAddSubRecordList";
        return JobsURL(url);
    };
}
#pragma mark —— 代理信息调整审核接口
/// 代理信息调整审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_agentInfoAdjustAudit_auditPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentInfoAdjustAudit_auditPassOrRejection)))(self, @selector(jobs_post_agent_agentInfoAdjustAudit_auditPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentInfoAdjustAudit_auditPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentInfoAdjustAudit/auditPassOrRejection";
        return JobsURL(url);
    };
}
/// 查询佣金加减记录列表@POST
-(URLManagerModel *_Nullable)post_agent_agentInfoAdjustAudit_getAgentInfoAdjustAuditList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentInfoAdjustAudit_getAgentInfoAdjustAuditList)))(self, @selector(jobs_post_agent_agentInfoAdjustAudit_getAgentInfoAdjustAuditList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentInfoAdjustAudit_getAgentInfoAdjustAuditList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentInfoAdjustAudit/getAgentInfoAdjustAuditList";
        return JobsURL(url);
    };
}
#pragma mark —— 代理公告配置接口
/// 删除代理公告@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_agent_notice_config_deleteByIDList{
    return ^URLManagerModel *_Nullable(NSString *_Nullable idList){
        NSString *url = @"/agent/notice/config/delete/{".add(idList).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_notice_config_getAgentNoticeDetailByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/notice/config/getAgentNoticeDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取公告未读条数@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_notice_config_getAgentNoticeUnreadByAgentName{
    return ^URLManagerModel *_Nullable(NSString *_Nullable agentName){
        NSString *url = @"/agent/notice/config/getAgentNoticeUnread/{".add(agentName).add(@"}");
        return JobsURL(url);
    };
}
/// 查询代理公告列表@POST
-(URLManagerModel *_Nullable)post_agent_notice_config_getNoticeList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_notice_config_getNoticeList)))(self, @selector(jobs_post_agent_notice_config_getNoticeList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_notice_config_getNoticeList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/notice/config/getNoticeList";
        return JobsURL(url);
    };
}
/// 新增代理公告@POST
-(URLManagerModel *_Nullable)post_agent_notice_config_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_notice_config_save)))(self, @selector(jobs_post_agent_notice_config_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_notice_config_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/notice/config/save";
        return JobsURL(url);
    };
}
/// 公告发送@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_notice_config_sendNoticeByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/notice/config/sendNotice/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 修改代理公告@PUT
-(URLManagerModel *_Nullable)put_agent_notice_config_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_notice_config_update)))(self, @selector(jobs_put_agent_notice_config_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_notice_config_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/notice/config/update";
        return JobsURL(url);
    };
}
#pragma mark —— 代理备注接口
/// 新增代理备注@POST
-(URLManagerModel *_Nullable)post_agent_agentRemark_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentRemark_add)))(self, @selector(jobs_post_agent_agentRemark_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentRemark_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentRemark/add";
        return JobsURL(url);
    };
}
/// 查询代理备注列表@POST
-(URLManagerModel *_Nullable)post_agent_agentRemark_getAgentRemarkList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentRemark_getAgentRemarkList)))(self, @selector(jobs_post_agent_agentRemark_getAgentRemarkList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentRemark_getAgentRemarkList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentRemark/getAgentRemarkList";
        return JobsURL(url);
    };
}
#pragma mark —— 代理提款风控审核接口-NEW
/// 提现审核通过或拒绝或搁置@POST
-(URLManagerModel *_Nullable)post_agent_withdrawalAudit_auditPassOrRejectionOrShunt{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_withdrawalAudit_auditPassOrRejectionOrShunt)))(self, @selector(jobs_post_agent_withdrawalAudit_auditPassOrRejectionOrShunt)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_withdrawalAudit_auditPassOrRejectionOrShunt{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalAudit/auditPassOrRejectionOrShunt";
        return JobsURL(url);
    };
}
/// 获取提款审核详细信息@POST
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_withdrawalAudit_getWithdrawalAuditDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/withdrawalAudit/getWithdrawalAuditDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询提款审核列表@POST
-(URLManagerModel *_Nullable)post_agent_withdrawalAudit_getWithdrawalAuditList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_withdrawalAudit_getWithdrawalAuditList)))(self, @selector(jobs_post_agent_withdrawalAudit_getWithdrawalAuditList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_withdrawalAudit_getWithdrawalAuditList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalAudit/getWithdrawalAuditList";
        return JobsURL(url);
    };
}
#pragma mark —— 代理新增审核接口
/// 代理新增审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_agentAddAudit_auditPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentAddAudit_auditPassOrRejection)))(self, @selector(jobs_post_agent_agentAddAudit_auditPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentAddAudit_auditPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentAddAudit/auditPassOrRejection";
        return JobsURL(url);
    };
}
/// 查询代理新增审核列表@POST
-(URLManagerModel *_Nullable)post_agent_agentAddAudit_getAgentAddAuditList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentAddAudit_getAgentAddAuditList)))(self, @selector(jobs_post_agent_agentAddAudit_getAgentAddAuditList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentAddAudit_getAgentAddAuditList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentAddAudit/getAgentAddAuditList";
        return JobsURL(url);
    };
}
/// 查询代理新增审核详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_agentAddAudit_getDetailInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentAddAudit/getDetailInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 代理新增接口
/// 新增代理(运营后台)@POST
-(URLManagerModel *_Nullable)post_agent_agentAdd_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentAdd_add)))(self, @selector(jobs_post_agent_agentAdd_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentAdd_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentAdd/add";
        return JobsURL(url);
    };
}
/// 新增代理(会员pc)@POST
-(URLManagerModel *_Nullable)post_agent_agentAdd_add_noLogin{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentAdd_add_noLogin)))(self, @selector(jobs_post_agent_agentAdd_add_noLogin)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentAdd_add_noLogin{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentAdd/add/noLogin";
        return JobsURL(url);
    };
}
/// 查询佣金方案列表@GET
-(URLManagerModel *_Nullable)get_agent_agentAdd_getCommissionRebateConfigList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentAdd_getCommissionRebateConfigList)))(self, @selector(jobs_get_agent_agentAdd_getCommissionRebateConfigList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentAdd_getCommissionRebateConfigList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentAdd/getCommissionRebateConfigList";
        return JobsURL(url);
    };
}
/// 查询上级代理账号@GET
-(URLManagerModel *_Nullable)get_agent_agentAdd_queryAgentUsername{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentAdd_queryAgentUsername)))(self, @selector(jobs_get_agent_agentAdd_queryAgentUsername)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentAdd_queryAgentUsername{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentAdd/queryAgentUsername";
        return JobsURL(url);
    };
}
/// 查询会员账号@GET
-(URLManagerModel *_Nullable)get_agent_agentAdd_queryMemberByUsername{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentAdd_queryMemberByUsername)))(self, @selector(jobs_get_agent_agentAdd_queryMemberByUsername)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentAdd_queryMemberByUsername{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentAdd/queryMemberByUsername";
        return JobsURL(url);
    };
}
#pragma mark —— 代理管理接口
/// 查询代理列表@POST
-(URLManagerModel *_Nullable)post_agent_manage_agentList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_manage_agentList)))(self, @selector(jobs_post_agent_manage_agentList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_manage_agentList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/agentList";
        return JobsURL(url);
    };
}
/// 查询代理直属活跃会员列表@POST
-(URLManagerModel *_Nullable)post_agent_manage_agentSubActiveMemberList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_manage_agentSubActiveMemberList)))(self, @selector(jobs_post_agent_manage_agentSubActiveMemberList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_manage_agentSubActiveMemberList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/agentSubActiveMemberList";
        return JobsURL(url);
    };
}
/// 查询代理直属下级列表@POST
-(URLManagerModel *_Nullable)post_agent_manage_agentSubList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_manage_agentSubList)))(self, @selector(jobs_post_agent_manage_agentSubList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_manage_agentSubList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/agentSubList";
        return JobsURL(url);
    };
}
/// 查询代理直属会员列表@POST
-(URLManagerModel *_Nullable)post_agent_manage_agentSubMemberList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_manage_agentSubMemberList)))(self, @selector(jobs_post_agent_manage_agentSubMemberList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_manage_agentSubMemberList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/agentSubMemberList";
        return JobsURL(url);
    };
}
/// 根据代理名模糊搜索@POST
-(URLManagerModel *_Nullable)post_agent_manage_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_manage_list)))(self, @selector(jobs_post_agent_manage_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_manage_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/list";
        return JobsURL(url);
    };
}
/// 获取代理信息查询下级所有@GET
-(URLManagerModel *_Nullable)get_agent_manage_queryActiveAgentInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_manage_queryActiveAgentInfo)))(self, @selector(jobs_get_agent_manage_queryActiveAgentInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_manage_queryActiveAgentInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/queryActiveAgentInfo";
        return JobsURL(url);
    };
}
/// 获取代理信息@GET
-(URLManagerModel *_Nullable)get_agent_manage_queryAgentInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_manage_queryAgentInfo)))(self, @selector(jobs_get_agent_manage_queryAgentInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_manage_queryAgentInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/queryAgentInfo";
        return JobsURL(url);
    };
}
#pragma mark —— 代理记录-提款记录接口-NEW
/// 强制成功@PUT
-(URLManagerModel *_Nullable)put_agent_withdrawalRecord_forcedSuccess{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_withdrawalRecord_forcedSuccess)))(self, @selector(jobs_put_agent_withdrawalRecord_forcedSuccess)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_withdrawalRecord_forcedSuccess{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/forcedSuccess";
        return JobsURL(url);
    };
}
/// 查询提现订单日志列表@POST
-(URLManagerModel *_Nullable)post_agent_withdrawalRecord_getWithdrawalOrderLogList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_withdrawalRecord_getWithdrawalOrderLogList)))(self, @selector(jobs_post_agent_withdrawalRecord_getWithdrawalOrderLogList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_withdrawalRecord_getWithdrawalOrderLogList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/getWithdrawalOrderLogList";
        return JobsURL(url);
    };
}
/// 查询代理取款记录@POST
-(URLManagerModel *_Nullable)post_agent_withdrawalRecord_getWithdrawalRecord{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_withdrawalRecord_getWithdrawalRecord)))(self, @selector(jobs_post_agent_withdrawalRecord_getWithdrawalRecord)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_withdrawalRecord_getWithdrawalRecord{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecord";
        return JobsURL(url);
    };
}
/// 获取提款记录详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_withdrawalRecord_getWithdrawalRecordDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecordDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理提现订单信息@GET
-(URLManagerModel *_Nullable)get_agent_withdrawalRecord_getWithdrawalRecordDetailByOrderNo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_withdrawalRecord_getWithdrawalRecordDetailByOrderNo)))(self, @selector(jobs_get_agent_withdrawalRecord_getWithdrawalRecordDetailByOrderNo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_withdrawalRecord_getWithdrawalRecordDetailByOrderNo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecordDetailByOrderNo";
        return JobsURL(url);
    };
}
/// 查询提款记录列表@POST
-(URLManagerModel *_Nullable)post_agent_withdrawalRecord_getWithdrawalRecordList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_withdrawalRecord_getWithdrawalRecordList)))(self, @selector(jobs_post_agent_withdrawalRecord_getWithdrawalRecordList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_withdrawalRecord_getWithdrawalRecordList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecordList";
        return JobsURL(url);
    };
}
/// 人工出款@PUT
-(URLManagerModel *_Nullable)put_agent_withdrawalRecord_manualPayout{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_withdrawalRecord_manualPayout)))(self, @selector(jobs_put_agent_withdrawalRecord_manualPayout)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_withdrawalRecord_manualPayout{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/manualPayout";
        return JobsURL(url);
    };
}
/// 拒绝出款@PUT
-(URLManagerModel *_Nullable)put_agent_withdrawalRecord_paymentReject{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_withdrawalRecord_paymentReject)))(self, @selector(jobs_put_agent_withdrawalRecord_paymentReject)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_withdrawalRecord_paymentReject{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/paymentReject";
        return JobsURL(url);
    };
}
/// 代理三方出款回调通知@POST
-(URLManagerModel *_Nullable)post_agent_withdrawalRecord_thirdCallBackNotify{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_withdrawalRecord_thirdCallBackNotify)))(self, @selector(jobs_post_agent_withdrawalRecord_thirdCallBackNotify)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_withdrawalRecord_thirdCallBackNotify{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/thirdCallBackNotify";
        return JobsURL(url);
    };
}
/// 通过出款@PUT
-(URLManagerModel *_Nullable)put_agent_withdrawalRecord_thirdPayout{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_withdrawalRecord_thirdPayout)))(self, @selector(jobs_put_agent_withdrawalRecord_thirdPayout)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_withdrawalRecord_thirdPayout{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/thirdPayout";
        return JobsURL(url);
    };
}
/// 三方出款失败@PUT
-(URLManagerModel *_Nullable)put_agent_withdrawalRecord_thirdPayoutFail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_agent_withdrawalRecord_thirdPayoutFail)))(self, @selector(jobs_put_agent_withdrawalRecord_thirdPayoutFail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_agent_withdrawalRecord_thirdPayoutFail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/thirdPayoutFail";
        return JobsURL(url);
    };
}
/// 更新代理取款记录状态@POST
-(URLManagerModel *_Nullable)post_agent_withdrawalRecord_updateWithdrawalRecordStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_withdrawalRecord_updateWithdrawalRecordStatus)))(self, @selector(jobs_post_agent_withdrawalRecord_updateWithdrawalRecordStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_withdrawalRecord_updateWithdrawalRecordStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/withdrawalRecord/updateWithdrawalRecordStatus";
        return JobsURL(url);
    };
}
#pragma mark —— 代理详情接口
/// 修改代理信息@POST
-(URLManagerModel *_Nullable)post_agent_agentDetail_agentUpdateStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentDetail_agentUpdateStatus)))(self, @selector(jobs_post_agent_agentDetail_agentUpdateStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentDetail_agentUpdateStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentDetail/agentUpdateStatus";
        return JobsURL(url);
    };
}
/// 修改代理信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_agentDetail_clearAgentPaymentPassword{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentDetail/clearAgentPaymentPassword/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_agentDetail_getAgentDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentDetail/getAgentDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理详细信息根据代理账号@GET
-(URLManagerModel *_Nullable)get_agent_agentDetail_getAgentDetailByAgentUserName{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_agentDetail_getAgentDetailByAgentUserName)))(self, @selector(jobs_get_agent_agentDetail_getAgentDetailByAgentUserName)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_agentDetail_getAgentDetailByAgentUserName{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentDetail/getAgentDetailByAgentUserName";
        return JobsURL(url);
    };
}
/// 获取代理财务信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_agentDetail_getAgentFinanceInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentDetail/getAgentFinanceInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询代理登录列表@POST
-(URLManagerModel *_Nullable)post_agent_agentDetail_getAgentLoginList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentDetail_getAgentLoginList)))(self, @selector(jobs_post_agent_agentDetail_getAgentLoginList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentDetail_getAgentLoginList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentDetail/getAgentLoginList";
        return JobsURL(url);
    };
}
/// 获取代理团队信息@POST
-(URLManagerModel *_Nullable)post_agent_agentDetail_getAgentTeamInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentDetail_getAgentTeamInfo)))(self, @selector(jobs_post_agent_agentDetail_getAgentTeamInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentDetail_getAgentTeamInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentDetail/getAgentTeamInfo";
        return JobsURL(url);
    };
}
#pragma mark —— 代理账变记录接口
/// 代理账变记录@POST
-(URLManagerModel *_Nullable)post_agent_wallet_operatorWalletRecord{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_wallet_operatorWalletRecord)))(self, @selector(jobs_post_agent_wallet_operatorWalletRecord)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_wallet_operatorWalletRecord{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/wallet/operatorWalletRecord";
        return JobsURL(url);
    };
}
/// 查询账变记录列表@POST
-(URLManagerModel *_Nullable)post_agent_walletRecord_getWalletRecordList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_walletRecord_getWalletRecordList)))(self, @selector(jobs_post_agent_walletRecord_getWalletRecordList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_walletRecord_getWalletRecordList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/walletRecord/getWalletRecordList";
        return JobsURL(url);
    };
}
#pragma mark —— 代理资金调整审核接口
/// 资金调整一审审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_fundAdjustAudit_firstPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_fundAdjustAudit_firstPassOrRejection)))(self, @selector(jobs_post_agent_fundAdjustAudit_firstPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_fundAdjustAudit_firstPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/fundAdjustAudit/firstPassOrRejection";
        return JobsURL(url);
    };
}
/// 查询资金调整审核列表@POST
-(URLManagerModel *_Nullable)post_agent_fundAdjustAudit_getFundAdjustAuditList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_fundAdjustAudit_getFundAdjustAuditList)))(self, @selector(jobs_post_agent_fundAdjustAudit_getFundAdjustAuditList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_fundAdjustAudit_getFundAdjustAuditList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/fundAdjustAudit/getFundAdjustAuditList";
        return JobsURL(url);
    };
}
/// 资金调整二审审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_fundAdjustAudit_secondPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_fundAdjustAudit_secondPassOrRejection)))(self, @selector(jobs_post_agent_fundAdjustAudit_secondPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_fundAdjustAudit_secondPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/fundAdjustAudit/secondPassOrRejection";
        return JobsURL(url);
    };
}
#pragma mark —— 代理资金调整接口
/// 保存资金调整@POST
-(URLManagerModel *_Nullable)post_agent_fundAdjust_fundAdjustSave{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_fundAdjust_fundAdjustSave)))(self, @selector(jobs_post_agent_fundAdjust_fundAdjustSave)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_fundAdjust_fundAdjustSave{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/fundAdjust/fundAdjustSave";
        return JobsURL(url);
    };
}
/// 保存资金调整@POST
-(URLManagerModel *_Nullable)post_agent_fundAdjust_getCreditWalletStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_fundAdjust_getCreditWalletStatus)))(self, @selector(jobs_post_agent_fundAdjust_getCreditWalletStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_fundAdjust_getCreditWalletStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/fundAdjust/getCreditWalletStatus";
        return JobsURL(url);
    };
}
/// 保存资金调整@POST
-(URLManagerModel *_Nullable)post_agent_fundAdjust_getFundAdjustWalletBalance{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_fundAdjust_getFundAdjustWalletBalance)))(self, @selector(jobs_post_agent_fundAdjust_getFundAdjustWalletBalance)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_fundAdjust_getFundAdjustWalletBalance{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/fundAdjust/getFundAdjustWalletBalance";
        return JobsURL(url);
    };
}
/// 保存资金调整@POST
-(URLManagerModel *_Nullable)post_agent_fundAdjust_getTransferWalletBalance{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_fundAdjust_getTransferWalletBalance)))(self, @selector(jobs_post_agent_fundAdjust_getTransferWalletBalance)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_fundAdjust_getTransferWalletBalance{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/fundAdjust/getTransferWalletBalance";
        return JobsURL(url);
    };
}
#pragma mark —— 代理转代审核接口
/// 代理转代申请@POST
-(URLManagerModel *_Nullable)post_agent_agentTransformAudit_agentTransformAuditSave{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransformAudit_agentTransformAuditSave)))(self, @selector(jobs_post_agent_agentTransformAudit_agentTransformAuditSave)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransformAudit_agentTransformAuditSave{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransformAudit/agentTransformAuditSave";
        return JobsURL(url);
    };
}
/// 代理转代一审审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_agentTransformAudit_firstPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransformAudit_firstPassOrRejection)))(self, @selector(jobs_post_agent_agentTransformAudit_firstPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransformAudit_firstPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransformAudit/firstPassOrRejection";
        return JobsURL(url);
    };
}
/// 查询代理转代审核详情@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_agent_agentTransformAudit_getAgentTransformAuditDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentTransformAudit/getAgentTransformAuditDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询代理转代审核列表@POST
-(URLManagerModel *_Nullable)post_agent_agentTransformAudit_getAgentTransformAuditList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransformAudit_getAgentTransformAuditList)))(self, @selector(jobs_post_agent_agentTransformAudit_getAgentTransformAuditList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransformAudit_getAgentTransformAuditList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransformAudit/getAgentTransformAuditList";
        return JobsURL(url);
    };
}
/// 获取当前会员的代理信息@POST
-(URLManagerModel *_Nullable)post_agent_agentTransformAudit_getMemberAgent{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransformAudit_getMemberAgent)))(self, @selector(jobs_post_agent_agentTransformAudit_getMemberAgent)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransformAudit_getMemberAgent{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransformAudit/getMemberAgent";
        return JobsURL(url);
    };
}
/// 获取会员上级代理@POST
-(URLManagerModel *_Nullable)post_agent_agentTransformAudit_getMemberSuperiorAgentName{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransformAudit_getMemberSuperiorAgentName)))(self, @selector(jobs_post_agent_agentTransformAudit_getMemberSuperiorAgentName)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransformAudit_getMemberSuperiorAgentName{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransformAudit/getMemberSuperiorAgentName";
        return JobsURL(url);
    };
}
/// 代理转代二审审核通过或拒绝@POST
-(URLManagerModel *_Nullable)post_agent_agentTransformAudit_secondPassOrRejection{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_agentTransformAudit_secondPassOrRejection)))(self, @selector(jobs_post_agent_agentTransformAudit_secondPassOrRejection)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_agentTransformAudit_secondPassOrRejection{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/agentTransformAudit/secondPassOrRejection";
        return JobsURL(url);
    };
}
#pragma mark —— 代理转账记录接口
/// 查询转账记录列表@POST
-(URLManagerModel *_Nullable)post_agent_transferRecord_getTransferRecordList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_agent_transferRecord_getTransferRecordList)))(self, @selector(jobs_post_agent_transferRecord_getTransferRecordList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_agent_transferRecord_getTransferRecordList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/transferRecord/getTransferRecordListn";
        return JobsURL(url);
    };
}
#pragma mark —— 会员信息接口
/// 同存款USDT查询@GET
-(URLManagerModel *_Nullable)get_member_user_OrderSameUSDT{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_OrderSameUSDT)))(self, @selector(jobs_get_member_user_OrderSameUSDT)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_OrderSameUSDT{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/OrderSameUSDT";
        return JobsURL(url);
    };
}
/// 批量删除会员标签@POST
-(URLManagerModel *_Nullable)post_member_user_batchDeleteMemberLabel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_batchDeleteMemberLabel)))(self, @selector(jobs_post_member_user_batchDeleteMemberLabel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_batchDeleteMemberLabel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/batchDeleteMemberLabel";
        return JobsURL(url);
    };
}
/// 获取会员信息详细修改项集合@POST
-(URLManagerModel *_Nullable)post_member_user_changeItem{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_changeItem)))(self, @selector(jobs_post_member_user_changeItem)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_changeItem{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/changeItem";
        return JobsURL(url);
    };
}
/// 查询代理所有会员@POST
-(URLManagerModel *_Nullable)post_member_user_count{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_count)))(self, @selector(jobs_post_member_user_count)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_count{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/count";
        return JobsURL(url);
    };
}
/// 修改会员信息@POST
-(URLManagerModel *_Nullable)post_member_user_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_edit)))(self, @selector(jobs_post_member_user_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/edit";
        return JobsURL(url);
    };
}
/// 导出会员信息列表@POST
-(URLManagerModel *_Nullable)post_member_user_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_export)))(self, @selector(jobs_post_member_user_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/export";
        return JobsURL(url);
    };
}
/// 提交编辑会员指定字段信息申请@POST
-(URLManagerModel *_Nullable)post_member_user_field{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_field)))(self, @selector(jobs_post_member_user_field)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_field{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/field";
        return JobsURL(url);
    };
}
/// 查询会员审核中的基本信息字段@POST
-(URLManagerModel *_Nullable)post_member_user_field_listStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_field_listStatus)))(self, @selector(jobs_post_member_user_field_listStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_field_listStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/field/list-status";
        return JobsURL(url);
    };
}
/// getMemberListByConditions@POST
-(URLManagerModel *_Nullable)post_member_user_get_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_get_list)))(self, @selector(jobs_post_member_user_get_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_get_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/get/list";
        return JobsURL(url);
    };
}
/// 获取会员信息详细信息@POST
-(URLManagerModel *_Nullable)post_member_user_getInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_getInfo)))(self, @selector(jobs_post_member_user_getInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_getInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/getInfo";
        return JobsURL(url);
    };
}
/// 获取会员门店id@POST
-(URLManagerModel *_Nullable)post_member_user_getUser{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_getUser)))(self, @selector(jobs_post_member_user_getUser)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_getUser{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/getUser";
        return JobsURL(url);
    };
}
/// 后台会员踢下线@GET
-(URLManagerModel *_Nullable)get_member_user_kickOffline{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_kickOffline)))(self, @selector(jobs_get_member_user_kickOffline)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_kickOffline{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/kickOffline";
        return JobsURL(url);
    };
}
/// 查询会员列表@GET
-(URLManagerModel *_Nullable)get_member_user_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_list)))(self, @selector(jobs_get_member_user_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/list";
        return JobsURL(url);
    };
}
/// 手机号码修改@POST
-(URLManagerModel *_Nullable)post_member_user_mobile_modify{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_mobile_modify)))(self, @selector(jobs_post_member_user_mobile_modify)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_mobile_modify{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/mobile/modify";
        return JobsURL(url);
    };
}
/// 查询在线会员列表@GET
-(URLManagerModel *_Nullable)get_member_user_onlineList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_onlineList)))(self, @selector(jobs_get_member_user_onlineList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_onlineList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/onlineList";
        return JobsURL(url);
    };
}
/// 套利分析-同存款ip查询-上部分@GET
-(URLManagerModel *_Nullable)get_member_user_orderSameIp{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_orderSameIp)))(self, @selector(jobs_get_member_user_orderSameIp)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_orderSameIp{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/orderSameIp";
        return JobsURL(url);
    };
}
/// queryLoginUserByIp@GET
-(URLManagerModel *_Nullable)get_member_user_queryLoginUserByIp{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_queryLoginUserByIp)))(self, @selector(jobs_get_member_user_queryLoginUserByIp)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_queryLoginUserByIp{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/queryLoginUserByIp";
        return JobsURL(url);
    };
}
/// 同存款ip查询@GET
-(URLManagerModel *_Nullable)get_member_user_queryOrderByOrderIp{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_queryOrderByOrderIp)))(self, @selector(jobs_get_member_user_queryOrderByOrderIp)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_queryOrderByOrderIp{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/queryOrderByOrderIp";
        return JobsURL(url);
    };
}
/// 重置会员短信次数@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_member_user_restVerifyCodeByMemberId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/member/user/restVerifyCode/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// queryLoginUserByIp@GET
-(URLManagerModel *_Nullable)get_member_user_sameIp{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_user_sameIp)))(self, @selector(jobs_get_member_user_sameIp)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_user_sameIp{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/sameIp";
        return JobsURL(url);
    };
}
/// 修改详情会员标签集合@POST
-(URLManagerModel *_Nullable)post_member_user_updateLabel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_updateLabel)))(self, @selector(jobs_post_member_user_updateLabel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_updateLabel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/updateLabel";
        return JobsURL(url);
    };
}
/// 会员状态更新@POST
-(URLManagerModel *_Nullable)post_member_user_updateStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_user_updateStatus)))(self, @selector(jobs_post_member_user_updateStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_user_updateStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/user/updateStatus";
        return JobsURL(url);
    };
}
#pragma mark —— 会员后台操作记录接口
/// 查询会员账号变更记录列表@GET
-(URLManagerModel *_Nullable)get_member_backendlog_changeList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_backendlog_changeList)))(self, @selector(jobs_get_member_backendlog_changeList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_backendlog_changeList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/changeList";
        return JobsURL(url);
    };
}
/// 查询会员账号详情变更记录列表@GET
-(URLManagerModel *_Nullable)get_member_backendlog_changeListByName{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_backendlog_changeListByName)))(self, @selector(jobs_get_member_backendlog_changeListByName)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_backendlog_changeListByName{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/changeListByName";
        return JobsURL(url);
    };
}
/// 会员一审核状态修改@PUT
-(URLManagerModel *_Nullable)put_member_backendlog_editState{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_backendlog_editState)))(self, @selector(jobs_put_member_backendlog_editState)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_backendlog_editState{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/editState";
        return JobsURL(url);
    };
}
/// 会员二审核状态修改@PUT
-(URLManagerModel *_Nullable)put_member_backendlog_editStateSecond{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_backendlog_editStateSecond)))(self, @selector(jobs_put_member_backendlog_editStateSecond)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_backendlog_editStateSecond{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/editStateSecond";
        return JobsURL(url);
    };
}
/// 获取会员后台操作记录详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_member_backendlog_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/member/backendlog/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员账号修改审核列表一审@GET
-(URLManagerModel *_Nullable)get_member_backendlog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_backendlog_list)))(self, @selector(jobs_get_member_backendlog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_backendlog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/list";
        return JobsURL(url);
    };
}
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *_Nullable)get_member_backendlog_listFinal{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_backendlog_listFinal)))(self, @selector(jobs_get_member_backendlog_listFinal)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_backendlog_listFinal{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/listFinal";
        return JobsURL(url);
    };
}
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *_Nullable)get_member_backendlog_listSecond{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_backendlog_listSecond)))(self, @selector(jobs_get_member_backendlog_listSecond)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_backendlog_listSecond{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/listSecond";
        return JobsURL(url);
    };
}
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *_Nullable)get_member_backendlog_queryBackendLogTypes{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_backendlog_queryBackendLogTypes)))(self, @selector(jobs_get_member_backendlog_queryBackendLogTypes)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_backendlog_queryBackendLogTypes{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/queryBackendLogTypes";
        return JobsURL(url);
    };
}
/// 查询会员账号详情变更前端操作项目类型集合@GET
-(URLManagerModel *_Nullable)get_member_backendlog_queryWebLogTypes{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_backendlog_queryWebLogTypes)))(self, @selector(jobs_get_member_backendlog_queryWebLogTypes)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_backendlog_queryWebLogTypes{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/backendlog/queryWebLogTypes";
        return JobsURL(url);
    };
}
#pragma mark —— 会员备注接口
/// 新增会员备注信息@POST
-(URLManagerModel *_Nullable)post_member_remark_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_remark_add)))(self, @selector(jobs_post_member_remark_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_remark_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/remark/add";
        return JobsURL(url);
    };
}
/// 查询会员备注列表@POST
-(URLManagerModel *_Nullable)post_member_remark_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_remark_list)))(self, @selector(jobs_post_member_remark_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_remark_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/remark/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员异常记录接口
/// 查询会员备注列表@POST
-(URLManagerModel *_Nullable)post_member_excelog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_excelog_list)))(self, @selector(jobs_post_member_excelog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_excelog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/excelog/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员操作日志接口
/// 查询会员备注列表@POST
-(URLManagerModel *_Nullable)get_member_operlog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_operlog_list)))(self, @selector(jobs_get_member_operlog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_operlog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/operlog/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员标签接口
/// 新增会员标签@POST
-(URLManagerModel *_Nullable)post_label_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_label_add)))(self, @selector(jobs_post_label_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_label_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/label/add";
        return JobsURL(url);
    };
}
/// 查询会员备注列表@PUT
-(URLManagerModel *_Nullable)put_label_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_label_edit)))(self, @selector(jobs_put_label_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_label_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/label/edit";
        return JobsURL(url);
    };
}
/// 获取会员标签详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_label_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/label/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员标签列表@GET
-(URLManagerModel *_Nullable)get_label_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_label_list)))(self, @selector(jobs_get_label_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_label_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/label/list";
        return JobsURL(url);
    };
}
/// 获取标签选择框列表@GET
-(URLManagerModel *_Nullable)get_label_member_optionSelect{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_label_member_optionSelect)))(self, @selector(jobs_get_label_member_optionSelect)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_label_member_optionSelect{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/label/member/optionSelect";
        return JobsURL(url);
    };
}
/// 获取会员关联的标签列表@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_label_memberByMemberId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/label/member/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// 删除会员标签@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_label_removeByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/label/remove/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询标签的所有会员@POST
-(URLManagerModel *_Nullable)post_label_selectMemberByLabelId{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_label_selectMemberByLabelId)))(self, @selector(jobs_post_label_selectMemberByLabelId)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_label_selectMemberByLabelId{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/label/selectMemberByLabelId";
        return JobsURL(url);
    };
}
/// 标签启用禁用@POST
-(URLManagerModel *_Nullable)post_label_updateStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_label_updateStatus)))(self, @selector(jobs_post_label_updateStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_label_updateStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/label/updateStatus";
        return JobsURL(url);
    };
}
#pragma mark —— 会员登录日志接口
/// 查询会员登录日志列表@GET
-(URLManagerModel *_Nullable)get_member_loginlog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_loginlog_list)))(self, @selector(jobs_get_member_loginlog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_loginlog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/loginlog/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员短信验证码记录接口
/// 分页查询会员短信验证码记录
-(URLManagerModel *_Nullable)post_vercodelog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_vercodelog_list)))(self, @selector(jobs_post_vercodelog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_vercodelog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/vercodelog/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员禁言记录接口
/// 批量解禁@POST
-(URLManagerModel *_Nullable)post_member_banLog_batchUntie{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_banLog_batchUntie)))(self, @selector(jobs_post_member_banLog_batchUntie)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_banLog_batchUntie{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/banLog/batchUntie";
        return JobsURL(url);
    };
}
/// 获取会员禁言记录详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_member_banLog_getInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/member/banLog/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员禁言记录列表@POST
-(URLManagerModel *_Nullable)post_member_banLog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_banLog_list)))(self, @selector(jobs_post_member_banLog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_banLog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/banLog/list";
        return JobsURL(url);
    };
}
/// 查询某个会员禁言记录列表@POST
-(URLManagerModel *_Nullable)post_member_banLog_memberList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_banLog_memberList)))(self, @selector(jobs_post_member_banLog_memberList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_banLog_memberList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/banLog/memberList";
        return JobsURL(url);
    };
}
/// 修改会员禁言记录@PUT
-(URLManagerModel *_Nullable)put_member_banLog_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_banLog_update)))(self, @selector(jobs_put_member_banLog_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_banLog_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/banLog/update";
        return JobsURL(url);
    };
}
#pragma mark —— 会员称号记录接口
/// 查询会员称号记录列表
-(URLManagerModel *_Nullable)get_member_titlelog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_titlelog_list)))(self, @selector(jobs_get_member_titlelog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_titlelog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/titlelog/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员管理-会员详情基本信息-财务信息
/// 查询会员个人充提信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_memberReport_depositAndWithdraw{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/fund/memberReport/depositAndWithdraw/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员个人提现流水信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_fund_memberReport_withdrawBetRequest{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/fund/memberReport/withdrawBetRequest/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 会员虚拟货币账号接口
/// 新增会员虚拟货币账号@POST
-(URLManagerModel *_Nullable)post_member_cryptocy_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_cryptocy_add)))(self, @selector(jobs_post_member_cryptocy_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_cryptocy_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/add";
        return JobsURL(url);
    };
}
/// 新增会员EB币钱包@POST
-(URLManagerModel *_Nullable)post_member_cryptocy_eb_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_cryptocy_eb_add)))(self, @selector(jobs_post_member_cryptocy_eb_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_cryptocy_eb_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/eb/add";
        return JobsURL(url);
    };
}
/// 查询会员EB币钱包列表@POST
-(URLManagerModel *_Nullable)post_member_cryptocy_eb_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_cryptocy_eb_list)))(self, @selector(jobs_post_member_cryptocy_eb_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_cryptocy_eb_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/eb/list";
        return JobsURL(url);
    };
}
/// 删除会员EB币钱包@POST
-(URLManagerModel *_Nullable)post_member_cryptocy_eb_remove{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_cryptocy_eb_remove)))(self, @selector(jobs_post_member_cryptocy_eb_remove)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_cryptocy_eb_remove{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/eb/remove";
        return JobsURL(url);
    };
}
/// 启用禁用会员EB币钱包@PUT
-(URLManagerModel *_Nullable)put_member_cryptocy_eb_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_cryptocy_eb_status)))(self, @selector(jobs_put_member_cryptocy_eb_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_cryptocy_eb_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/eb/status";
        return JobsURL(url);
    };
}
/// 查询会员虚拟货币账号列表@GET
-(URLManagerModel *_Nullable)get_member_cryptocy_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_cryptocy_list)))(self, @selector(jobs_get_member_cryptocy_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_cryptocy_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/list";
        return JobsURL(url);
    };
}
/// 删除会员虚拟货币账号@POST
-(URLManagerModel *_Nullable)post_member_cryptocy_remove{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_cryptocy_remove)))(self, @selector(jobs_post_member_cryptocy_remove)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_cryptocy_remove{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/remove";
        return JobsURL(url);
    };
}
/// 启用禁用会员虚拟货币账号@PUT
-(URLManagerModel *_Nullable)put_member_cryptocy_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_cryptocy_status)))(self, @selector(jobs_put_member_cryptocy_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_cryptocy_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptocy/status";
        return JobsURL(url);
    };
}
#pragma mark —— 会员虚拟货币账号操作记录接口
/// 查询员EB币钱包操作记录列表@GET
-(URLManagerModel *_Nullable)get_member_cryptolog_eb_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_cryptolog_eb_list)))(self, @selector(jobs_get_member_cryptolog_eb_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_cryptolog_eb_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptolog/eb/list";
        return JobsURL(url);
    };
}
/// 查询员虚拟货币账号操作记录列表@GET
-(URLManagerModel *_Nullable)get_member_cryptolog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_cryptolog_list)))(self, @selector(jobs_get_member_cryptolog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_cryptolog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/cryptolog/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员跟单信息接口
/// 查询会员跟单信息列表@GET
-(URLManagerModel *_Nullable)get_follow_order_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_follow_order_list)))(self, @selector(jobs_get_follow_order_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_follow_order_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/follow/order/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员银行卡接口
/// 新增会员银行卡@POST
-(URLManagerModel *_Nullable)post_member_bankcard_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_bankcard_add)))(self, @selector(jobs_post_member_bankcard_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_bankcard_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/bankcard/add";
        return JobsURL(url);
    };
}
/// 删除会员银行卡@POST
-(URLManagerModel *_Nullable)get_member_bankcard_delete{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_bankcard_delete)))(self, @selector(jobs_get_member_bankcard_delete)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_bankcard_delete{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/bankcard/delete";
        return JobsURL(url);
    };
}
/// 查询会员跟单信息列表@GET
-(URLManagerModel *_Nullable)get_member_bankcard_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_bankcard_list)))(self, @selector(jobs_get_member_bankcard_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_bankcard_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/bankcard/list";
        return JobsURL(url);
    };
}
/// 查询会员跟单信息列表@GET
-(URLManagerModel *_Nullable)get_member_bankcard_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_bankcard_status)))(self, @selector(jobs_get_member_bankcard_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_bankcard_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/bankcard/status";
        return JobsURL(url);
    };
}
#pragma mark —— 会员银行卡操作记录接口
/// 查询会员银行卡操作记录列表@GET
-(URLManagerModel *_Nullable)get_member_bankcardlog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_bankcardlog_list)))(self, @selector(jobs_get_member_bankcardlog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_bankcardlog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/bankcardlog/list";
        return JobsURL(url);
    };
}
#pragma mark —— 会员限制记录接口
/// 查询会员限制记录日志列表@GET
-(URLManagerModel *_Nullable)get_member_blocklog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_blocklog_list)))(self, @selector(jobs_get_member_blocklog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_blocklog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/blocklog/list";
        return JobsURL(url);
    };
}
/// 查询会员限制记录日志列表@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_member_blocklog_updateStatusByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/member/blocklog/updateStatus/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 批量解除会员限制@POST
-(URLManagerModel *_Nullable)post_member_blocklog_updateStatusBatch{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_blocklog_updateStatusBatch)))(self, @selector(jobs_post_member_blocklog_updateStatusBatch)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_blocklog_updateStatusBatch{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/member/blocklog/updateStatusBatch";
        return JobsURL(url);
    };
}
#pragma mark —— 佣金档位接口
/// 根据佣金审核记录id查询佣金档位@GET
-(URLManagerModel *_Nullable)get_agent_manage_queryByCommissionAuditId{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_manage_queryByCommissionAuditId)))(self, @selector(jobs_get_agent_manage_queryByCommissionAuditId)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_manage_queryByCommissionAuditId{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/queryByCommissionAuditId";
        return JobsURL(url);
    };
}
#pragma mark —— 参数配置接口
/// 新增参数配置@POST
-(URLManagerModel *_Nullable)post_config{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config)))(self, @selector(jobs_post_config)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config";
        return JobsURL(url);
    };
}
/// 修改参数配置@PUT
-(URLManagerModel *_Nullable)put_config{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_config)))(self, @selector(jobs_put_config)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_config{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config";
        return JobsURL(url);
    };
}
/// 根据参数键名查询参数值@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_config_configKeyByConfigKey{
    return ^URLManagerModel *_Nullable(NSString *_Nullable configKey){
        NSString *url = @"/config/configKey/{".add(configKey).add(@"}");
        return JobsURL(url);
    };
}
/// 导出参数配置@POST
-(URLManagerModel *_Nullable)post_config_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_export)))(self, @selector(jobs_post_config_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/export";
        return JobsURL(url);
    };
}
/// 获取参数配置分页列表@GET
-(URLManagerModel *_Nullable)get_config_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_config_list)))(self, @selector(jobs_get_config_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_config_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/list";
        return JobsURL(url);
    };
}
/// 地址动态关联查询@POST
-(URLManagerModel *_Nullable)post_config_province{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_config_province)))(self, @selector(jobs_post_config_province)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_config_province{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/province";
        return JobsURL(url);
    };
}
/// 刷新参数缓存@DELETE
-(URLManagerModel *_Nullable)delete_config_refreshCache{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_delete_config_refreshCache)))(self, @selector(jobs_delete_config_refreshCache)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_config_refreshCache{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/config/refreshCache";
        return JobsURL(url);
    };
}
/// 删除参数配置@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_configByConfigIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable configIds){
        NSString *url = @"/config/{".add(configIds).add(@"}");
        return JobsURL(url);
    };
}
/// 根据参数编号获取详细信息
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_configByConfigId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable configId){
        NSString *url = @"/config/{".add(configId).add(@"}");
        return JobsURL(url);
    };
}
/// add@POST
-(URLManagerModel *_Nullable)post_notice{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_notice)))(self, @selector(jobs_post_notice)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_notice{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/notice";
        return JobsURL(url);
    };
}
/// edit@PUT
-(URLManagerModel *_Nullable)put_notice{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_notice)))(self, @selector(jobs_put_notice)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_notice{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/notice";
        return JobsURL(url);
    };
}
/// list@GET
-(URLManagerModel *_Nullable)put_notice_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_notice_list)))(self, @selector(jobs_put_notice_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_notice_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/notice/list";
        return JobsURL(url);
    };
}
/// remove@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_noticeByNoticeIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable noticeIds){
        NSString *url = @"/notice/{".add(noticeIds).add(@"}");
        return JobsURL(url);
    };
}
/// getInfo@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_noticeByNoticeIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable noticeIds){
        NSString *url = @"/notice/{".add(noticeIds).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 国家-区号-编码-语言信息接口
/// 新增（国家-区号-编码-语言）信息@POST
-(URLManagerModel *_Nullable)post_countrycode_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_countrycode_add)))(self, @selector(jobs_post_countrycode_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_countrycode_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/countrycode/add";
        return JobsURL(url);
    };
}
/// 修改（国家-区号-编码-语言）状态@PUT
-(URLManagerModel *_Nullable)put_countrycode_changeStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_countrycode_changeStatus)))(self, @selector(jobs_put_countrycode_changeStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_countrycode_changeStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/countrycode/changeStatus";
        return JobsURL(url);
    };
}
/// 修改（国家-区号-编码-语言）信息@PUT
-(URLManagerModel *_Nullable)put_countrycode_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_countrycode_edit)))(self, @selector(jobs_put_countrycode_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_countrycode_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/countrycode/edit";
        return JobsURL(url);
    };
}
/// 根据ID获取(国家-区号-编码-语言)信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_countrycode_getInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/countrycode/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询（国家-区号-编码-语言）列表@GET
-(URLManagerModel *_Nullable)get_countrycode_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_countrycode_list)))(self, @selector(jobs_get_countrycode_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_countrycode_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/countrycode/list";
        return JobsURL(url);
    };
}
#pragma mark —— 国家编码服务接口
/// 获取单个国家编码详细信息@POST
-(URLManagerModel *_Nullable)post_countrycode_getInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_countrycode_getInfo)))(self, @selector(jobs_post_countrycode_getInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_countrycode_getInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/countrycode/get-info";
        return JobsURL(url);
    };
}
/// 获取国家编码信息列表@GET
-(URLManagerModel *_Nullable)get_countrycode_listInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_countrycode_listInfo)))(self, @selector(jobs_get_countrycode_listInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_countrycode_listInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/countrycode/list-info";
        return JobsURL(url);
    };
}
#pragma mark —— 场馆费管理
/// 场馆费率查询@GET
-(URLManagerModel *_Nullable)get_agent_manage_queryVenueRateConfigByCommissionAudit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_manage_queryVenueRateConfigByCommissionAudit)))(self, @selector(jobs_get_agent_manage_queryVenueRateConfigByCommissionAudit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_manage_queryVenueRateConfigByCommissionAudit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/queryVenueRateConfigByCommissionAudit";
        return JobsURL(url);
    };
}
/// 场馆费查询@GET
-(URLManagerModel *_Nullable)get_agent_manage_queryVenueRateConfigFeeByCommissionAudit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agent_manage_queryVenueRateConfigFeeByCommissionAudit)))(self, @selector(jobs_get_agent_manage_queryVenueRateConfigFeeByCommissionAudit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agent_manage_queryVenueRateConfigFeeByCommissionAudit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/agent/manage/queryVenueRateConfigFeeByCommissionAudit";
        return JobsURL(url);
    };
}
#pragma mark —— 场馆转入转出记录相关接口
/// 场馆转入转出记录列表@POST
-(URLManagerModel *_Nullable)post_api_game_pay_pageList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_api_game_pay_pageList)))(self, @selector(jobs_post_api_game_pay_pageList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_api_game_pay_pageList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/game/pay/pageList";
        return JobsURL(url);
    };
}
#pragma mark —— 媒体配置接口
/// 新增媒体配置@POST
-(URLManagerModel *_Nullable)post_media_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_media_add)))(self, @selector(jobs_post_media_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_media_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/media/add";
        return JobsURL(url);
    };
}
/// 删除媒体配置@POST
-(URLManagerModel *_Nullable)post_media_del{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_media_del)))(self, @selector(jobs_post_media_del)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_media_del{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/media/del";
        return JobsURL(url);
    };
}
/// 应用端媒体配置查询 - 用于 web,h5,ios,android 调用@POST
-(URLManagerModel *_Nullable)post_media_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_media_list)))(self, @selector(jobs_post_media_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_media_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/media/list";
        return JobsURL(url);
    };
}
/// 媒体配置查询@POST
-(URLManagerModel *_Nullable)post_media_query{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_media_query)))(self, @selector(jobs_post_media_query)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_media_query{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/media/query";
        return JobsURL(url);
    };
}
/// 修改媒体配置@POST
-(URLManagerModel *_Nullable)post_media_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_media_update)))(self, @selector(jobs_post_media_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_media_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/media/update";
        return JobsURL(url);
    };
}
#pragma mark —— 字典数据管理接口
/// 新增字典数据@POST
-(URLManagerModel *_Nullable)post_dict_data{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_dict_data)))(self, @selector(jobs_post_dict_data)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_dict_data{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/data";
        return JobsURL(url);
    };
}
/// 修改字典数据@PUT
-(URLManagerModel *_Nullable)put_dict_data{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_dict_data)))(self, @selector(jobs_put_dict_data)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_dict_data{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/data";
        return JobsURL(url);
    };
}
/// 导出字典数据@POST
-(URLManagerModel *_Nullable)post_dict_data_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_dict_data_export)))(self, @selector(jobs_post_dict_data_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_dict_data_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/data/export";
        return JobsURL(url);
    };
}
/// 获得字典数据的分页列表@GET
-(URLManagerModel *_Nullable)get_dict_data_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_dict_data_list)))(self, @selector(jobs_get_dict_data_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_dict_data_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/data/list";
        return JobsURL(url);
    };
}
/// 根据字典类型查询字典数据信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_dict_data_typeByDictType{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictType){
        NSString *url = @"/dict/data/type/{".add(dictType).add(@"}");
        return JobsURL(url);
    };
}
/// 删除字典数据@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_dict_dataByDictCodes{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCodes){
        NSString *url = @"/dict/data/{".add(dictCodes).add(@"}");
        return JobsURL(url);
    };
}
/// 查询字典数据详细@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_dict_dataByDictCode{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCode){
        NSString *url = @"/dict/data/{".add(dictCode).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 字典类型管理接口
/// 创建字典类型@POST
-(URLManagerModel *_Nullable)post_dict_type{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_dict_type)))(self, @selector(jobs_post_dict_type)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_dict_type{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/type";
        return JobsURL(url);
    };
}
/// 修改字典类型@PUT
-(URLManagerModel *_Nullable)put_dict_type{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_dict_type)))(self, @selector(jobs_put_dict_type)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_dict_type{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/type";
        return JobsURL(url);
    };
}
/// 导出字典类型数据@POST
-(URLManagerModel *_Nullable)post_dict_type_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_dict_type_export)))(self, @selector(jobs_post_dict_type_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_dict_type_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/type/export";
        return JobsURL(url);
    };
}
/// 获得字典类型的分页列表@GET
-(URLManagerModel *_Nullable)get_dict_type_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_dict_type_list)))(self, @selector(jobs_get_dict_type_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_dict_type_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/type/list";
        return JobsURL(url);
    };
}
/// 获取字典选择框列表@GET
-(URLManagerModel *_Nullable)get_dict_type_optionselect{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_dict_type_optionselect)))(self, @selector(jobs_get_dict_type_optionselect)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_dict_type_optionselect{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/type/optionselect";
        return JobsURL(url);
    };
}
/// 刷新字典缓存@DELETE
-(URLManagerModel *_Nullable)delete_dict_type_refreshCache{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_delete_dict_type_refreshCache)))(self, @selector(jobs_delete_dict_type_refreshCache)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_dict_type_refreshCache{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/dict/type/refreshCache";
        return JobsURL(url);
    };
}
/// 删除字典类型@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_dict_typeByDictCode{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCode){
        NSString *url = @"/dict/type/{".add(dictCode).add(@"}");
        return JobsURL(url);
    };
}
/// 查询字典类型详细@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_dict_typeByDictCode{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCode){
        NSString *url = @"/dict/type/{".add(dictCode).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 封面标签信息接口
/// 删除封面标签信息@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_front_cover_tag_deleteByIDs{
    return ^URLManagerModel *_Nullable(NSString *_Nullable IDs){
        NSString *url = @"/front/cover/tag/delete/{".add(IDs).add(@"}");
        return JobsURL(url);
    };
}
/// 获取封面标签信息详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_front_cover_tag_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable IDs){
        NSString *url = @"/front/cover/tag/getInfo/{".add(IDs).add(@"}");
        return JobsURL(url);
    };
}
/// 查询封面标签信息列表@GET
-(URLManagerModel *_Nullable)get_front_cover_tag_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_front_cover_tag_list)))(self, @selector(jobs_get_front_cover_tag_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_front_cover_tag_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/front/cover/tag/list";
        return JobsURL(url);
    };
}
/// 新增封面标签信息@GET
-(URLManagerModel *_Nullable)get_front_cover_tag_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_front_cover_tag_save)))(self, @selector(jobs_get_front_cover_tag_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_front_cover_tag_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/front/cover/tag/save";
        return JobsURL(url);
    };
}
/// 修改封面标签信息@PUT
-(URLManagerModel *_Nullable)put_front_cover_tag_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_front_cover_tag_update)))(self, @selector(jobs_put_front_cover_tag_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_front_cover_tag_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/front/cover/tag/update";
        return JobsURL(url);
    };
}
#pragma mark —— 岗位管理接口
/// 创建岗位@POST
-(URLManagerModel *_Nullable)post_post{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_post)))(self, @selector(jobs_post_post)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_post{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/post";
        return JobsURL(url);
    };
}
/// 修改岗位细信息@PUT
-(URLManagerModel *_Nullable)put_post{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_post)))(self, @selector(jobs_put_post)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_post{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/post";
        return JobsURL(url);
    };
}
/// 导出岗位列表@POST
-(URLManagerModel *_Nullable)post_post_export{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_post_export)))(self, @selector(jobs_post_post_export)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_post_export{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/post/export";
        return JobsURL(url);
    };
}
/// 获取岗位分页列表@GET
-(URLManagerModel *_Nullable)get_post_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_post_list)))(self, @selector(jobs_get_post_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_post_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/post/list";
        return JobsURL(url);
    };
}
/// 获取平台的所有岗位@GET
-(URLManagerModel *_Nullable)get_post_optionselect{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_post_optionselect)))(self, @selector(jobs_get_post_optionselect)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_post_optionselect{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/post/optionselect";
        return JobsURL(url);
    };
}
/// 删除岗位@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_postByPostIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable postIds){
        NSString *url = @"/post/{".add(postIds).add(@"}");
        return JobsURL(url);
    };
}
/// 根据岗位编号获取详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_postByPostIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable postId){
        NSString *url = @"/post/{".add(postId).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 平台管理接口
///新增平台@POST
-(URLManagerModel *_Nullable)post_tenant_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_tenant_add)))(self, @selector(jobs_post_tenant_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_tenant_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/tenant/add";
        return JobsURL(url);
    };
}
/// 修改平台状态@PUT
-(URLManagerModel *_Nullable)put_tenant_changeStatus{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_tenant_changeStatus)))(self, @selector(jobs_put_tenant_changeStatus)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_tenant_changeStatus{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/tenant/changeStatus";
        return JobsURL(url);
    };
}
/// 修改平台@PUT
-(URLManagerModel *_Nullable)put_tenant_edit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_tenant_edit)))(self, @selector(jobs_put_tenant_edit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_tenant_edit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/tenant/edit";
        return JobsURL(url);
    };
}
/// 获取平台详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_tenant_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/tenant/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询平台列表@GET
-(URLManagerModel *_Nullable)get_tenant_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_tenant_list)))(self, @selector(jobs_get_tenant_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_tenant_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/tenant/list";
        return JobsURL(url);
    };
}
#pragma mark —— 廣告管理接口
/// 新增廣告@POST
-(URLManagerModel *_Nullable)post_advertise_manage_add{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_advertise_manage_add)))(self, @selector(jobs_post_advertise_manage_add)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_advertise_manage_add{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/advertise/manage/add";
        return JobsURL(url);
    };
}
/// 刪除廣告@POST
-(URLManagerModel *_Nullable)post_advertise_manage_delete{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_advertise_manage_delete)))(self, @selector(jobs_post_advertise_manage_delete)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_advertise_manage_delete{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/advertise/manage/delete";
        return JobsURL(url);
    };
}
/// 後端內部調用前台廣告列表@POST
-(URLManagerModel *_Nullable)post_advertise_manage_getAdvertiseList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_advertise_manage_getAdvertiseList)))(self, @selector(jobs_post_advertise_manage_getAdvertiseList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_advertise_manage_getAdvertiseList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/advertise/manage/getAdvertiseList";
        return JobsURL(url);
    };
}
/// 取得廣告列表@POST
-(URLManagerModel *_Nullable)post_advertise_manage_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_advertise_manage_list)))(self, @selector(jobs_post_advertise_manage_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_advertise_manage_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/advertise/manage/list";
        return JobsURL(url);
    };
}
/// 禁用廣告@POST
-(URLManagerModel *_Nullable)post_advertise_manage_stop{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_advertise_manage_stop)))(self, @selector(jobs_post_advertise_manage_stop)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_advertise_manage_stop{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/advertise/manage/stop";
        return JobsURL(url);
    };
}
/// 禁用廣告@POST
-(URLManagerModel *_Nullable)post_advertise_manage_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_advertise_manage_update)))(self, @selector(jobs_post_advertise_manage_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_advertise_manage_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/advertise/manage/update";
        return JobsURL(url);
    };
}
#pragma mark —— 报表管理-PAG COR报表
#pragma mark —— 报表管理-PAG COR游戏场馆税率
#pragma mark —— 报表管理-分析管理-会员相关统计
#pragma mark —— 报表管理-分析管理-充值统计
#pragma mark —— 报表管理-游戏报表
#pragma mark —— 推单信息接口
#pragma mark —— 推广配置-域名
#pragma mark —— 推广配置-素材
#pragma mark —— 操作日志接口
#pragma mark —— 敏感词屏蔽记录接口
#pragma mark —— 敏感词配置信息接口
#pragma mark —— 活动获奖奖励列表所有接口
#pragma mark —— 活动访问统计列表所有接口
#pragma mark —— 活动访问记录所有接口
#pragma mark —— 活动配置相关接口
#pragma mark —— 流水稽核接口
#pragma mark —— 游戏平台维护
#pragma mark —— 游戏注单模块
#pragma mark —— 游戏配置模块
#pragma mark —— 用户管理接口
#pragma mark —— 电子钱包管理
#pragma mark —— 登录日志接口
#pragma mark —— 直播信息接口
#pragma mark —— 直播配置管理接口
#pragma mark —— 短信管理-->短信服务商信息
#pragma mark —— 短信管理-->短信验证码记录
#pragma mark —— 礼物信息接口
#pragma mark —— 礼物收益信息接口
#pragma mark —— 福利审核记录所有接口
#pragma mark —— 福利记录所有接口
#pragma mark —— 站点配置接口
#pragma mark —— 聊天室配置信息接口
#pragma mark —— 菜单信息管理接口
#pragma mark —— 角色信息管理接口
#pragma mark —— 资金管理-充提配置-充值流水倍率
#pragma mark —— 资金管理-充提配置-提现分单配置
#pragma mark —— 资金管理-充提配置-提现设置（大)
#pragma mark —— 资金管理-充提配置-提现设置（提现提示)
#pragma mark —— 资金管理-充提配置-提现设置（预)
#pragma mark —— 资金管理-充提配置-虚拟币汇率
#pragma mark —— 资金管理-充提配置-通道类型
#pragma mark —— 资金管理-充提配置-银行管理
#pragma mark —— 资金管理-财务审核-资金调整审核
#pragma mark —— 资金管理-财务审核-资金调整审核
#pragma mark —— 资金管理-财务审核-资金调整审核
#pragma mark —— 资金管理-账变记录
#pragma mark —— 资金管理-资金审核-资金订单站内信
#pragma mark —— 资金管理-资金记录-充值异常接口
#pragma mark —— 资金管理-资金记录-充值记录
#pragma mark —— 资金管理-资金记录-充值通道关闭日
#pragma mark —— 资金管理-资金记录-存款加送记录
#pragma mark —— 资金管理-资金记录-提款记录
#pragma mark —— 资金管理-资金记录-通道统计全部
#pragma mark —— 资金管理-资金记录-预约加送记录
#pragma mark —— 资金管理-资金调整
#pragma mark —— 资金管理-通道管理-入款通道分配
#pragma mark —— 资金管理-通道管理-出款方式分配
#pragma mark —— 资金管理-通道管理-商户信息接口
#pragma mark —— 资金管理-通道管理-商户入款通道
#pragma mark —— 赛程列表接口
#pragma mark —— 赛程管理接口
#pragma mark —— 运营配置-信息配置管理
#pragma mark —— 运营配置-公共资源配置模块
#pragma mark —— 运营配置-资源配置管理
#pragma mark —— 运营配置-赞助图集配置模块
#pragma mark —— 运营配置-赞助集锦配置模块
#pragma mark —— 返水记录列表所有接口
#pragma mark —— 邀请人流水奖励 -new
#pragma mark —— 邀请好友规则 -new
#pragma mark —— 邀请码
#pragma mark —— 邀请管理
#pragma mark —— 邀请管理 -new
#pragma mark —— 部门管理接口
#pragma mark —— 门店登录IP白名单接口
#pragma mark —— 门店管理-门店GGR报税报表
#pragma mark —— 风控公共配置接口
#pragma mark —— 风控审核接单人员接口
#pragma mark —— 风控层级与会员关系接口
#pragma mark —— 风控层级接口
#pragma mark —— 风控层级调整记录接口
#pragma mark —— 风控方案与用户关系接口
#pragma mark —— 风控方案设置接口
#pragma mark —— 风控策略与用户关系接口
#pragma mark —— 风控策略配置接口
#pragma mark —— 风控管理-风控审核-体育相似投注
#pragma mark —— 风控管理-风控审核-提现风控审核
#pragma mark —— 风控管理-风控审核-高额盈利统计
#pragma mark —— 风控管理-风控记录-风险调整记录
#pragma mark —— 黑名单信息接口
#pragma mark —— 黑名单调整记录接口
#pragma mark —— 根据佣金审核id查询代理
#pragma mark —— 根据代理id获取下级代理数据
#pragma mark —— 根据代理id获取下级代理数据
#pragma mark —— 代理佣金加减记录接口
#pragma mark —— 场馆费明细列表查询接口
#pragma mark —— 代理存款记录
#pragma mark —— 更新代理存款记录状态
#pragma mark —— 查询资金调整钱包余额接口
#pragma mark —— 代理转账钱包余额接口
#pragma mark —— 获取代理信息查询下级所有
#pragma mark —— 获取代理信息
#pragma mark —— 根据佣金审核记录id查询佣金档位
#pragma mark —— 场馆费率查询
#pragma mark —— 场馆费查询
#pragma mark —— 获取公告未读条数
#pragma mark —— 执行代理账变记录接口
#pragma mark —— 代理提款审核接口
#pragma mark —— 代理提款记录接口
#pragma mark —— 代理佣金钱包取款记录
#pragma mark —— 通过出款-代理提款记录接口
#pragma mark —— 更新代理取款记录状态
#pragma mark —— 第三方游戏注单接口
#pragma mark —— 风控方案信息接口
#pragma mark —— 代理标签接口
#pragma mark —— 代理标签关系接口
#pragma mark —— 推广链接充值会员数统计
#pragma mark —— 查询充值会员
#pragma mark —— 查询存款活动 加送金额 信息
#pragma mark —— 资金管理-通道管理-商户通道(包含
#pragma mark —— 资金管理-通道管理-商户出款通道 接口
#pragma mark —— 查询ip所属区域名称
#pragma mark —— 同存款USDT查询接口
#pragma mark —— 代理会员接口
#pragma mark —— 在线会员信息接口
#pragma mark —— 套利分析-同存款ip查询-上部分
#pragma mark —— 同存款ip查询接口
#pragma mark —— 查询充值分布列表
#pragma mark —— 查询用户分布列表
#pragma mark —— 场馆数据接口
#pragma mark —— 查询代理首页充值排行榜
#pragma mark —— 查询代理首页首充会员
#pragma mark —— 查询代理首页首充排行榜
#pragma mark —— 查询代理首页注册排行榜
#pragma mark —— 查询注册会员
#pragma mark —— 黑名单调整信息接口
#pragma mark —— 删除门店设备接口
#pragma mark —— 门店设备列表接口
#pragma mark —— 新增门店设备接口
#pragma mark —— 修改门店设备接口
#pragma mark —— 删除门店接口
#pragma mark —— 门店列表接口
#pragma mark —— 新增门店接口
#pragma mark —— 修改门店接口
#pragma mark —— 修改门店为停业
#pragma mark —— 删除门店登录IP白名单接口
#pragma mark —— 门店列登录IP白名單接口
#pragma mark —— 新增门店登录IP白名单接口
#pragma mark —— 福利中心数据接口

@end
