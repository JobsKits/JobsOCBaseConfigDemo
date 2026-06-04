# `calls 符号关系 - 055`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T1["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S1 -->|calls| T1
  S2["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T2["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S2 -->|calls| T2
  S3["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T3["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S3 -->|calls| T3
  S4["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S4 -->|calls| T4
  S5["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  T5["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S5 -->|calls| T5
  S6["method:NSString::isExpired<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T6["function:JobsFormattedString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:63"]
  S6 -->|calls| T6
  S7["method:NSString::isExpired<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:62"]
  T7["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S7 -->|calls| T7
  S8["method:NSString::toast<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T8["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S8 -->|calls| T8
  S9["method:NSString::jobsUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:NSString::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T10["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::jobsFileUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T11["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSString::urlProtect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T12["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S12 -->|calls| T12
  S13["method:NSString::makeWebViewByJS<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+WKWebView/NSString+WKWebView.m:41"]
  T13["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  S13 -->|calls| T13
  S14["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  T14["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T15["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSURL::normalURLPlus<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:NSURL::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T17["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSUserDefaults::updateWithModel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:13"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSUserDefaults::readWithKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:43"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:NSUserDefaults::deleteWithKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Manager/NSUserDefaults+Manager.m:52"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  T21["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  S21 -->|calls| T21
  S22["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  T22["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  S22 -->|calls| T22
  S23["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  T23["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  S23 -->|calls| T23
  S24["method:UIButton::revolution<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:12"]
  T24["method:CABasicAnimation::animationByKeyPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CABasicAnimation/CABasicAnimation+Extra/CABasicAnimation+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIButton::startRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:29"]
  T25["method:UIButton::stopRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
