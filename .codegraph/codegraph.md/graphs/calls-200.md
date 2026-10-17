# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableDictionary::add<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:11"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S1 -->|calls| T1
  S2["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:29"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S2 -->|calls| T2
  S3["method:NSMutableDictionary::jsonString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:38"]
  T3["method:NSString::initByUTF8Data<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T4["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T5["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:102"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T6["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:110"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T7["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T8["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S8 -->|calls| T8
  S9["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T9["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:86"]
  S9 -->|calls| T9
  S10["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T10["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:90"]
  S10 -->|calls| T10
  S11["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T11["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:118"]
  S11 -->|calls| T11
  S12["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T12["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:122"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T13["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:94"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T14["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:98"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T15["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:110"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T16["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:106"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T17["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:114"]
  S17 -->|calls| T17
  S18["file:JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h:1"]
  T18["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S18 -->|calls| T18
  S19["file:JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h:1"]
  T19["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S19 -->|calls| T19
  S20["method:NSObject::mainBundle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T20["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S20 -->|calls| T20
  S21["method:NSObject::currentLocale<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:22"]
  T21["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S21 -->|calls| T21
  S22["method:NSObject::currentDevice<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:32"]
  T22["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S22 -->|calls| T22
  S23["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:42"]
  T23["method:UIImpactFeedbackGenerator::initMediumStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:37"]
  S23 -->|calls| T23
  S24["method:NSObject::playSoundEffect<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:68"]
  T24["method:NSString::byFileFullName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:54"]
  S24 -->|calls| T24
  S25["method:NSObject::playSoundEffect<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:68"]
  T25["method:NSString::jobsPathForResourceWithFullName<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
