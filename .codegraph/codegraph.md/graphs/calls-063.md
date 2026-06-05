# `calls 符号关系 - 063`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::dealWithString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:123"]
  T1["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S1 -->|calls| T1
  S2["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:170"]
  T2["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S2 -->|calls| T2
  S3["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S4 -->|calls| T4
  S5["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S7 -->|calls| T7
  S8["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T8["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S8 -->|calls| T8
  S9["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T9["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S9 -->|calls| T9
  S10["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:201"]
  T10["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S10 -->|calls| T10
  S11["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:201"]
  T11["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S11 -->|calls| T11
  S12["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:201"]
  T12["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S12 -->|calls| T12
  S13["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:201"]
  T13["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S13 -->|calls| T13
  S14["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:201"]
  T14["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S14 -->|calls| T14
  S15["method:NSString::getAnonymousString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:236"]
  T15["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S15 -->|calls| T15
  S16["method:NSString::getAnonymousString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:236"]
  T16["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S16 -->|calls| T16
  S17["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:251"]
  T17["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:201"]
  S17 -->|calls| T17
  S18["method:NSString::removeLastChars<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:258"]
  T18["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S18 -->|calls| T18
  S19["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  T19["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S19 -->|calls| T19
  S20["method:NSString::addNewlines<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:312"]
  T20["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S20 -->|calls| T20
  S21["method:NSString::substringFromIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T21["method:NSString::substringFromIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S21 -->|calls| T21
  S22["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T22["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S22 -->|calls| T22
  S23["method:NSString::substringByRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T23["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S23 -->|calls| T23
  S24["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T24["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S24 -->|calls| T24
  S25["method:NSString::range<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T25["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
