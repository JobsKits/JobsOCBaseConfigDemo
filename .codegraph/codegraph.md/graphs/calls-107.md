# `calls 符号关系 - 107`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isCntrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:124"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isGraph<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::isPrint<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::isLower<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T4["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S4 -->|calls| T4
  S5["method:NSString::isUpper<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T5["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S5 -->|calls| T5
  S6["method:NSString::isXdigit<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T6["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S6 -->|calls| T6
  S7["method:NSString::isPunct<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T7["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S7 -->|calls| T7
  S8["method:NSString::isContainsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T8["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S8 -->|calls| T8
  S9["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:43"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:57"]
  T10["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S10 -->|calls| T10
  S11["method:NSString::compress<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:93"]
  T11["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:NSString::compressString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:97"]
  T12["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:NSString::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:109"]
  T13["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S13 -->|calls| T13
  S14["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:152"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSString::emojiEncode<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:13"]
  T15["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S15 -->|calls| T15
  S16["method:NSString::emojiEncode<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:13"]
  T16["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S16 -->|calls| T16
  S17["method:NSString::add<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T17["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S17 -->|calls| T17
  S18["method:NSString::isContainsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T18["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S18 -->|calls| T18
  S19["method:NSString::isContainsSpecialSymbolsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+FilteringSpecialCharacters/NSString+FilteringSpecialCharacters.m:38"]
  T19["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S19 -->|calls| T19
  S20["method:NSString::addPathComponent<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T20["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S20 -->|calls| T20
  S21["method:NSString::add<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T21["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S21 -->|calls| T21
  S22["method:NSString::addByAttributedString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T22["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:NSString::subStringTo<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T23["method:NSString::substringWithRange<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S23 -->|calls| T23
  S24["method:NSString::replace<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T25["method:NSString::substringToIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
