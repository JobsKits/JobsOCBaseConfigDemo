# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::post_KA_play<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:562"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_KA_revoke<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:575"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::post_KA_start<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:588"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::post_PB_ping<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:602"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::post_PB_wagering<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:615"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::post_PG_cashAdjustment<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:629"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::post_PG_cashGet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:642"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::post_PG_cashTransferInOut<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:655"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::post_PG_verifySession<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:668"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_game_fund_collect<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:682"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_game_fund_transferIn<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:695"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::post_game_fund_wallet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:708"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::post_game_bet_followList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:722"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::get_game_bet_mageXcess_queryRecord<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:735"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::post_game_bet_noLoginMemberIdList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:748"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::post_game_bet_orders<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:761"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_game_bet_pageList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:774"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::post_game_pay_pageList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:788"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::get_game_pagcor_gameLobbyImport<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:802"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::get_game_pagcor_order_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:816"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::post_game_job_fetchBetOrders<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:830"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_game_syncData_checkExistWallet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:843"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_game_syncData_syncFundWallet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:856"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::post_game_statis_queryAuditAmount<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:870"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::post_game_statis_queryBetByLobbyName<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:883"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
