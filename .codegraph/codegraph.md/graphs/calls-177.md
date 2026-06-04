# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:211"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:NSObject::getDeviceOrientation<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:239"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:NSString::isEqualStrA:strB:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::isEqualStrA:strB:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S4 -->|calls| T4
  S5["method:NSString::isEqualStrA:strB:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T5["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S5 -->|calls| T5
  S6["method:NSString::isEqualToString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:NSString::isEqualToString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T7["method:NSString::isEqualToString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S7 -->|calls| T7
  S8["method:NSString::containsString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:NSString::containsString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T9["method:NSString::containsString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S9 -->|calls| T9
  S10["method:NSString::hasPrefix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSString::hasPrefix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T11["method:NSString::hasPrefix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S11 -->|calls| T11
  S12["method:NSString::hasSuffix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSString::hasSuffix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T13["method:NSString::hasSuffix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S13 -->|calls| T13
  S14["method:NSString::isNotBlank<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T14["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S14 -->|calls| T14
  S15["method:NSString::isSpace<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T15["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S15 -->|calls| T15
  S16["method:NSString::isContainBlank<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T16["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S16 -->|calls| T16
  S17["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T17["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S17 -->|calls| T17
  S18["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T18["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S18 -->|calls| T18
  S19["method:NSString::isAlnum<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:116"]
  T19["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S19 -->|calls| T19
  S20["method:NSString::isCntrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:124"]
  T20["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S20 -->|calls| T20
  S21["method:NSString::isGraph<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T21["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S21 -->|calls| T21
  S22["method:NSString::isPrint<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T22["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S22 -->|calls| T22
  S23["method:NSString::isLower<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T23["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S23 -->|calls| T23
  S24["method:NSString::isUpper<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T24["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S24 -->|calls| T24
  S25["method:NSString::isXdigit<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
