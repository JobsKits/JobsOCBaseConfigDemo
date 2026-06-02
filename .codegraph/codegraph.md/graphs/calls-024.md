# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isPunct<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isContainsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T2["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:136"]
  S2 -->|calls| T2
  S3["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:43"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:57"]
  T4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S4 -->|calls| T4
  S5["method:NSString::compress<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:93"]
  T5["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S5 -->|calls| T5
  S6["method:NSString::compressString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:97"]
  T6["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:NSString::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:109"]
  T7["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S7 -->|calls| T7
  S8["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:152"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:NSString::isEqualToString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:27"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSString::isEqualToString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:27"]
  T10["method:NSString::isEqualToString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:27"]
  S10 -->|calls| T10
  S11["method:NSString::isContainsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:37"]
  T11["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:136"]
  S11 -->|calls| T11
  S12["method:NSString::add<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  T12["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S12 -->|calls| T12
  S13["method:NSString::jobsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:75"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSString::cor<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:102"]
  T14["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S14 -->|calls| T14
  S15["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T20["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S20 -->|calls| T20
  S21["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:109"]
  T21["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S21 -->|calls| T21
  S22["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:136"]
  T22["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:136"]
  S22 -->|calls| T22
  S23["method:NSString::addPathComponent<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T23["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S23 -->|calls| T23
  S24["method:NSString::add<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T24["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S24 -->|calls| T24
  S25["method:NSString::addByAttributedString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T25["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
