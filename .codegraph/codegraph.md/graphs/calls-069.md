# `calls 符号关系 - 069`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::get_member_vipLog_memberList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:837"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::get_member_vipLog_upMemberVipLevel<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:851"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::post_member_vipLog_upMemberVipZero<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:865"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::get_vipRights_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:880"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::get_vipRights_queryVipSwitchConfig<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:894"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::post_vipRights_rightsList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:908"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::put_vipRights_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:922"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::put_vipRights_update_status<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:936"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::get_vip_api_levelConfigByTenantId:vipLevel:<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:951"]
  T9["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSObject::put_member_vipLevel_edit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:957"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_member_vipLevel_levelList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:971"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::get_member_vipLevel_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:985"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::get_member_vipLevel_selectAll<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:999"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::post_vipRebate_getConfigByLevel<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1014"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::get_vipRebate_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1028"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::get_vipRebate_queryConfigItem<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1042"]
  T16["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSObject::post_vipRebate_rebateList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1049"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::put_vipRebate_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1063"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::post_vipRebate_saveConfigItem<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1077"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::put_vipRebate_update_status<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1091"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::put_vipRebate_updateRebateMultiple<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1105"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_activity_newbie_gift_record_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1120"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_activity_newbie_gift_record_list_export<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1134"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::post_activity_newbie_record_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1148"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::post_activity_newbie_record_list_export<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1162"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
