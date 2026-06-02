# `calls 符号关系 - 144`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  T2["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  S2 -->|calls| T2
  S3["method:NSString::isContainsUrl<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:27"]
  T3["method:NSString::rangeOfString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:124"]
  S3 -->|calls| T3
  S4["method:NSString::add<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:32"]
  T4["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S4 -->|calls| T4
  S5["method:NSString::isEqualToString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:NSString::isEqualToString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  T6["method:NSString::isEqualToString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:42"]
  S6 -->|calls| T6
  S7["method:NSString::lenthByFont<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:66"]
  T7["function:UIFontSystemFontOfSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:14"]
  S7 -->|calls| T7
  S8["method:NSString::jobsUrl<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:85"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:NSString::chinaTime<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:94"]
  T9["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:108"]
  S9 -->|calls| T9
  S10["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:108"]
  T10["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S10 -->|calls| T10
  S11["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:108"]
  T11["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S11 -->|calls| T11
  S12["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:108"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:108"]
  T13["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S13 -->|calls| T13
  S14["method:NSString::rangeOfString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:124"]
  T14["method:NSString::rangeOfString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:124"]
  S14 -->|calls| T14
  S15["method:NSString::addPathComponent<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T15["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S15 -->|calls| T15
  S16["method:JobsMonitorNetwoking::init<br/>JobsByPods/JobsMonitorNetwoking@Pods/Core/JobsMonitorNetwoking.m:34"]
  T16["method:JobsMonitorNetwoking::init<br/>JobsByPods/JobsMonitorNetwoking@Pods/Core/JobsMonitorNetwoking.m:34"]
  S16 -->|calls| T16
  S17["method:JobsMonitorNetwoking::getInternetface<br/>JobsByPods/JobsMonitorNetwoking@Pods/Core/JobsMonitorNetwoking.m:41"]
  T17["method:JobsMonitorNetwoking::getInterfaceBytes<br/>JobsByPods/JobsMonitorNetwoking@Pods/Core/JobsMonitorNetwoking.m:59"]
  S17 -->|calls| T17
  S18["method:JobsMonitorNetwoking::getInternetface<br/>JobsByPods/JobsMonitorNetwoking@Pods/Core/JobsMonitorNetwoking.m:41"]
  T18["method:JobsMonitorNetwoking::getInterfaceBytes<br/>JobsByPods/JobsMonitorNetwoking@Pods/Core/JobsMonitorNetwoking.m:59"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsMonitorNetwoking::standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:JobsNavBar::init<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:42"]
  T22["method:JobsNavBar::init<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:42"]
  S22 -->|calls| T22
  S23["method:JobsNavBar::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:60"]
  T23["method:JobsNavBar::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:60"]
  S23 -->|calls| T23
  S24["method:JobsNavBar::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:60"]
  T24["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S24 -->|calls| T24
  S25["method:JobsNavBar::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:60"]
  T25["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
