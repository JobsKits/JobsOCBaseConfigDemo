# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::jobsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:75"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSString::cor<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:102"]
  T2["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S2 -->|calls| T2
  S3["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S4 -->|calls| T4
  S5["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S7 -->|calls| T7
  S8["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T8["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S8 -->|calls| T8
  S9["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T9["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S9 -->|calls| T9
  S10["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:136"]
  T10["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:136"]
  S10 -->|calls| T10
  S11["method:NSString::add<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T11["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S11 -->|calls| T11
  S12["method:NSString::addByAttributedString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T12["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:NSString::subStringTo<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T13["method:NSString::substringWithRange<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S13 -->|calls| T13
  S14["method:NSString::replace<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S14 -->|calls| T14
  S15["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T15["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S15 -->|calls| T15
  S16["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T16["method:NSString::substringFromIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S16 -->|calls| T16
  S17["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T17["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S17 -->|calls| T17
  S18["method:NSString::dealWithString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:124"]
  T18["method:NSString::substringWithRange<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S18 -->|calls| T18
  S19["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:171"]
  T19["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S19 -->|calls| T19
  S20["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S21 -->|calls| T21
  S22["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T25["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
