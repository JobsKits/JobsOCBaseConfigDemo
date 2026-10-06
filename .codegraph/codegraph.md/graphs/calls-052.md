# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UploadImageApi::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:38"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:UploadImageApi::jobsRequestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:43"]
  T2["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UploadImageApi::jobsRequestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:43"]
  T3["method:This::jobsBaseUrl<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:28"]
  S3 -->|calls| T3
  S4["method:UploadImageApi::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:52"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:UploadImageApi::jsonValidator<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:81"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["function:getLocalIPAddressBy<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:38"]
  T6["function:getIPAddresses<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:91"]
  S6 -->|calls| T6
  S7["function:getLocalIPAddressBy<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:38"]
  T7["function:isValidatIP<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:67"]
  S7 -->|calls| T7
  S8["function:getIpify<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:141"]
  T8["method:BaseRequest::byHeaderParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:37"]
  S8 -->|calls| T8
  S9["function:getIpify<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:141"]
  T9["method:BaseRequest::byBodyParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:48"]
  S9 -->|calls| T9
  S10["function:getIpify<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:141"]
  T10["method:BaseRequest::byURLParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:57"]
  S10 -->|calls| T10
  S11["function:getIpify<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:141"]
  T11["variable:successBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.h:142"]
  S11 -->|calls| T11
  S12["function:getIP<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:161"]
  T12["method:BaseRequest::byHeaderParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:37"]
  S12 -->|calls| T12
  S13["function:getIP<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:161"]
  T13["method:BaseRequest::byBodyParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:48"]
  S13 -->|calls| T13
  S14["function:getIP<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:161"]
  T14["method:BaseRequest::byURLParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:57"]
  S14 -->|calls| T14
  S15["function:getIP<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:161"]
  T15["variable:successBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.h:142"]
  S15 -->|calls| T15
  S16["function:getIPInfo<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:181"]
  T16["method:BaseRequest::byHeaderParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:37"]
  S16 -->|calls| T16
  S17["function:getIPInfo<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:181"]
  T17["method:BaseRequest::byBodyParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:48"]
  S17 -->|calls| T17
  S18["function:getIPInfo<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:181"]
  T18["method:BaseRequest::byURLParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:57"]
  S18 -->|calls| T18
  S19["function:getIPInfo<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:181"]
  T19["variable:successBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.h:142"]
  S19 -->|calls| T19
  S20["function:getIPDataByKey:successBlock:<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:201"]
  T20["method:BaseRequest::byHeaderParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:37"]
  S20 -->|calls| T20
  S21["function:getIPDataByKey:successBlock:<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:201"]
  T21["method:BaseRequest::byBodyParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:48"]
  S21 -->|calls| T21
  S22["function:getIPDataByKey:successBlock:<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:201"]
  T22["method:BaseRequest::byURLParameters<br/>JobsByPods/YTKNetworkExtra@Pods/Core/BaseRequest/BaseRequest.m:57"]
  S22 -->|calls| T22
  S23["function:getIPDataByKey:successBlock:<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:201"]
  T23["variable:successBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.h:142"]
  S23 -->|calls| T23
  S24["method:IP_api::requestUrl<br/>'JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供丰富的地理位置信息【GET】/IP_api/IP_api.m':13"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:IP_api::requestMethod<br/>'JobsByPods/JobsAPIs@Pods/Core/DeviceIP/提供丰富的地理位置信息【GET】/IP_api/IP_api.m':27"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
