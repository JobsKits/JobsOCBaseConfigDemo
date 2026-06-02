# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  T2["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:JobsBioKit::shared<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:12"]
  T3["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S3 -->|calls| T3
  S4["method:JobsBioKit::biometryType<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:21"]
  T4["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S4 -->|calls| T4
  S5["method:JobsBioKit::biometryName<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:46"]
  T5["method:JobsBioKit::biometryType<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:21"]
  S5 -->|calls| T5
  S6["method:JobsBioKit::isBiometryAvailable:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:61"]
  T6["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S6 -->|calls| T6
  S7["method:JobsBioKit::isDeviceOwnerAuthenticationAvailable:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:67"]
  T7["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S7 -->|calls| T7
  S8["method:JobsBioKit::authenticateWithReason:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:73"]
  T8["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  S8 -->|calls| T8
  S9["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T9["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S9 -->|calls| T9
  S10["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T10["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S10 -->|calls| T10
  S11["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T11["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsBioKit::standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsBioKit::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T15["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S15 -->|calls| T15
  S16["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T16["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S16 -->|calls| T16
  S17["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T17["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S17 -->|calls| T17
  S18["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T18["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S18 -->|calls| T18
  S19["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T19["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S19 -->|calls| T19
  S20["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T20["function:networkingEnvir<br/>JobsByPods/JobsOCDefs@Pods/Core/JobsDefines/JobsDefineURLs.h:42"]
  S20 -->|calls| T20
  S21["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T21["method:JobsBitsMonitorSuspendLab::commonInit_JobsBitsMonitorSuspendLab<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:133"]
  S21 -->|calls| T21
  S22["method:JobsBitsMonitorSuspendLab::viewFrameByModel<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:183"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsBitsMonitorSuspendLab::viewFrameByModel<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:183"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:JobsBitsMonitorSuspendLab::viewFrameByModel<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:183"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsBitsMonitorSuspendLab::viewFrameByModel<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:183"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
