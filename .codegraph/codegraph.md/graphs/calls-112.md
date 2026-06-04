# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T2["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S2 -->|calls| T2
  S3["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T4["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S8 -->|calls| T8
  S9["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T9["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S9 -->|calls| T9
  S10["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T10["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S10 -->|calls| T10
  S11["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T11["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S11 -->|calls| T11
  S12["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T12["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T13["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T14["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T15["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T16["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T17["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T18["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S18 -->|calls| T18
  S19["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T21["method:UIImpactFeedbackGenerator::initMediumStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:37"]
  S21 -->|calls| T21
  S22["method:NSObject::playSoundEffect<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:38"]
  T22["method:NSString::byFileFullName<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:52"]
  S22 -->|calls| T22
  S23["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
