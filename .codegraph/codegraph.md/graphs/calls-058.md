# `calls 符号关系 - 058`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::get_promotion_activity_turntable_prize_get<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:69"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_promotion_activity_turntable_record<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:82"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::get_promotion_activity_turntable_user_num<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:95"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::get_promotion_activity_turntable_user_record<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:108"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::get_promotion_advertise_info_list_activity<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:122"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::get_promotion_advertise_infoP_list_appIndex<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:135"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::get_promotion_advertise_info_list_appMember<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:148"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::get_promotion_advertise_info_list_index<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:161"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::get_promotion_advertise_info_list_navigationBar<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:174"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::get_promotion_activity_newbie_detail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:188"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::get_promotion_get_user_newbie_gift_detail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:201"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::get_promotion_get_user_newbie_qualifications<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:214"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::get_promotion_get_user_sign_gift_detail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:227"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::get_promotion_newbie_user_resurrection_receive<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:240"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::get_promotion_newbie_user_resurrection_statusGet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:253"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::get_promotion_newbie_user_sign<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:266"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_promotion_api_client_activity_getActivity<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:280"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::post_promotion_api_client_activity_getDepositDiscountActivityRecord<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:293"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::post_promotion_api_client_activity_getMemberSignActivityRecord<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:306"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::get_promotion_api_client_activity_getObtainDepositBonus<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:319"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::get_promotion_api_client_activity_queryActivityInfo<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:332"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::get_promotion_api_client_activity_queryInTransit123DepositOrdersCount<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:345"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::get_promotion_api_client_activity_sign<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:358"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::get_promotion_event_activity_bet_total<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:371"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::post_promotion_event_activity_claimp<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:384"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
