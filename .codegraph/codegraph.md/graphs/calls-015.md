# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S8 -->|calls| T8
  S9["method:NSObject::byData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T9["function:KindOfDicCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:67"]
  S9 -->|calls| T9
  S10["method:NSObject::byData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T10["function:KindOfArrCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:59"]
  S10 -->|calls| T10
  S11["method:NSObject::initByContentsOfFile<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:22"]
  T11["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S11 -->|calls| T11
  S12["method:NSObject::tipsByApi<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:78"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSObject::tipsByApi<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:78"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["class:NSObject<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:13"]
  T14["method:NSURLSessionDataTask::print<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURLSessionDataTask/NSURLSessionDataTask+Extra/NSURLSessionDataTask+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T17["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S17 -->|calls| T17
  S18["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T19["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S19 -->|calls| T19
  S20["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T21["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S21 -->|calls| T21
  S22["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T23["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S23 -->|calls| T23
  S24["method:NSString::hasSuffix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:NSString::hasSuffix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T25["method:NSString::hasSuffix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
