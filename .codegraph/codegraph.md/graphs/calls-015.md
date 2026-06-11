# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["method:CasinoCustomerContactElementModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/CasinoCustomerContactModel/CasinoCustomerContactModel.m:12"]
  T3["method:CasinoCustomerContactElementModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/CasinoCustomerContactModel/CasinoCustomerContactModel.m:12"]
  S3 -->|calls| T3
  S4["method:IncomeSourceModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/IncomeSourceModel/IncomeSourceModel.m:12"]
  T4["method:IncomeSourceModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/IncomeSourceModel/IncomeSourceModel.m:12"]
  S4 -->|calls| T4
  S5["method:PhilippinesIDTypeModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/PhilippinesIDTypeModel/PhilippinesIDTypeModel.m:12"]
  T5["method:PhilippinesIDTypeModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/PhilippinesIDTypeModel/PhilippinesIDTypeModel.m:12"]
  S5 -->|calls| T5
  S6["method:NSString::addPathComponent<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  T6["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsMonitorNetwoking::standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsMonitorNetwoking::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMonitorNetwoking@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T10["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T11["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S11 -->|calls| T11
  S12["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T12["method:NSString::substringToIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S12 -->|calls| T12
  S13["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T13["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S13 -->|calls| T13
  S14["method:NSString::range<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T14["method:NSString::rangeOfString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S14 -->|calls| T14
  S15["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T15["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S15 -->|calls| T15
  S16["method:NSString::jobsUrl<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:NSString::URLRequest<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T17["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSString::jobsFileUrl<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T18["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T19["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T20["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T21["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T22["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T23["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T24["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S24 -->|calls| T24
  S25["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T25["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
