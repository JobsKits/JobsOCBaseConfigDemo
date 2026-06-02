# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S4 -->|calls| T4
  S5["method:NSObject::byData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T5["function:KindOfDicCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:67"]
  S5 -->|calls| T5
  S6["method:NSObject::byData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T6["function:KindOfArrCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:59"]
  S6 -->|calls| T6
  S7["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T10["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S10 -->|calls| T10
  S11["method:NSObject::img<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T11["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S11 -->|calls| T11
  S12["method:NSObject::imageByDataURL<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:46"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:62"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:62"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:62"]
  T15["method:UIImpactFeedbackGenerator::initMediumStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:37"]
  S15 -->|calls| T15
  S16["method:NSObject::isSizeZero<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:36"]
  T16["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S16 -->|calls| T16
  S17["method:NSObject::isPointZero<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:42"]
  T17["function:JobsSafeWidth::jobsZeroPointValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:561"]
  S17 -->|calls| T17
  S18["method:NSObject::isRectZero<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:48"]
  T18["function:JobsSafeWidth::jobsEqualToZeroRect<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:573"]
  S18 -->|calls| T18
  S19["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T21["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S21 -->|calls| T21
  S22["method:NSString::isEqualToString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSString::isEqualToString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T23["method:NSString::isEqualToString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S23 -->|calls| T23
  S24["method:NSString::containsString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:NSString::containsString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T25["method:NSString::containsString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
