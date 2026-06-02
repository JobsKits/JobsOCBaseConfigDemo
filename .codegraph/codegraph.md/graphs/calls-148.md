# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S2 -->|calls| T2
  S3["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T4["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S4 -->|calls| T4
  S5["method:NSObject::img<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSObject::imageByDataURL<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:89"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:NSObject::cor<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:105"]
  T7["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S7 -->|calls| T7
  S8["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:109"]
  T8["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S8 -->|calls| T8
  S9["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:109"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:NSObject::initByContentsOfFile<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:136"]
  T10["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S10 -->|calls| T10
  S11["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T11["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S11 -->|calls| T11
  S12["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSObject::getDeviceOrientation<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:239"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSObject::makeNav0ByTitle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:260"]
  T16["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S16 -->|calls| T16
  S17["method:NSObject::makeNav0ByTitle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:260"]
  T17["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  S17 -->|calls| T17
  S18["method:NSObject::makeNav0ByTitle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:260"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:NSObject::makeNav0ByTitle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:260"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSObject::isSizeZero<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:36"]
  T20["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S20 -->|calls| T20
  S21["method:NSObject::isPointZero<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:42"]
  T21["function:JobsSafeWidth::jobsZeroPointValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:561"]
  S21 -->|calls| T21
  S22["method:NSObject::isRectZero<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:48"]
  T22["function:JobsSafeWidth::jobsEqualToZeroRect<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:573"]
  S22 -->|calls| T22
  S23["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S23 -->|calls| T23
  S24["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T25["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
