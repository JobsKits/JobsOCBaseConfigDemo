# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::get_vip_queryMemberVip<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:169"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::get_vip_queryMemberVipDetail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:182"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::get_vip_queryMemberVipLevels<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:195"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::get_vip_queryMemberVipRebates<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:208"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::get_vip_queryMemberVipRights<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:221"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::get_vip_queryVipSwitchConfig<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:234"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::delete_address_deleteByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:248"]
  T7["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSObject::get_address_detailByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:255"]
  T8["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:NSObject::get_address_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:262"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_address_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:275"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_address_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:288"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::put_member_bindEmail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:302"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::member_bindMobile_put<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:315"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::get_member_get<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:328"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::get_member_getByMemberId<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:341"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::put_member_memberUpdateLock<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:354"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::get_member_queryMemberStoreId<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:367"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::get_member_refreshIdentityCode<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:380"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::put_member_updateAvatar<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:393"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::put_member_updateBirthday<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:406"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::put_member_updateNickname<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:419"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::put_member_updatePassword<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:432"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::put_member_updateSex<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:445"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::put_member_updateMemberInfo<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:458"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::put_member_updateRandomIdentifiert<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:471"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
