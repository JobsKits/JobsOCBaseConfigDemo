# `calls 符号关系 - 140`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  T1["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  S1 -->|calls| T1
  S2["method:JobsLocker::jobs_onceState<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:40"]
  T2["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  S2 -->|calls| T2
  S3["method:JobsLocker::executeOnce:<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:55"]
  T3["method:JobsLocker::jobs_onceState<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:40"]
  S3 -->|calls| T3
  S4["method:JobsLocker::didExecuteOnce<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:83"]
  T4["method:JobsLocker::jobs_onceState<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:40"]
  S4 -->|calls| T4
  S5["method:JobsLocker::resetOnceState<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:93"]
  T5["method:JobsLocker::jobs_onceState<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:40"]
  S5 -->|calls| T5
  S6["method:JobsLocker::initWithType:<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:26"]
  T6["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  S6 -->|calls| T6
  S7["method:JobsLocker::initWithType:<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:26"]
  T7["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  S7 -->|calls| T7
  S8["method:JobsLocker::initWithType:<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:26"]
  T8["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  S8 -->|calls| T8
  S9["method:JobsLocker::withLock:<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:87"]
  T9["method:JobsLocker::lock<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:65"]
  S9 -->|calls| T9
  S10["method:JobsLocker::withLock:<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:87"]
  T10["method:JobsLocker::unlock<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:141"]
  S10 -->|calls| T10
  S11["method:DemoObject::init<br/>JobsByPods/JobsLocker@Pods/Example/ExampleUsage.m:21"]
  T11["method:DemoObject::init<br/>JobsByPods/JobsLocker@Pods/Example/ExampleUsage.m:21"]
  S11 -->|calls| T11
  S12["method:DemoObject::init<br/>JobsByPods/JobsLocker@Pods/Example/ExampleUsage.m:21"]
  T12["method:JobsLocker::unfairLock<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker/JobsLocker.m:77"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForJobsLocker::standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsLocker::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:NSString::cor<br/>JobsByPods/JobsMakes@Pods/Core/NSString/NSString+Extra/NSString+Extra.m:13"]
  T16["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  T17["method:JobsPodspecKitForJobsMakes::standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:266"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsMakes::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:273"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  S19 -->|calls| T19
  S20["method:UIColor::jobsCor<br/>JobsByPods/JobsMakes@Pods/Support/UIKit/UIColor/UIColor+Extra.m:12"]
  T20["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S20 -->|calls| T20
  S21["method:UIColor::jobsCor<br/>JobsByPods/JobsMakes@Pods/Support/UIKit/UIColor/UIColor+Extra.m:12"]
  T21["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S21 -->|calls| T21
  S22["method:JobsMenuSubView_1::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:19"]
  T22["method:JobsMenuSubView_1::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:19"]
  S22 -->|calls| T22
  S23["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  T23["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  S23 -->|calls| T23
  S24["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  T24["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S24 -->|calls| T24
  S25["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
