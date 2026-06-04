# `calls 符号关系 - 162`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::panGR<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:25"]
  T1["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S1 -->|calls| T1
  S2["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  T2["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S2 -->|calls| T2
  S3["method:NSObject::currentTimeStringByStyle1<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:28"]
  T3["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S3 -->|calls| T3
  S4["method:NSObject::currentTimeStringByStyle2<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:32"]
  T4["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S4 -->|calls| T4
  S5["method:NSObject::currentTimeStringByStyle3<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:36"]
  T5["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S5 -->|calls| T5
  S6["method:NSObject::currentTimeStringByStyle4<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:40"]
  T6["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S6 -->|calls| T6
  S7["method:NSObject::currentTimeStringByStyle5<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:44"]
  T7["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S7 -->|calls| T7
  S8["method:NSObject::currentTimeStringByStyle6<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:48"]
  T8["method:NSObject::currentTimeStringBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:22"]
  S8 -->|calls| T8
  S9["method:NSObject::currentTimestampString<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:82"]
  T9["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S9 -->|calls| T9
  S10["method:NSObject::timeAgo:dateFormat:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:90"]
  T10["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S10 -->|calls| T10
  S11["method:NSObject::daysAgoBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:97"]
  T11["method:NSObject::timeAgo:dateFormat:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:90"]
  S11 -->|calls| T11
  S12["method:NSObject::readableTimeByStyle1<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:116"]
  T12["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S12 -->|calls| T12
  S13["method:NSObject::readableTimeByStyle1<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:116"]
  T13["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S13 -->|calls| T13
  S14["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  T14["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S14 -->|calls| T14
  S15["method:NSObject::dateConversionTimeStamp:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:147"]
  T15["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S15 -->|calls| T15
  S16["method:NSObject::dateConversionTimeStamp:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:147"]
  T16["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S16 -->|calls| T16
  S17["method:NSObject::timeIntervalByInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:158"]
  T17["method:NSObject::dateConversionTimeStamp:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:147"]
  S17 -->|calls| T17
  S18["method:NSObject::timeIntervalByInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:158"]
  T18["method:NSObject::dateByTimeInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:186"]
  S18 -->|calls| T18
  S19["method:NSObject::timeIntervalByDateStr:timeFormatter:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:175"]
  T19["method:NSObject::strByDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:195"]
  S19 -->|calls| T19
  S20["method:NSObject::timeIntervalByDateStr:timeFormatter:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:175"]
  T20["method:NSObject::strByDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:195"]
  S20 -->|calls| T20
  S21["method:NSObject::dateByTimeInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:186"]
  T21["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S21 -->|calls| T21
  S22["method:NSObject::strByDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:195"]
  T22["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S22 -->|calls| T22
  S23["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T23["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S23 -->|calls| T23
  S24["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T24["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S24 -->|calls| T24
  S25["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T25["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
