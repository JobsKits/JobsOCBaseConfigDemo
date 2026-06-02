# `calls 符号关系 - 131`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isContainsUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T1["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S1 -->|calls| T1
  S2["method:NSString::addPathComponent<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T2["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S2 -->|calls| T2
  S3["method:NSString::add<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T3["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S3 -->|calls| T3
  S4["method:NSString::addByAttributedString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T4["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S4 -->|calls| T4
  S5["method:NSString::subStringTo<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T5["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S5 -->|calls| T5
  S6["method:NSString::replace<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T6["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S6 -->|calls| T6
  S7["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T7["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S7 -->|calls| T7
  S8["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T8["method:NSString::substringFromIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S8 -->|calls| T8
  S9["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T9["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S9 -->|calls| T9
  S10["method:NSString::dealWithString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:124"]
  T10["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S10 -->|calls| T10
  S11["method:NSString::resetStringByFontAndTailStrings<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:139"]
  T11["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:171"]
  T12["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S12 -->|calls| T12
  S13["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S13 -->|calls| T13
  S14["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T14["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S14 -->|calls| T14
  S15["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T17["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S17 -->|calls| T17
  S18["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T18["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S18 -->|calls| T18
  S19["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T19["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S19 -->|calls| T19
  S20["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T21["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S21 -->|calls| T21
  S22["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T22["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S22 -->|calls| T22
  S23["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T23["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S23 -->|calls| T23
  S24["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T24["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S24 -->|calls| T24
  S25["method:NSString::getAnonymousString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
