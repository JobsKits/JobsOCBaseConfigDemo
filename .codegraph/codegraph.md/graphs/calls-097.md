# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimer::fireTickIfValid:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:331"]
  T1["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  S1 -->|calls| T1
  S2["method:JobsTimer::fireTickIfValid:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:331"]
  T2["variable:finishBlock<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@CoreTextLearning/CoreTextLearningCore/NotifiManager/NotifiManager.h:27"]
  S2 -->|calls| T2
  S3["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T3["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:305"]
  S3 -->|calls| T3
  S4["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T4["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S4 -->|calls| T4
  S5["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T5["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S5 -->|calls| T5
  S6["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T6["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  S6 -->|calls| T6
  S7["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  T7["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S7 -->|calls| T7
  S8["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  T8["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S8 -->|calls| T8
  S9["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  T9["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  S9 -->|calls| T9
  S10["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  T10["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S10 -->|calls| T10
  S11["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  T11["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S11 -->|calls| T11
  S12["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  T12["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S12 -->|calls| T12
  S13["method:JobsTimer::startNSTimerWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:590"]
  T13["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S13 -->|calls| T13
  S14["method:JobsTimer::startGCDTimerWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:605"]
  T14["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S14 -->|calls| T14
  S15["method:JobsTimer::startDisplayLinkWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:635"]
  T15["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S15 -->|calls| T15
  S16["method:JobsTimer::startRunLoopTimerWithToken:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:646"]
  T16["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S16 -->|calls| T16
  S17["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  T17["method:JobsTimer::teardownAppStateMonitor<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:724"]
  S17 -->|calls| T17
  S18["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  T18["method:JobsTimer::jobs_onDidEnterBackground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:755"]
  S18 -->|calls| T18
  S19["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  T19["method:JobsTimer::jobs_onWillEnterForeground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:762"]
  S19 -->|calls| T19
  S20["method:JobsTimer::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:736"]
  T20["method:JobsTimer::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:736"]
  S20 -->|calls| T20
  S21["method:JobsTimer::syncWithCurrentAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:736"]
  T21["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  S21 -->|calls| T21
  S22["method:JobsTimer::jobs_onDidEnterBackground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:755"]
  T22["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  S22 -->|calls| T22
  S23["method:JobsTimer::jobs_onWillEnterForeground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:762"]
  T23["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  S23 -->|calls| T23
  S24["method:JobsTimer::byPauseInBackground<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:917"]
  T24["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  S24 -->|calls| T24
  S25["method:JobsTimer::byAutoManageAppState<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:928"]
  T25["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
