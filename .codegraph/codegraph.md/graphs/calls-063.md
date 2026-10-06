# `calls 符号关系 - 063`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::post_game_bet_single_wallet_jump<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1224"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::get_operation_announce_config_queryAnnByMember<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:15"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::put_operation_letter_config_allReadStatus<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:28"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::put_operation_letter_config_deleteAll<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:41"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::put_operation_letter_config_deleteLetter<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:54"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::post_operation_letter_config_hasUnRead<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:67"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::post_operation_letter_config_queryLetterConfigSendList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:80"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::put_operation_letter_config_toReadStatus<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:93"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::post_operation_siteMain_queryDetail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:107"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_operation_tutorial_config_detailItem<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:121"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_api_operation_tutorial_config_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:134"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::post_operation_tutorial_config_listItem<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:147"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::post_operation_advice_config_saveAdviceConfig<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:161"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::get_operation_sponsor_high_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:175"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::get_operation_sponsor_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:188"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::get_invite_getInviteTerms<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:202"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_invite_inviteBetAwardStatistic<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:215"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::get_getReferralCode<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:228"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::post_fundDepositOrder<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@4/NSObject+URLMgr_4/NSObject+URLMgr_4.m:241"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::post_fund_adjust_adjustOrder<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:15"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::post_fund_adjust_auditFundAdjust<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:28"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_fund_adjust_batchAdjustOrderList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:41"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_fund_deposit_aipay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:55"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::post_fund_payment_aipay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:68"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::post_fund_callback_bbpay_depositCallback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:82"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
