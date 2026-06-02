# `calls 符号关系 - 072`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T1["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S1 -->|calls| T1
  S2["method:NSString::lenthByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:149"]
  T2["function:UIFontSystemFontOfSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:14"]
  S2 -->|calls| T2
  S3["method:NSString::textLength<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:164"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::cor<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T4["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S4 -->|calls| T4
  S5["method:NSString::substringFromIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T5["method:NSString::substringFromIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S5 -->|calls| T5
  S6["method:NSString::substringToIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T6["method:NSString::substringToIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S6 -->|calls| T6
  S7["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T7["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S7 -->|calls| T7
  S8["method:NSString::range<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T8["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S8 -->|calls| T8
  S9["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T9["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S9 -->|calls| T9
  S10["method:NSString::chinaTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:12"]
  T10["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  S10 -->|calls| T10
  S11["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T11["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S11 -->|calls| T11
  S12["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T12["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S12 -->|calls| T12
  S13["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T13["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S13 -->|calls| T13
  S14["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T14["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S14 -->|calls| T14
  S15["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T16["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S16 -->|calls| T16
  S17["method:NSString::isExpired<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T17["function:JobsFormattedString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:63"]
  S17 -->|calls| T17
  S18["method:NSString::isExpired<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T18["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S18 -->|calls| T18
  S19["method:NSString::toast<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T19["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S19 -->|calls| T19
  S20["method:NSString::jobsUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSString::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T21["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSString::jobsFileUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T22["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSString::urlProtect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T23["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S23 -->|calls| T23
  S24["method:NSString::makeWebViewByJS<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+WKWebView/NSString+WKWebView.m:41"]
  T24["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  S24 -->|calls| T24
  S25["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  T25["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
