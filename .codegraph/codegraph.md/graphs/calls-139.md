# `calls 符号关系 - 139`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T1["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  S1 -->|calls| T1
  S2["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  T2["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S2 -->|calls| T2
  S3["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  T3["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S3 -->|calls| T3
  S4["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  T4["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  S4 -->|calls| T4
  S5["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  T5["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S5 -->|calls| T5
  S6["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  T6["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S6 -->|calls| T6
  S7["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  T7["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S7 -->|calls| T7
  S8["method:JobsTimer::startNSTimerWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:590"]
  T8["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S8 -->|calls| T8
  S9["method:JobsTimer::startGCDTimerWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:605"]
  T9["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S9 -->|calls| T9
  S10["method:JobsTimer::startDisplayLinkWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:635"]
  T10["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S10 -->|calls| T10
  S11["method:JobsTimer::startRunLoopTimerWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:646"]
  T11["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S11 -->|calls| T11
  S12["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  T12["method:JobsTimer::teardownAppStateMonitor<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:724"]
  S12 -->|calls| T12
  S13["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  T13["method:JobsTimer::jobs_onDidEnterBackground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:755"]
  S13 -->|calls| T13
  S14["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  T14["method:JobsTimer::jobs_onWillEnterForeground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:762"]
  S14 -->|calls| T14
  S15["method:JobsTimer::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:736"]
  T15["method:JobsTimer::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:736"]
  S15 -->|calls| T15
  S16["method:JobsTimer::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:736"]
  T16["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  S16 -->|calls| T16
  S17["method:JobsTimer::jobs_onDidEnterBackground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:755"]
  T17["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  S17 -->|calls| T17
  S18["method:JobsTimer::jobs_onWillEnterForeground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:762"]
  T18["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  S18 -->|calls| T18
  S19["method:JobsTimer::byPauseInBackground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:917"]
  T19["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  S19 -->|calls| T19
  S20["method:JobsTimer::byAutoManageAppState<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:928"]
  T20["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  T21["method:JobsPodspecKitForJobsOCTimer::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:266"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsOCTimer::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:273"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  S23 -->|calls| T23
  S24["method:NSString::add<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T24["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S24 -->|calls| T24
  S25["method:NSString::toast<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T25["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
