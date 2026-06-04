# `calls 符号关系 - 163`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::timeIntervalstartDate:endDate:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:204"]
  T1["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S1 -->|calls| T1
  S2["method:NSObject::intervalDifferenceBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:241"]
  T2["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S2 -->|calls| T2
  S3["method:NSObject::intervalDifferenceBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:241"]
  T3["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S3 -->|calls| T3
  S4["method:NSObject::dateComponentsDiffBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:251"]
  T4["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S4 -->|calls| T4
  S5["method:NSObject::dateComponentsDiffBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:251"]
  T5["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S5 -->|calls| T5
  S6["method:NSObject::dateComponentsDiffBetweenStarTime:toEndTime:byDateFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:251"]
  T6["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  S6 -->|calls| T6
  S7["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T7["method:NSCalendar::initByCalendarIdentifier<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSCalendar/NSCalendar+Extra/NSCalendar+Extra.m:26"]
  S7 -->|calls| T7
  S8["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T8["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S8 -->|calls| T8
  S9["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T9["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S9 -->|calls| T9
  S10["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T10["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S10 -->|calls| T10
  S11["method:NSObject::dateStringAfterlocalDateForYear:month:day:hour:minute:second:timeFormatter:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:290"]
  T11["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S11 -->|calls| T11
  S12["method:NSObject::toReadableTimeBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:334"]
  T12["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S12 -->|calls| T12
  S13["method:NSObject::HHMMSS<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:355"]
  T13["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S13 -->|calls| T13
  S14["method:NSObject::HHMMSS<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:355"]
  T14["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S14 -->|calls| T14
  S15["method:NSObject::HHMMSS<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:355"]
  T15["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S15 -->|calls| T15
  S16["method:NSObject::getToday<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:365"]
  T16["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S16 -->|calls| T16
  S17["method:NSObject::getToday<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:365"]
  T17["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSObject::currentTime<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:439"]
  T18["method:NSTimeZone::GMTDateSecs<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTimeZone/NSTimeZone+Extra/NSTimeZone+Extra.m:30"]
  S18 -->|calls| T18
  S19["method:NSObject::currentTime<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:439"]
  T19["method:NSDate::byAddingTimeInterval<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:30"]
  S19 -->|calls| T19
  S20["method:NSObject::timeFormatterWithDate:timeFormatStr:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:452"]
  T20["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S20 -->|calls| T20
  S21["method:NSObject::getHHMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:464"]
  T21["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S21 -->|calls| T21
  S22["method:NSObject::getHHMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:464"]
  T22["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S22 -->|calls| T22
  S23["method:NSObject::getHHMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:464"]
  T23["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S23 -->|calls| T23
  S24["method:NSObject::getMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:484"]
  T24["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S24 -->|calls| T24
  S25["method:NSObject::getMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:484"]
  T25["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
