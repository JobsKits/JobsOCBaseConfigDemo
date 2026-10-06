# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::post_agent_commissionRecordAudit_getCommissionRecordAuditList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2462"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_agent_commissionRecordAudit_getCommissionVenueRateList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2476"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::get_agent_commissionRecordAudit_getCompanyProfitAndLossAdjustRecordList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2490"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::get_agent_commissionRecordAudit_getDetailInfoByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2504"]
  T4["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSObject::post_agent_commissionRecordAudit_getSubProxyCommissionDetailList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2511"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::post_agent_commissionRecordAudit_secondPassOrRejection<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2525"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::post_agent_commissionDetail_getCommissionDetailList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2540"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::post_agent_commissionDetail_getVenueFeeDetail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2554"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::post_agent_commissionAddSubRecord_add<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2569"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_agent_commissionAddSubRecord_getCommissionAddSubRecordList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2583"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_agent_agentInfoAdjustAudit_auditPassOrRejection<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2598"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::post_agent_agentInfoAdjustAudit_getAgentInfoAdjustAuditList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2612"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::delete_agent_notice_config_deleteByIDList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2627"]
  T13["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSObject::get_agent_notice_config_getAgentNoticeDetailByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2634"]
  T14["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSObject::get_agent_notice_config_getAgentNoticeUnreadByAgentName<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2641"]
  T15["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSObject::post_agent_notice_config_getNoticeList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2648"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_agent_notice_config_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2662"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::get_agent_notice_config_sendNoticeByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2676"]
  T18["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:NSObject::put_agent_notice_config_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2683"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::post_agent_agentRemark_add<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2698"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::post_agent_agentRemark_getAgentRemarkList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2712"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_agent_withdrawalAudit_auditPassOrRejectionOrShunt<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2727"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::get_agent_withdrawalAudit_getWithdrawalAuditDetail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2741"]
  T23["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSObject::post_agent_withdrawalAudit_getWithdrawalAuditList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2748"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::post_agent_agentAddAudit_auditPassOrRejection<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:2763"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
