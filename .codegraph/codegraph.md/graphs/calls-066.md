# `calls 符号关系 - 066`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::put_configs_withdrawal_saveOrUpdate<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:488"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_configs_tags_ref_add<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:503"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::get_configs_tags_ref_deleteByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:517"]
  T3["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:NSObject::get_configs_tags_ref_getAgentTagRefListByAgentId<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:524"]
  T4["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSObject::get_configs_tags_ref_getAllTagList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:531"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::get_configs_tags_deleteByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:546"]
  T6["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSObject::post_configs_tags_getTagAgentList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:553"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::post_configs_tags_getTagList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:567"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::post_configs_tags_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:581"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::post_configs_tags_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:595"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_configs_contact_getContactListForHelp<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:610"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::post_configs_contact_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:624"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::post_configs_contact_list_noLogin<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:638"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::post_configs_contact_saveOrUpdate<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:652"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::delete_store_device_info_deleteByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:667"]
  T15["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSObject::post_store_device_info_getStoreDeviceInfoList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:674"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_store_device_info_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:688"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::put_store_device_info_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:702"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::post_ip_region_getRegion<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:717"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::delete_store_info_deleteByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:731"]
  T20["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSObject::post_store_info_getStoreIfoByStoreId<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:738"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_store_info_getStoreIfoList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:752"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_store_info_save<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:766"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::put_store_info_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:780"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::put_store_info_update_forstop<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@6/NSObject+URLMgr_6/NSObject+URLMgr_6.m:794"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
