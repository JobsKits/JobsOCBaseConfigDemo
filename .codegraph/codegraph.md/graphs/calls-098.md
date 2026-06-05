# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForJobsOCTimer::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsOCTimer::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:NSString::add<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T4["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S4 -->|calls| T4
  S5["method:NSString::toast<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T5["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S5 -->|calls| T5
  S6["method:NSString::toast<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T6["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S6 -->|calls| T6
  S7["method:_JobsTimerManagerEntry::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:21"]
  T7["method:_JobsTimerManagerEntry::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:21"]
  S7 -->|calls| T7
  S8["method:JobsTimerMgr::dealloc<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:67"]
  T8["method:JobsTimerMgr::teardownAppStateObservers<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:399"]
  S8 -->|calls| T8
  S9["method:JobsTimerMgr::dealloc<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:67"]
  T9["method:JobsTimerMgr::stopAndRemoveAll<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:310"]
  S9 -->|calls| T9
  S10["method:JobsTimerMgr::shared<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:72"]
  T10["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  S10 -->|calls| T10
  S11["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  T11["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  S11 -->|calls| T11
  S12["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  T12["method:JobsTimerMgr::setupAppStateObservers<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:378"]
  S12 -->|calls| T12
  S13["method:JobsTimerMgr::upsertTimerWithIdentifiable:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:87"]
  T13["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  S13 -->|calls| T13
  S14["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T14["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S14 -->|calls| T14
  S15["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T15["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S15 -->|calls| T15
  S16["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T16["function:jobs_trySetBoolByKVC<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:50"]
  S16 -->|calls| T16
  S17["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T17["function:jobs_trySetBoolByKVC<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:50"]
  S17 -->|calls| T17
  S18["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T18["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S18 -->|calls| T18
  S19["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T19["method:JobsTimerMgr::init<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:80"]
  S19 -->|calls| T19
  S20["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T20["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S20 -->|calls| T20
  S21["method:JobsTimerMgr::upsertTimerWithIdentifier:timerType:policy:startImmediately:build:handler:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:101"]
  T21["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  S21 -->|calls| T21
  S22["method:JobsTimerMgr::onTickVoid:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:173"]
  T22["method:JobsTimerMgr::onTick:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:178"]
  S22 -->|calls| T22
  S23["method:JobsTimerMgr::onFinishVoid:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:191"]
  T23["method:JobsTimerMgr::onFinish:block:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:196"]
  S23 -->|calls| T23
  S24["method:JobsTimerMgr::start:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:210"]
  T24["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S24 -->|calls| T24
  S25["method:JobsTimerMgr::start:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:210"]
  T25["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
