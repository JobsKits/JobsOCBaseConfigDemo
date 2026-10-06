# `calls 符号关系 - 064`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::post_fund_deposit_jwpay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:96"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_fund_callback_daxinyupay_depositCallbac<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:110"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::post_fund_deposit_gtpay_ph_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:124"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::post_fund_payment_gtpay_ph_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:137"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::post_fund_callback_gtpay_depositCallback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:151"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::post_fund_callback_hsCtPay_depositCallback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:165"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::post_fund_gcash_deposit_joypay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:179"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::post_fund_deposit_lhpay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:193"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::post_fund_callback_lubupay_depositCallback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:207"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::get_fund_deposit_mantapay_gcash_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:221"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_fund_deposit_mantapay_maya_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:234"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::get_fund_payment_mantapay_gcash_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:247"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::post_fund_payment_mantapay_maya_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:260"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::post_fund_gcash_deposit_pts_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:274"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::post_fund_gcash_payment_pts_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:287"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::post_fund_gcash_pts_withdraw_confirmation<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:300"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_fund_callback_ttpay_depositCallbackn<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:314"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::post_fund_callback_ttpay_depositCallback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:328"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::post_fund_deposit_wypay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:342"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::post_fund_deposit_xhPay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:356"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::post_fund_deposit_yfpay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:370"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_fund_deposit_yhpay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:384"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_fund_payment_yhpay_callback<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:397"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::post_fund_report_trade_page<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:411"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::get_fund_eWallet_balance_fiatByMCHID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:425"]
  T25["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
