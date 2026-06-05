# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::sys_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSObject::sys_img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S2 -->|calls| T2
  S3["method:NSObject::img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:NSObject::img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T4["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S4 -->|calls| T4
  S5["method:NSObject::img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSObject::img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T6["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S6 -->|calls| T6
  S7["method:NSObject::img<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:NSObject::fetchImageByPlaceholder:completion:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:71"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:NSObject::imageByDataURL<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:109"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T10["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S10 -->|calls| T10
  S11["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T11["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S11 -->|calls| T11
  S12["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T12["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S12 -->|calls| T12
  S13["method:NSString::isEqualToString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSString::isEqualToString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T14["method:NSString::isEqualToString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S14 -->|calls| T14
  S15["method:NSString::containsString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSString::containsString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T16["method:NSString::containsString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S16 -->|calls| T16
  S17["method:NSString::hasPrefix<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSString::hasPrefix<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T18["method:NSString::hasPrefix<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S18 -->|calls| T18
  S19["method:NSString::hasSuffix<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSString::hasSuffix<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T20["method:NSString::hasSuffix<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S20 -->|calls| T20
  S21["method:NSString::isNotBlank<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T21["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S21 -->|calls| T21
  S22["method:NSString::isSpace<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T22["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S22 -->|calls| T22
  S23["method:NSString::isContainBlank<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T23["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S23 -->|calls| T23
  S24["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T24["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S24 -->|calls| T24
  S25["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T25["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
