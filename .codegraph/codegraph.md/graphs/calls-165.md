# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T4["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S4 -->|calls| T4
  S5["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T5["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S5 -->|calls| T5
  S6["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T6["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S6 -->|calls| T6
  S7["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T7["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S7 -->|calls| T7
  S8["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T8["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S8 -->|calls| T8
  S9["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T9["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S9 -->|calls| T9
  S10["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T10["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S10 -->|calls| T10
  S11["method:NSString::getAnonymousString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::getAnonymousString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T12["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S12 -->|calls| T12
  S13["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:252"]
  T13["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  S13 -->|calls| T13
  S14["method:NSString::removeLastChars<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:259"]
  T14["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S14 -->|calls| T14
  S15["method:NSString::normalURLPlus<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:263"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S15 -->|calls| T15
  S16["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T16["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S16 -->|calls| T16
  S17["method:NSString::addNewlines<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:316"]
  T17["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S17 -->|calls| T17
  S18["method:NSString::cor<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T18["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S18 -->|calls| T18
  S19["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T19["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S19 -->|calls| T19
  S20["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T20["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S20 -->|calls| T20
  S21["method:NSString::substringByRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T21["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S21 -->|calls| T21
  S22["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T22["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S22 -->|calls| T22
  S23["method:NSString::range<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T23["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S23 -->|calls| T23
  S24["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T24["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S24 -->|calls| T24
  S25["method:NSString::jobsUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
