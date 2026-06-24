# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::currentController<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForJobsLoadingImage::standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsLoadingImage::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForJobsLocker::standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsLocker::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsMakes::standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsMakes::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:UIColor::jobsCor<br/>JobsByPods/JobsMakes@Pods/Support/UIKit/UIColor/UIColor+Extra.m:12"]
  T11["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:CasinoCustomerContactElementModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/CasinoCustomerContactModel/CasinoCustomerContactModel.m:12"]
  T15["method:CasinoCustomerContactElementModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/CasinoCustomerContactModel/CasinoCustomerContactModel.m:12"]
  S15 -->|calls| T15
  S16["method:IncomeSourceModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/IncomeSourceModel/IncomeSourceModel.m:12"]
  T16["method:IncomeSourceModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/IncomeSourceModel/IncomeSourceModel.m:12"]
  S16 -->|calls| T16
  S17["method:PhilippinesIDTypeModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/PhilippinesIDTypeModel/PhilippinesIDTypeModel.m:12"]
  T17["method:PhilippinesIDTypeModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/PhilippinesIDTypeModel/PhilippinesIDTypeModel.m:12"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForJobsMonitorNetwoking::standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T21["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T22["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S22 -->|calls| T22
  S23["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T23["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S23 -->|calls| T23
  S24["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T24["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S24 -->|calls| T24
  S25["method:NSString::range<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T25["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
