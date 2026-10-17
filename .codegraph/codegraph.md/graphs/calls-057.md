# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::get_promotion_event_activity_bet_total<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:371"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_promotion_event_activity_claimp<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:384"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::get_promotion_event_activity_record<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:397"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::post_promotion_event_memberSign<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:410"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::post_promotion_event_memberSignEvent<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:423"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::get_promotion_welfare_claim<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:437"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::post_promotion_welfare_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:450"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::get_promotion_welfare_statistic<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:463"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::post_promotion_welfare_vip_claim<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:476"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_game_home_queryTopGamesList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:15"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::get_CQ9_checkPlayerByPlayerName<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:29"]
  T11["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSObject::get_CQ9_getBalanceByPlayerName<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:36"]
  T12["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:NSObject::post_CQ9_bet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:43"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::post_CQ9_credit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:56"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::post_CQ9_debit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:69"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::post_CQ9_EndRound<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:82"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_CQ9_refund<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:95"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::post_CQ9_rollin<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:108"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::post_CQ9_rollOut<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:121"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::post_CQ9_takeAll<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:134"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::get_CQ9_recordByMTCode<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:147"]
  T21["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSObject::post_CQ9_payoff<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:154"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::get_CQ9_errorHtml<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:167"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::post_CQ9_errorHtml<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:180"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::put_CQ9_errorHtml<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:193"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
