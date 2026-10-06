# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::post_user_verCode_checkCodeMobile<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1140"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_user_verCode_sendSms<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1154"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::post_user_verCode_sendSms_login<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1174"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::post_member_invite_drawAward<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1188"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::get_member_invite_generateReferralCode<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1201"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::get_member_invite_queryHorseRing<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1214"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::get_member_invite_queryInviteBetAwardList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1227"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::get_member_invite_queryInviteBetConfig<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1240"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::get_member_invite_queryInviteDepAward<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1253"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::get_member_invite_queryInviteInfo<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1270"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::get_member_invite_queryInviteInfoTotalAward<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1283"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::get_member_invite_queryInviteVipConfig<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1296"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::post_user_verify_sendEmail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1310"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::post_user_bankcard_bind<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1324"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::post_user_bankcard_bindWithPhone<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1337"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::get_user_bankcard_cardTotal<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1350"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::get_user_bankcard_checkMobile<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1363"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::post_user_bankcard_checkBankCardTripartiteHttp<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1376"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::delete_user_bankcard<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1389"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::get_user_bankcard_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1402"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::post_user_bankcard_ph_bind<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:1415"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_promotion_feign_rolls_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:15"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_promotion_feign_rolls_use<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:28"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::get_promotion_heartbeat<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:42"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::get_promotion_activity_turntable_detail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@2/NSObject+URLMgr_2/NSObject+URLMgr_2.m:56"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
