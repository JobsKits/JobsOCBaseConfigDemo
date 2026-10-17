# `calls 符号关系 - 063`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::post_fund_report_trade_page<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:411"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::get_fund_eWallet_balance_fiatByMCHID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:425"]
  T2["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:NSObject::post_fund_eWallet_payment_fiat<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:432"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::post_fund_merchantBiz_agentPayment_fiat<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:445"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::post_fund_merchantBiz_agentPayment_usdt<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:458"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::get_fund_merchantBiz_balance_fiatByMCHID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:471"]
  T6["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSObject::get_fund_merchantBiz_balance_usdtByMCHID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:478"]
  T7["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSObject::post_fund_merchantBiz_deposit_fiat<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:485"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::post_fund_merchantBiz_deposit_usdt<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:498"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_fund_merchantBiz_payment_fiat<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:511"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_fund_merchantBiz_payment_usdt<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:524"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::post_fund_withdraw_confirmOrder<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:538"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::post_fund_withdraw_eWallet_order<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:551"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::post_fund_withdraw_ebpay_order<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:564"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::get_fund_withdraw_get_order_statusByOrderNo<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:577"]
  T15["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSObject::post_fund_withdraw_getOrder<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:584"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_fund_withdraw_order<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:597"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::post_fund_withdraw_usdtOrder<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:610"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::get_fund_crypto_getRate_usdt_rateType:fiatCurrency:<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:624"]
  T19["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:NSObject::post_fund_deposit_agentDepositRecor<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:630"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::post_fund_deposit_c2cOrder<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:643"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::put_fund_deposit_cancel_order<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:656"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::get_fund_deposit_getChanelDeposit_Limit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:669"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::get_fund_deposit_getDeposit_gift<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:682"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::get_fund_deposit_getOrder_statusByOrderNo<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@5/NSObject+URLMgr_5/NSObject+URLMgr_5.m:695"]
  T25["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
