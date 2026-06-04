# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isSpace<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isContainBlank<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T2["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S2 -->|calls| T2
  S3["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T4["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S4 -->|calls| T4
  S5["method:NSString::isAlnum<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:116"]
  T5["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S5 -->|calls| T5
  S6["method:NSString::isCntrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:124"]
  T6["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S6 -->|calls| T6
  S7["method:NSString::isGraph<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T7["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S7 -->|calls| T7
  S8["method:NSString::isPrint<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T8["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S8 -->|calls| T8
  S9["method:NSString::isLower<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T9["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S9 -->|calls| T9
  S10["method:NSString::isUpper<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T10["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S10 -->|calls| T10
  S11["method:NSString::isXdigit<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::isPunct<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T12["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S12 -->|calls| T12
  S13["method:NSString::isContainsUrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T13["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S13 -->|calls| T13
  S14["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:43"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S14 -->|calls| T14
  S15["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:58"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::compress<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:104"]
  T16["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S16 -->|calls| T16
  S17["method:NSString::compressString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:108"]
  T17["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S17 -->|calls| T17
  S18["method:NSString::toString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:120"]
  T18["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S18 -->|calls| T18
  S19["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:163"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSString::add<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T20["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S20 -->|calls| T20
  S21["method:NSString::addByAttributedString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T21["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S21 -->|calls| T21
  S22["method:NSString::subStringTo<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T22["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S22 -->|calls| T22
  S23["method:NSString::replace<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:86"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:106"]
  T24["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S24 -->|calls| T24
  S25["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:106"]
  T25["method:NSString::substringFromIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
