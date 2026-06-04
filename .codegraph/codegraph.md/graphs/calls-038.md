# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isPunct<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isContainsUrl<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T2["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S2 -->|calls| T2
  S3["method:NSString::isEqualToString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:NSString::isEqualToString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T4["method:NSString::isEqualToString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  S4 -->|calls| T4
  S5["method:NSString::isContainsUrl<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:36"]
  T5["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S5 -->|calls| T5
  S6["method:NSString::jobsUrl<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:64"]
  T6["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S6 -->|calls| T6
  S7["method:NSString::add<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:81"]
  T7["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S7 -->|calls| T7
  S8["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:119"]
  T8["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S8 -->|calls| T8
  S9["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:119"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S9 -->|calls| T9
  S10["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:119"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:119"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:119"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:119"]
  T13["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S13 -->|calls| T13
  S14["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:119"]
  T14["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S14 -->|calls| T14
  S15["method:NSString::add<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T15["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S15 -->|calls| T15
  S16["method:NSString::addByAttributedString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T16["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S16 -->|calls| T16
  S17["method:NSString::subStringTo<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T17["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S17 -->|calls| T17
  S18["method:NSString::replace<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T19["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S19 -->|calls| T19
  S20["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T20["method:NSString::substringFromIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S20 -->|calls| T20
  S21["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T21["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S21 -->|calls| T21
  S22["method:NSString::dealWithString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:124"]
  T22["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S22 -->|calls| T22
  S23["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:171"]
  T23["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S23 -->|calls| T23
  S24["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
