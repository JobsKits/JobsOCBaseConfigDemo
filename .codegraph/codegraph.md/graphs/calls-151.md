# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:171"]
  T1["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S1 -->|calls| T1
  S2["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T2["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S2 -->|calls| T2
  S3["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T6["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S6 -->|calls| T6
  S7["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T7["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S7 -->|calls| T7
  S8["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T8["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S8 -->|calls| T8
  S9["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S9 -->|calls| T9
  S10["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T10["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S10 -->|calls| T10
  S11["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T11["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S11 -->|calls| T11
  S12["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T12["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S12 -->|calls| T12
  S13["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T13["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S13 -->|calls| T13
  S14["method:NSString::getAnonymousString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T14["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S14 -->|calls| T14
  S15["method:NSString::getAnonymousString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T15["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S15 -->|calls| T15
  S16["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:252"]
  T16["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  S16 -->|calls| T16
  S17["method:NSString::removeLastChars<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:259"]
  T17["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S17 -->|calls| T17
  S18["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  T18["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S18 -->|calls| T18
  S19["method:NSString::addNewlines<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:309"]
  T19["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S19 -->|calls| T19
  S20["method:NSString::cor<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T20["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S20 -->|calls| T20
  S21["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T21["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S21 -->|calls| T21
  S22["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T22["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S22 -->|calls| T22
  S23["method:NSString::substringByRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T23["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S23 -->|calls| T23
  S24["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T24["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S24 -->|calls| T24
  S25["method:NSString::range<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T25["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
