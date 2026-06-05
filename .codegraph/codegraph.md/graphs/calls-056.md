# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S4 -->|calls| T4
  S5["method:NSObject::makeNormaleWebViewByViewModel<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSObject/NSObject+HTML/NSObject+HTML.m:73"]
  T5["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T6["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S6 -->|calls| T6
  S7["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S7 -->|calls| T7
  S8["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T8["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S8 -->|calls| T8
  S9["method:NSString::isEqualToString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSString::isEqualToString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T10["method:NSString::isEqualToString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S10 -->|calls| T10
  S11["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T12["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S12 -->|calls| T12
  S13["method:NSString::hasPrefix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSString::hasPrefix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T14["method:NSString::hasPrefix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S14 -->|calls| T14
  S15["method:NSString::hasSuffix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSString::hasSuffix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T16["method:NSString::hasSuffix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S16 -->|calls| T16
  S17["method:NSString::isNotBlank<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T17["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S17 -->|calls| T17
  S18["method:NSString::isSpace<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T18["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S18 -->|calls| T18
  S19["method:NSString::isContainBlank<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T19["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S19 -->|calls| T19
  S20["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T20["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S20 -->|calls| T20
  S21["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T21["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S21 -->|calls| T21
  S22["method:NSString::isAlnum<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:116"]
  T22["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S22 -->|calls| T22
  S23["method:NSString::isCntrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:124"]
  T23["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S23 -->|calls| T23
  S24["method:NSString::isGraph<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T24["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S24 -->|calls| T24
  S25["method:NSString::isPrint<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
