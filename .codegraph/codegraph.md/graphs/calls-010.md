# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForJobsHotLabel::standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsHotLabel::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsImageNumberView::standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsImageNumberView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsLanMgr::standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsLanMgr::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T10["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S10 -->|calls| T10
  S11["method:NSString::add<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T11["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsLinkageMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T15["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSString::substringFromIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T16["method:NSString::substringFromIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S16 -->|calls| T16
  S17["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T17["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S17 -->|calls| T17
  S18["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T18["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S18 -->|calls| T18
  S19["method:NSString::range<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T19["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S19 -->|calls| T19
  S20["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T20["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S20 -->|calls| T20
  S21["method:NSString::jobsUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["method:NSString::URLRequest<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T22["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSString::jobsFileUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T23["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIColor::jobsCor<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:53"]
  T25["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
