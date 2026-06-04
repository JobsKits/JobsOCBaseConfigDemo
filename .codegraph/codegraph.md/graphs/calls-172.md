# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  T1["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S1 -->|calls| T1
  S2["method:NSObject::dateConversionTimeStamp:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:147"]
  T2["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S2 -->|calls| T2
  S3["method:NSObject::dateConversionTimeStamp:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:147"]
  T3["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S3 -->|calls| T3
  S4["method:NSObject::timeIntervalByInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:158"]
  T4["method:NSObject::dateConversionTimeStamp:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:147"]
  S4 -->|calls| T4
  S5["method:NSObject::timeIntervalByInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:158"]
  T5["method:NSObject::dateByTimeInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:186"]
  S5 -->|calls| T5
  S6["method:NSObject::timeIntervalByDateStr:timeFormatter:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:175"]
  T6["method:NSObject::strByDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:195"]
  S6 -->|calls| T6
  S7["method:NSObject::timeIntervalByDateStr:timeFormatter:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:175"]
  T7["method:NSObject::strByDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:195"]
  S7 -->|calls| T7
  S8["method:NSObject::dateByTimeInterval<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:186"]
  T8["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S8 -->|calls| T8
  S9["method:NSObject::strByDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:195"]
  T9["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S9 -->|calls| T9
  S10["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T10["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S10 -->|calls| T10
  S11["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T11["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S11 -->|calls| T11
  S12["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T12["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S12 -->|calls| T12
  S13["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T13["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S13 -->|calls| T13
  S14["method:NSObject::intervalDifferenceBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:241"]
  T14["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S14 -->|calls| T14
  S15["method:NSObject::intervalDifferenceBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:241"]
  T15["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S15 -->|calls| T15
  S16["method:NSObject::dateComponentsDiffBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:251"]
  T16["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S16 -->|calls| T16
  S17["method:NSObject::dateComponentsDiffBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:251"]
  T17["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S17 -->|calls| T17
  S18["method:NSObject::dateComponentsDiffBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:251"]
  T18["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S18 -->|calls| T18
  S19["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T19["method:NSCalendar::initByCalendarIdentifier<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSCalendar/NSCalendar+Extra/NSCalendar+Extra.m:26"]
  S19 -->|calls| T19
  S20["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T20["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S20 -->|calls| T20
  S21["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T21["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S21 -->|calls| T21
  S22["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T22["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S22 -->|calls| T22
  S23["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T23["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S23 -->|calls| T23
  S24["method:NSObject::toReadableTimeBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:334"]
  T24["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S24 -->|calls| T24
  S25["method:NSObject::HHMMSS<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:355"]
  T25["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
