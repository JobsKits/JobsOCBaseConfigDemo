# `calls 符号关系 - 071`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::put_expert_plan_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1501"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_oms_dict_bussiness_add<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1516"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::get_oms_dict_bussiness_delete<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1530"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::post_oms_dict_bussiness_edit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1544"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::get_oms_dict_bussiness_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1558"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::get_user_profile<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1573"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::put_user_profile<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1587"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::post_user_profile_avatar<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1601"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::put_user_profile_updatePwd<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1615"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_fund_wallet_collectWalletByUserName<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1630"]
  T10["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSObject::post_fund_wallet_getMemberWallet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1637"]
  T11["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSObject::post_fund_wallet_transferIn<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1644"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::delete_presenter_dynamics_deleteByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1659"]
  T13["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSObject::get_presenter_dynamics_getInfo<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1666"]
  T14["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSObject::get_presenter_dynamics_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1673"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::post_presenter_dynamics_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1687"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::put_presenter_dynamics_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1701"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::delete_managerdelete<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1716"]
  T18["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:NSObject::post_manager_export<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1723"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::get_manager_getInfoByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1737"]
  T20["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSObject::get_manager_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1744"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_manager_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1758"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::put_manager_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1772"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::delete_presenter_delete<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1786"]
  T24["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:NSObject::post_presenter_export<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:1793"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
