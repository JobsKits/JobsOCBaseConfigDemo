# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:139"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  T2["method:NSString::initByUTF8Data<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S2 -->|calls| T2
  S3["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S3 -->|calls| T3
  S4["method:NSMutableDictionary::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:11"]
  T4["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S4 -->|calls| T4
  S5["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:29"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S5 -->|calls| T5
  S6["method:NSMutableDictionary::jsonString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:38"]
  T6["method:NSString::initByUTF8Data<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T7["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T8["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:102"]
  S8 -->|calls| T8
  S9["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T9["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:110"]
  S9 -->|calls| T9
  S10["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T10["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S10 -->|calls| T10
  S11["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T11["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S11 -->|calls| T11
  S12["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T12["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:86"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T13["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:90"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T14["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:118"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T15["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:122"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T16["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:94"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T17["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:98"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T18["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:110"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T19["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:106"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T20["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:114"]
  S20 -->|calls| T20
  S21["method:NSObject::url:funcName:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:15"]
  T21["method:URLManagerModel::byFuncName<br/>JobsByPods/JobsModelDSL@Pods/Core/URLManagerModel/URLManagerModel+DSL/URLManagerModel+DSL.m:20"]
  S21 -->|calls| T21
  S22["method:NSObject::url:funcName:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:15"]
  T22["method:URLManagerModel::byUrl<br/>JobsByPods/JobsModelDSL@Pods/Core/URLManagerModel/URLManagerModel+DSL/URLManagerModel+DSL.m:11"]
  S22 -->|calls| T22
  S23["method:NSObject::initByContentsOfFile<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:22"]
  T23["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S23 -->|calls| T23
  S24["method:NSObject::tipsByApi<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:78"]
  T24["method:JobsBaseApi::byAnimatingText<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:122"]
  S24 -->|calls| T24
  S25["method:NSObject::tipsByApi<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:78"]
  T25["method:JobsBaseApi::byAnimatingView<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:131"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
