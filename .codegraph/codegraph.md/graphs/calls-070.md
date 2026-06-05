# `calls 符号关系 - 070`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::containsString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T1["method:NSString::containsString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S1 -->|calls| T1
  S2["method:NSString::hasPrefix<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:NSString::hasPrefix<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T3["method:NSString::hasPrefix<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S3 -->|calls| T3
  S4["method:NSString::hasSuffix<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:NSString::hasSuffix<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T5["method:NSString::hasSuffix<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S5 -->|calls| T5
  S6["method:NSString::isNotBlank<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T6["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S6 -->|calls| T6
  S7["method:NSString::isSpace<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T7["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S7 -->|calls| T7
  S8["method:NSString::isContainBlank<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T8["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S8 -->|calls| T8
  S9["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T9["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S9 -->|calls| T9
  S10["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T10["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S10 -->|calls| T10
  S11["method:NSString::isAlnum<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:116"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::isCntrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:124"]
  T12["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S12 -->|calls| T12
  S13["method:NSString::isGraph<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T13["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S13 -->|calls| T13
  S14["method:NSString::isPrint<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T14["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S14 -->|calls| T14
  S15["method:NSString::isLower<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T15["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S15 -->|calls| T15
  S16["method:NSString::isUpper<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T16["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S16 -->|calls| T16
  S17["method:NSString::isXdigit<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T17["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S17 -->|calls| T17
  S18["method:NSString::isPunct<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T18["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S18 -->|calls| T18
  S19["method:NSString::isContainsUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T19["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S19 -->|calls| T19
  S20["method:NSString::add<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T20["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S20 -->|calls| T20
  S21["method:NSString::isContainsUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T21["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S21 -->|calls| T21
  S22["method:NSString::addPathComponent<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T22["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S22 -->|calls| T22
  S23["method:NSString::substringFromIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T23["method:NSString::substringFromIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S23 -->|calls| T23
  S24["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T24["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S24 -->|calls| T24
  S25["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T25["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
