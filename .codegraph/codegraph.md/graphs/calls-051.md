# `calls 符号关系 - 051`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:IP_api::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供丰富的地理位置信息【GET】/IP_api/IP_api.m:13"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:IP_api::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供丰富的地理位置信息【GET】/IP_api/IP_api.m:27"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:Ipdata_api::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供免费和付费选项的地理位置和 IP 查询服务【GET】/Ipdata_api/Ipdata_api.m:13"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:Ipdata_api::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供免费和付费选项的地理位置和 IP 查询服务【GET】/Ipdata_api/Ipdata_api.m:27"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:Ipinfo_api::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供详细的 IP 信息【GET】/Ipinfo_api/Ipinfo_api.m:13"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:Ipinfo_api::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供详细的 IP 信息【GET】/Ipinfo_api/Ipinfo_api.m:27"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:Ipify_api::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/简单可靠，只返回设备的公网 IP 地址【GET】/Ipify_api/Ipify_api.m:13"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:Ipify_api::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/简单可靠，只返回设备的公网 IP 地址【GET】/Ipify_api/Ipify_api.m:27"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:This::BaseUrl<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:24"]
  T9["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S9 -->|calls| T9
  S10["method:This::jobsBaseUrl<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:28"]
  T10["function:NetworkingEnvir<br/>JobsByPods/JobsOCDefs@Pods/Core/JobsDefines/JobsDefineURLs/JobsDefineURLs.h:33"]
  S10 -->|calls| T10
  S11["method:This::BaseUrl_Image<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:66"]
  T11["function:NetworkingEnvir<br/>JobsByPods/JobsOCDefs@Pods/Core/JobsDefines/JobsDefineURLs/JobsDefineURLs.h:33"]
  S11 -->|calls| T11
  S12["method:This::BaseUrl_H5<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:97"]
  T12["function:NetworkingEnvir<br/>JobsByPods/JobsOCDefs@Pods/Core/JobsDefines/JobsDefineURLs/JobsDefineURLs.h:33"]
  S12 -->|calls| T12
  S13["method:This::jobs_appInterfaceTesting<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:128"]
  T13["method:URLManagerModel::byFuncName<br/>JobsByPods/JobsModelDSL@Pods/Core/URLManagerModel/URLManagerModel+DSL/URLManagerModel+DSL.m:20"]
  S13 -->|calls| T13
  S14["method:This::jobs_appInterfaceTesting<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:128"]
  T14["method:URLManagerModel::byUrl<br/>JobsByPods/JobsModelDSL@Pods/Core/URLManagerModel/URLManagerModel+DSL/URLManagerModel+DSL.m:11"]
  S14 -->|calls| T14
  S15["method:NSObject::get_presenter_getInfo_ByID<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:15"]
  T15["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSObject::get_presenter_getInfo2BymemberId<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:22"]
  T16["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSObject::post_presenter_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:29"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::put_presenter_update<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:42"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::get_agentPackage_getCheckExclusiveDomain<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:56"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::get_agentPackage_getPackageInfo<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:69"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::get_kyc_info<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:83"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::get_kyc_info_getByUid<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:96"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_kyc_submit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:109"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::get_kyc_verifyBymemberId<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:122"]
  T24["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:NSObject::post_personal_information_submit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@1/NSObject+URLMgr_1/NSObject+URLMgr_1.m:129"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
