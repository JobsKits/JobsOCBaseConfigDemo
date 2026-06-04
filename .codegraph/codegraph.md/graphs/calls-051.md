# `calls 符号关系 - 051`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T3["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:JobsBioKit::biometryName<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:46"]
  T4["method:JobsBioKit::biometryType<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:21"]
  S4 -->|calls| T4
  S5["method:JobsBioKit::authenticateWithReason:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:73"]
  T5["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  S5 -->|calls| T5
  S6["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T6["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S6 -->|calls| T6
  S7["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T7["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsBioKit::standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsBioKit::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T11["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S11 -->|calls| T11
  S12["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T12["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S12 -->|calls| T12
  S13["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T13["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S13 -->|calls| T13
  S14["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T14["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S14 -->|calls| T14
  S15["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T15["function:networkingEnvir<br/>JobsByPods/JobsOCDefs@Pods/Core/JobsDefines/JobsDefineURLs.h:42"]
  S15 -->|calls| T15
  S16["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T16["method:JobsBitsMonitorSuspendLab::commonInit_JobsBitsMonitorSuspendLab<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:133"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  T17["method:JobsPodspecKitForJobsBitsMonitor::standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:266"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:273"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsBlock::standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsBlock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T23["method:AVAssetImageGenerator::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVAssetImageGenerator/AVAssetImageGenerator+Extra/AVAssetImageGenerator+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T24["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S24 -->|calls| T24
  S25["method:CALayer::curve<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T25["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
