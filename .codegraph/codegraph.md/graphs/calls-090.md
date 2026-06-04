# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isXdigit<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isPunct<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::isContainsUrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T3["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S3 -->|calls| T3
  S4["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:43"]
  T4["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S4 -->|calls| T4
  S5["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:58"]
  T5["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S5 -->|calls| T5
  S6["method:NSString::compress<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:104"]
  T6["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:NSString::compressString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:108"]
  T7["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:NSString::toString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:120"]
  T8["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S8 -->|calls| T8
  S9["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:163"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSString::add<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T10["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S10 -->|calls| T10
  S11["method:NSString::addByAttributedString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T11["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:NSString::subStringTo<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T12["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S12 -->|calls| T12
  S13["method:NSString::replace<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:86"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:106"]
  T14["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S14 -->|calls| T14
  S15["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:106"]
  T15["method:NSString::substringFromIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S15 -->|calls| T15
  S16["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:106"]
  T16["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S16 -->|calls| T16
  S17["method:NSString::dealWithString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:123"]
  T17["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S17 -->|calls| T17
  S18["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:170"]
  T18["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S18 -->|calls| T18
  S19["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S23 -->|calls| T23
  S24["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T24["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S24 -->|calls| T24
  S25["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:178"]
  T25["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
