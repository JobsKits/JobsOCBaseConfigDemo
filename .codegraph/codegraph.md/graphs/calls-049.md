# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:KindOfNumberCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:95"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S8 -->|calls| T8
  S9["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T9["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S9 -->|calls| T9
  S10["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T10["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S10 -->|calls| T10
  S11["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T11["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S11 -->|calls| T11
  S12["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T12["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T13["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T14["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T15["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S15 -->|calls| T15
  S16["method:NSObject::isSizeZero<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:36"]
  T16["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S16 -->|calls| T16
  S17["method:NSObject::isPointZero<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:42"]
  T17["function:JobsSafeWidth::jobsZeroPointValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:561"]
  S17 -->|calls| T17
  S18["method:NSObject::isRectZero<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:48"]
  T18["function:JobsSafeWidth::jobsEqualToZeroRect<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:573"]
  S18 -->|calls| T18
  S19["method:NSObject::gif_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSObject::gif_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T20["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  S20 -->|calls| T20
  S21["method:NSObject::gif_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["method:NSObject::sys_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSObject::sys_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:NSObject::sys_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:NSObject::img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
