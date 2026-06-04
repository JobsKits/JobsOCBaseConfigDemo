# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsLocker::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsLocker::apply_standard_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsLocker::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLocker@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["method:NSString::cor<br/>JobsByPods/JobsMakes@Pods/Core/NSString/NSString+Extra/NSString+Extra.m:13"]
  T3["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsMakes::standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsMakes::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsMakes::apply_standard_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsMakes::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMakes@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:UIColor::jobsCor<br/>JobsByPods/JobsMakes@Pods/Support/UIKit/UIColor/UIColor+Extra.m:12"]
  T7["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S7 -->|calls| T7
  S8["method:UIColor::jobsCor<br/>JobsByPods/JobsMakes@Pods/Support/UIKit/UIColor/UIColor+Extra.m:12"]
  T8["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S8 -->|calls| T8
  S9["method:JobsMenuSubView_1::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:19"]
  T9["method:JobsMenuSubView_1::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:19"]
  S9 -->|calls| T9
  S10["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  T10["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  S10 -->|calls| T10
  S11["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  T11["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S11 -->|calls| T11
  S12["method:JobsMenuSubView_1::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:42"]
  T12["method:JobsMenuSubView_1::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:19"]
  S12 -->|calls| T12
  S13["method:JobsMenuSubView_2::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:19"]
  T13["method:JobsMenuSubView_2::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:19"]
  S13 -->|calls| T13
  S14["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  T14["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  S14 -->|calls| T14
  S15["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  T15["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S15 -->|calls| T15
  S16["method:JobsMenuSubView_2::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:42"]
  T16["method:JobsMenuSubView_2::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:19"]
  S16 -->|calls| T16
  S17["method:JobsMenuSubView_3::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:19"]
  T17["method:JobsMenuSubView_3::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:19"]
  S17 -->|calls| T17
  S18["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  T18["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  S18 -->|calls| T18
  S19["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  T19["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S19 -->|calls| T19
  S20["method:JobsMenuSubView_3::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:42"]
  T20["method:JobsMenuSubView_3::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:19"]
  S20 -->|calls| T20
  S21["method:JobsMenuSubView_4::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:19"]
  T21["method:JobsMenuSubView_4::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:19"]
  S21 -->|calls| T21
  S22["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  T22["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  S22 -->|calls| T22
  S23["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  T23["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S23 -->|calls| T23
  S24["method:JobsMenuSubView_4::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:42"]
  T24["method:JobsMenuSubView_4::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:19"]
  S24 -->|calls| T24
  S25["method:JobsMenuView::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:23"]
  T25["method:JobsMenuView::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
