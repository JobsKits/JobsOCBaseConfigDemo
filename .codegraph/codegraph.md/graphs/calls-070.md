# `calls 符号关系 - 070`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::sys_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:NSObject::sys_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S2 -->|calls| T2
  S3["method:NSObject::sys_img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T6["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S6 -->|calls| T6
  S7["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T7["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S7 -->|calls| T7
  S8["method:NSObject::img<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:NSObject::fetchImageByPlaceholder:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:71"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSObject::imageByDataURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+image/NSObject+image.m:109"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T11["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S11 -->|calls| T11
  S12["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T13["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S13 -->|calls| T13
  S14["method:NSString::isEqualToString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSString::isEqualToString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T15["method:NSString::isEqualToString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S15 -->|calls| T15
  S16["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T17["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S17 -->|calls| T17
  S18["method:NSString::hasPrefix<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSString::hasPrefix<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T19["method:NSString::hasPrefix<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S19 -->|calls| T19
  S20["method:NSString::hasSuffix<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSString::hasSuffix<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T21["method:NSString::hasSuffix<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S21 -->|calls| T21
  S22["method:NSString::isNotBlank<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T22["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S22 -->|calls| T22
  S23["method:NSString::isSpace<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T23["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S23 -->|calls| T23
  S24["method:NSString::isContainBlank<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T24["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S24 -->|calls| T24
  S25["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
