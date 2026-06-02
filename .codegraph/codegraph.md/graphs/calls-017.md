# `calls 符号关系 - 017`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::replace<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T2["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S2 -->|calls| T2
  S3["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T3["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S3 -->|calls| T3
  S4["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T4["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S4 -->|calls| T4
  S5["method:NSString::dealWithString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:124"]
  T5["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S5 -->|calls| T5
  S6["method:NSString::resetStringByFontAndTailStrings<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:139"]
  T6["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:171"]
  T7["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S7 -->|calls| T7
  S8["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T8["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S8 -->|calls| T8
  S9["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S9 -->|calls| T9
  S10["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T13["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S13 -->|calls| T13
  S14["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T14["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S14 -->|calls| T14
  S15["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T16["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S16 -->|calls| T16
  S17["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T17["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S17 -->|calls| T17
  S18["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T18["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S18 -->|calls| T18
  S19["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T19["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S19 -->|calls| T19
  S20["method:NSString::getAnonymousString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T20["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S20 -->|calls| T20
  S21["method:NSString::getAnonymousString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T21["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S21 -->|calls| T21
  S22["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:252"]
  T22["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  S22 -->|calls| T22
  S23["method:NSString::removeLastChars<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:259"]
  T23["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S23 -->|calls| T23
  S24["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  T24["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S24 -->|calls| T24
  S25["method:NSString::addNewlines<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:309"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
