# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimerMgr::dealloc<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:67"]
  T1["method:JobsTimerMgr::stopAndRemoveAll<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:310"]
  S1 -->|calls| T1
  S2["method:JobsTimerMgr::shared<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:72"]
  T2["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  S2 -->|calls| T2
  S3["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  T3["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  S3 -->|calls| T3
  S4["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  T4["method:JobsTimerMgr::setupAppStateObservers<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:378"]
  S4 -->|calls| T4
  S5["method:JobsTimerMgr::upsertTimerWithIdentifiable:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:87"]
  T5["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  S5 -->|calls| T5
  S6["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T6["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S6 -->|calls| T6
  S7["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T7["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S7 -->|calls| T7
  S8["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T8["function:jobs_trySetBoolByKVC<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:50"]
  S8 -->|calls| T8
  S9["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T9["function:jobs_trySetBoolByKVC<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:50"]
  S9 -->|calls| T9
  S10["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T10["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S10 -->|calls| T10
  S11["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T11["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  S11 -->|calls| T11
  S12["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T12["variable:handler<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@抽奖轮盘/View/LuckyWheelView.h:70"]
  S12 -->|calls| T12
  S13["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T13["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S13 -->|calls| T13
  S14["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T14["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  S14 -->|calls| T14
  S15["method:JobsTimerMgr::onTickVoid:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:173"]
  T15["method:JobsTimerMgr::onTick:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:178"]
  S15 -->|calls| T15
  S16["method:JobsTimerMgr::onFinishVoid:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:191"]
  T16["method:JobsTimerMgr::onFinish:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:196"]
  S16 -->|calls| T16
  S17["method:JobsTimerMgr::start:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:210"]
  T17["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S17 -->|calls| T17
  S18["method:JobsTimerMgr::start:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:210"]
  T18["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  S18 -->|calls| T18
  S19["method:JobsTimerMgr::pause:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:229"]
  T19["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S19 -->|calls| T19
  S20["method:JobsTimerMgr::pause:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:229"]
  T20["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  S20 -->|calls| T20
  S21["method:JobsTimerMgr::resume:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:248"]
  T21["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S21 -->|calls| T21
  S22["method:JobsTimerMgr::resume:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:248"]
  T22["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  S22 -->|calls| T22
  S23["method:JobsTimerMgr::fireOnceAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:267"]
  T23["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S23 -->|calls| T23
  S24["method:JobsTimerMgr::fireOnceAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:267"]
  T24["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  S24 -->|calls| T24
  S25["method:JobsTimerMgr::stopAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:291"]
  T25["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
