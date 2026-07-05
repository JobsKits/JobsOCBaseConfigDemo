# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T1["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S1 -->|calls| T1
  S2["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T2["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S2 -->|calls| T2
  S3["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T3["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S3 -->|calls| T3
  S4["method:NSString::range<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T4["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S4 -->|calls| T4
  S5["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T5["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForJobsTimeUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsTimeUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  T9["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForJobsUploadingProgressView::standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForJobsViewNavigator::standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsViewNavigator::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:NSData::initWithData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T16["method:NSData::initWithData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSString::substringFromIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T17["method:NSString::substringFromIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S17 -->|calls| T17
  S18["method:NSString::substringToIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T18["method:NSString::substringToIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S18 -->|calls| T18
  S19["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T19["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S19 -->|calls| T19
  S20["method:NSString::range<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T20["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S20 -->|calls| T20
  S21["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T21["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S21 -->|calls| T21
  S22["method:NSString::URLRequest<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T22["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSString::jobsFileUrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T23["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:BEMAnimationManager::initWithAnimationDuration:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMAnimationManager/BEMAnimationManager.m:12"]
  T24["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S24 -->|calls| T24
  S25["method:BEMCheckBox::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:52"]
  T25["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
