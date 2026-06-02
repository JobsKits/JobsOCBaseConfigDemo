# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T1["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S1 -->|calls| T1
  S2["method:NSDate::readableDayTime<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T2["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S2 -->|calls| T2
  S3["method:NSDate::readableTime<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T3["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S3 -->|calls| T3
  S4["method:NSMutableSet::containsObject<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Category/NSMutableSet+Extra.m:25"]
  T4["method:NSMutableSet::containsObject<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Category/NSMutableSet+Extra.m:25"]
  S4 -->|calls| T4
  S5["method:NSObject::valueForKey<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:NSObject::valueForKey<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  T6["method:NSObject::valueForKey<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S6 -->|calls| T6
  S7["method:JobsOCSnowflake::initWithPublishMillisecond:IDCID:machineID:<br/>JobsByPods/JobsOCSnowflake@Pods/Core/JobsOCSnowflake.m:32"]
  T7["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsOCSnowflake::standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:JobsTimer::init<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:276"]
  T11["method:JobsTimer::init<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:276"]
  S11 -->|calls| T11
  S12["method:JobsTimer::dealloc<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:290"]
  T12["method:JobsTimer::teardownAppStateMonitor<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:724"]
  S12 -->|calls| T12
  S13["method:JobsTimer::dealloc<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:290"]
  T13["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S13 -->|calls| T13
  S14["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:305"]
  T14["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  S14 -->|calls| T14
  S15["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  T15["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S15 -->|calls| T15
  S16["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  T16["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S16 -->|calls| T16
  S17["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  T17["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S17 -->|calls| T17
  S18["method:JobsTimer::fireTickIfValid:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:331"]
  T18["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  S18 -->|calls| T18
  S19["method:JobsTimer::fireTickIfValid:<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:331"]
  T19["variable:finishBlock<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@CoreTextLearning/CoreTextLearningCore/NotifiManager/NotifiManager.h:27"]
  S19 -->|calls| T19
  S20["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T20["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:305"]
  S20 -->|calls| T20
  S21["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T21["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S21 -->|calls| T21
  S22["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T22["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S22 -->|calls| T22
  S23["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  T23["method:JobsTimer::start<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:367"]
  S23 -->|calls| T23
  S24["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  T24["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S24 -->|calls| T24
  S25["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  T25["function:JobsTimer::jobs_requireMainThread<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
