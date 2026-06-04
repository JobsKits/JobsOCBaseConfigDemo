# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T1["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S1 -->|calls| T1
  S2["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S2 -->|calls| T2
  S3["method:NSObject::imageByDataURL<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:89"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:NSObject::cor<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:105"]
  T4["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S4 -->|calls| T4
  S5["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:109"]
  T5["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S5 -->|calls| T5
  S6["method:NSObject::initByContentsOfFile<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:136"]
  T6["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S6 -->|calls| T6
  S7["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T7["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S7 -->|calls| T7
  S8["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSObject::getDeviceOrientation<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:239"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSObject::makeNav0ByTitle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:260"]
  T12["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S12 -->|calls| T12
  S13["method:NSObject::makeNav0ByTitle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:260"]
  T13["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  S13 -->|calls| T13
  S14["method:NSObject::makeNav0ByTitle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:260"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T17["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S17 -->|calls| T17
  S18["method:NSString::isEqualToString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSString::isEqualToString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T19["method:NSString::isEqualToString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S19 -->|calls| T19
  S20["method:NSString::containsString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSString::containsString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T21["method:NSString::containsString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S21 -->|calls| T21
  S22["method:NSString::hasPrefix<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSString::hasPrefix<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T23["method:NSString::hasPrefix<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S23 -->|calls| T23
  S24["method:NSString::hasSuffix<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:NSString::hasSuffix<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T25["method:NSString::hasSuffix<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
