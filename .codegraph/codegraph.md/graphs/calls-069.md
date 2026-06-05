# `calls 符号关系 - 069`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S8 -->|calls| T8
  S9["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T9["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S9 -->|calls| T9
  S10["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T10["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S10 -->|calls| T10
  S11["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T14["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S14 -->|calls| T14
  S15["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S15 -->|calls| T15
  S16["method:NSObject::imageByDataURL<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:46"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:62"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:62"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:62"]
  T19["method:UIImpactFeedbackGenerator::initMediumStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:37"]
  S19 -->|calls| T19
  S20["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S21 -->|calls| T21
  S22["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T22["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S22 -->|calls| T22
  S23["method:NSString::isEqualToString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSString::isEqualToString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T24["method:NSString::isEqualToString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S24 -->|calls| T24
  S25["method:NSString::containsString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
