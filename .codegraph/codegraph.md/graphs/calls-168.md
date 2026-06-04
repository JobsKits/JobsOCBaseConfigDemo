# `calls 符号关系 - 168`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::hasSuffix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T1["method:NSString::hasSuffix<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S1 -->|calls| T1
  S2["method:NSString::isNotBlank<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::isSpace<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::isContainBlank<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T4["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S4 -->|calls| T4
  S5["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T5["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S5 -->|calls| T5
  S6["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T6["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S6 -->|calls| T6
  S7["method:NSString::isAlnum<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:116"]
  T7["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S7 -->|calls| T7
  S8["method:NSString::isCntrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:124"]
  T8["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S8 -->|calls| T8
  S9["method:NSString::isGraph<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T9["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S9 -->|calls| T9
  S10["method:NSString::isPrint<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T10["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S10 -->|calls| T10
  S11["method:NSString::isLower<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::isUpper<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T12["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S12 -->|calls| T12
  S13["method:NSString::isXdigit<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T13["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S13 -->|calls| T13
  S14["method:NSString::isPunct<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T14["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S14 -->|calls| T14
  S15["method:NSString::isContainsUrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T15["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S15 -->|calls| T15
  S16["method:NSString::isContainsUrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:27"]
  T16["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S16 -->|calls| T16
  S17["method:NSString::add<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:32"]
  T17["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S17 -->|calls| T17
  S18["method:NSString::isEqualToString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSString::isEqualToString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  T19["method:NSString::isEqualToString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  S19 -->|calls| T19
  S20["method:NSString::add<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T20["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S20 -->|calls| T20
  S21["method:NSString::addByAttributedString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T21["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S21 -->|calls| T21
  S22["method:NSString::subStringTo<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T22["method:NSString::substringWithRange<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S22 -->|calls| T22
  S23["method:NSString::replace<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T24["method:NSString::substringToIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S24 -->|calls| T24
  S25["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T25["method:NSString::substringFromIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
