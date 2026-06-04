# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::HHMMSS<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:355"]
  T1["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S1 -->|calls| T1
  S2["method:NSObject::HHMMSS<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:355"]
  T2["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S2 -->|calls| T2
  S3["method:NSObject::getToday<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:365"]
  T3["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S3 -->|calls| T3
  S4["method:NSObject::getToday<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:365"]
  T4["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSObject::currentTime<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:439"]
  T5["method:NSTimeZone::GMTDateSecs<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTimeZone/NSTimeZone+Extra/NSTimeZone+Extra.m:30"]
  S5 -->|calls| T5
  S6["method:NSObject::currentTime<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:439"]
  T6["method:NSDate::byAddingTimeInterval<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:30"]
  S6 -->|calls| T6
  S7["method:NSObject::timeFormatterWithDate:timeFormatStr:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:452"]
  T7["method:NSObject::dateFormatterBy<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:135"]
  S7 -->|calls| T7
  S8["method:NSObject::getHHMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:464"]
  T8["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S8 -->|calls| T8
  S9["method:NSObject::getHHMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:464"]
  T9["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S9 -->|calls| T9
  S10["method:NSObject::getHHMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:464"]
  T10["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S10 -->|calls| T10
  S11["method:NSObject::getMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:484"]
  T11["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S11 -->|calls| T11
  S12["method:NSObject::getMMSSFromStr:formatTime:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:484"]
  T12["function:toStringByFloatDecimalPlaces<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:55"]
  S12 -->|calls| T12
  S13["method:NSObject::_zeroTime<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:503"]
  T13["method:NSCalendar::dateByComponents<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSCalendar/NSCalendar+Extra/NSCalendar+Extra.m:18"]
  S13 -->|calls| T13
  S14["method:NSString::chinaTime<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:15"]
  T14["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  S14 -->|calls| T14
  S15["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:25"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:25"]
  T16["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S16 -->|calls| T16
  S17["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T17["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S17 -->|calls| T17
  S18["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T18["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S18 -->|calls| T18
  S19["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T20["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S20 -->|calls| T20
  S21["method:NSString::isExpired<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:65"]
  T21["function:JobsFormattedString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:63"]
  S21 -->|calls| T21
  S22["method:NSString::isExpired<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:65"]
  T22["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  T23["method:JobsPodspecKitForJobsTimeUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:266"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsTimeUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:273"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
