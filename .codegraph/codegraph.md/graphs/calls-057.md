# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isLower<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isUpper<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::isXdigit<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::isPunct<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T4["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S4 -->|calls| T4
  S5["method:NSString::isContainsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T5["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S5 -->|calls| T5
  S6["method:NSString::emojiEncode<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:13"]
  T6["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S6 -->|calls| T6
  S7["method:NSString::add<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T7["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S7 -->|calls| T7
  S8["method:NSString::isContainsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T8["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S8 -->|calls| T8
  S9["method:NSString::isContainsSpecialSymbolsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+FilteringSpecialCharacters/NSString+FilteringSpecialCharacters.m:38"]
  T9["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S9 -->|calls| T9
  S10["method:NSString::substringFromIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T10["method:NSString::substringFromIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S10 -->|calls| T10
  S11["method:NSString::substringToIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T11["method:NSString::substringToIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S11 -->|calls| T11
  S12["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T12["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S12 -->|calls| T12
  S13["method:NSString::range<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T13["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S13 -->|calls| T13
  S14["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T14["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S14 -->|calls| T14
  S15["method:NSString::chinaTime<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:12"]
  T15["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  S15 -->|calls| T15
  S16["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T17["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S17 -->|calls| T17
  S18["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T18["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S18 -->|calls| T18
  S19["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T19["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S19 -->|calls| T19
  S20["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T21["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S21 -->|calls| T21
  S22["method:NSString::isExpired<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T22["function:JobsFormattedString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:63"]
  S22 -->|calls| T22
  S23["method:NSString::isExpired<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T23["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S23 -->|calls| T23
  S24["method:NSString::toast<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T24["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S24 -->|calls| T24
  S25["method:NSString::jobsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
