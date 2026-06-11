# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T1["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S1 -->|calls| T1
  S2["method:NSString::range<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T2["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S2 -->|calls| T2
  S3["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::jobsUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T4["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S4 -->|calls| T4
  S5["method:NSString::URLRequest<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T5["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSString::jobsFileUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T6["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIColor::jobsCor<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:53"]
  T8["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S8 -->|calls| T8
  S9["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T9["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T10["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T11["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T12["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T13["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIView::currentController<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsLoadingImage::standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsLoadingImage::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForJobsLocker::standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsLocker::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  T21["method:JobsPodspecKitForJobsMakes::standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:266"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsMakes::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:273"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  S23 -->|calls| T23
  S24["method:UIColor::jobsCor<br/>JobsByPods/JobsMakes@Pods/Support/UIKit/UIColor/UIColor+Extra.m:12"]
  T24["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:277"]
  T25["method:JobsPodspecKitForJobsMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
