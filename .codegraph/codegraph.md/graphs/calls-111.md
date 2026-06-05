# `calls 符号关系 - 111`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T1["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S1 -->|calls| T1
  S2["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T2["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S2 -->|calls| T2
  S3["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  T4["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S4 -->|calls| T4
  S5["method:NSString::isExpired<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:65"]
  T5["function:JobsFormattedString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:63"]
  S5 -->|calls| T5
  S6["method:NSString::isExpired<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:65"]
  T6["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsTimeUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsTimeUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  T10["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T11["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S11 -->|calls| T11
  S12["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:NSDate::readableDayTime<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T13["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S13 -->|calls| T13
  S14["method:NSDate::readableTime<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T14["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S14 -->|calls| T14
  S15["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T15["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S15 -->|calls| T15
  S16["method:NSFormatter::date<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSFormatter::time<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSFormatter::time<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T18["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:NSString::add<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T19["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsUploadingProgressView::standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  T23["method:JobsPodspecKitForJobsViewNavigator::standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:266"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsViewNavigator::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:273"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
