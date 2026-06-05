# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::chinaTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:12"]
  T2["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  S2 -->|calls| T2
  S3["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T4["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S4 -->|calls| T4
  S5["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T5["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S5 -->|calls| T5
  S6["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T6["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S6 -->|calls| T6
  S7["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S7 -->|calls| T7
  S8["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T8["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S8 -->|calls| T8
  S9["method:NSString::isExpired<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T9["function:JobsFormattedString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:63"]
  S9 -->|calls| T9
  S10["method:NSString::isExpired<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T10["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S10 -->|calls| T10
  S11["method:NSString::toast<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T11["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S11 -->|calls| T11
  S12["method:NSString::jobsUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSString::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T13["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSString::jobsFileUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T14["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSString::urlProtect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T15["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S15 -->|calls| T15
  S16["method:NSString::makeWebViewByJS<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+WKWebView/NSString+WKWebView.m:41"]
  T16["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  S16 -->|calls| T16
  S17["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  T17["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T18["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:NSURL::normalURLPlus<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:NSURL::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T20["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSUserDefaults::updateWithModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:13"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["method:NSUserDefaults::readWithKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:43"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:NSUserDefaults::deleteWithKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:52"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  T24["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  S24 -->|calls| T24
  S25["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  T25["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
