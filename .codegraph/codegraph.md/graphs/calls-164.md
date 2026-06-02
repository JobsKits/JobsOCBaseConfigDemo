# `calls 符号关系 - 164`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isLower<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isUpper<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::isXdigit<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::isPunct<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T4["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S4 -->|calls| T4
  S5["method:NSString::isContainsUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T5["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S5 -->|calls| T5
  S6["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:43"]
  T6["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S6 -->|calls| T6
  S7["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:57"]
  T7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S7 -->|calls| T7
  S8["method:NSString::compress<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:93"]
  T8["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:NSString::compressString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:97"]
  T9["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:18"]
  S9 -->|calls| T9
  S10["method:NSString::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:109"]
  T10["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S10 -->|calls| T10
  S11["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:152"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSString::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T12["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S12 -->|calls| T12
  S13["method:NSString::addPathComponent<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T13["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S13 -->|calls| T13
  S14["method:NSString::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:27"]
  T14["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S14 -->|calls| T14
  S15["method:NSString::addByAttributedString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  T15["method:NSMutableAttributedString::initByString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:18"]
  S15 -->|calls| T15
  S16["method:NSString::subStringTo<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:61"]
  T16["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S16 -->|calls| T16
  S17["method:NSString::replace<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:87"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T18["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S18 -->|calls| T18
  S19["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T19["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S19 -->|calls| T19
  S20["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:107"]
  T20["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S20 -->|calls| T20
  S21["method:NSString::dealWithString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:124"]
  T21["method:NSString::substringWithRange<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  S21 -->|calls| T21
  S22["method:NSString::resetStringByFontAndTailStrings<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:139"]
  T22["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:NSString::jobsCapitalCaseString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:171"]
  T23["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S23 -->|calls| T23
  S24["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
