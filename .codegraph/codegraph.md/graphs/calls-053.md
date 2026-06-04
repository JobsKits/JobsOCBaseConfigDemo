# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T1["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S1 -->|calls| T1
  S2["function:swizzled_setObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:45"]
  T2["function:swizzled_setObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:45"]
  S2 -->|calls| T2
  S3["function:swizzled_removeAllObjects<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:69"]
  T3["function:swizzled_removeAllObjects<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:69"]
  S3 -->|calls| T3
  S4["function:objectAtIndex:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:80"]
  T4["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S4 -->|calls| T4
  S5["function:insertObject:forKey:atIndex:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:86"]
  T5["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S5 -->|calls| T5
  S6["function:replaceObjectAtIndex:withObject:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:115"]
  T6["function:insertObject:forKey:atIndex:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:86"]
  S6 -->|calls| T6
  S7["method:NSMutableSet::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  T7["method:NSMutableSet::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S8 -->|calls| T8
  S9["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T9["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S9 -->|calls| T9
  S10["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T10["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S10 -->|calls| T10
  S11["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T11["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S11 -->|calls| T11
  S12["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T12["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T13["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T14["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T15["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T16["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T17["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T18["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T19["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S21 -->|calls| T21
  S22["method:NSObject::makeNormaleWebViewByViewModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+HTML/NSObject+HTML.m:73"]
  T22["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSObject::jobsPushToSysConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:58"]
  T23["method:NSObject::jobsOpenURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:63"]
  S23 -->|calls| T23
  S24["method:NSObject::jobsOpenURL:successCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:74"]
  T24["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  S24 -->|calls| T24
  S25["method:NSObject::jobsOpenURL:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:84"]
  T25["method:NSObject::jobsOpenURL:options:successCompletionHandlerBlock:failCompletionHandlerBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:108"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
