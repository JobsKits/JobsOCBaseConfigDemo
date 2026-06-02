# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::compressString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:97"]
  T1["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S1 -->|calls| T1
  S2["method:NSString::toString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:109"]
  T2["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S2 -->|calls| T2
  S3["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:152"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:NSString::isEqualToString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:NSString::isEqualToString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T5["method:NSString::isEqualToString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  S5 -->|calls| T5
  S6["method:NSString::isContainsUrl<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:36"]
  T6["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S6 -->|calls| T6
  S7["method:NSString::jobsUrl<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:64"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T8["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S8 -->|calls| T8
  S9["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S9 -->|calls| T9
  S10["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T13["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S13 -->|calls| T13
  S14["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T14["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S14 -->|calls| T14
  S15["method:NSString::add<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:117"]
  T15["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S15 -->|calls| T15
  S16["method:NSString::addPathComponent<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T16["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S16 -->|calls| T16
  S17["method:NSString::add<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T17["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S17 -->|calls| T17
  S18["method:NSString::addByAttributedString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T18["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S18 -->|calls| T18
  S19["method:NSString::subStringTo<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T19["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S19 -->|calls| T19
  S20["method:NSString::replace<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T21["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S21 -->|calls| T21
  S22["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T22["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S22 -->|calls| T22
  S23["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T23["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S23 -->|calls| T23
  S24["method:NSString::dealWithString:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:124"]
  T24["method:NSString::substringWithRange<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S24 -->|calls| T24
  S25["method:NSString::resetStringByFontAndTailStrings<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:139"]
  T25["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
