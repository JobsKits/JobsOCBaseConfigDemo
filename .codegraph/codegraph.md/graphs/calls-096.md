# `calls 符号关系 - 096`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsOCProtocols::apply_standard_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsOCProtocols::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsOCProtocols::apply_standard_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsOCProtocols::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForJobsOCRuntimeKits::standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T9["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S9 -->|calls| T9
  S10["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T10["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S10 -->|calls| T10
  S11["method:NSDate::readableDayTime<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T11["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S11 -->|calls| T11
  S12["method:NSDate::readableTime<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T12["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S12 -->|calls| T12
  S13["method:NSMutableSet::containsObject<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Category/NSMutableSet+Extra.m:25"]
  T13["method:NSMutableSet::containsObject<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Category/NSMutableSet+Extra.m:25"]
  S13 -->|calls| T13
  S14["method:NSObject::valueForKey<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSObject::valueForKey<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  T15["method:NSObject::valueForKey<br/>JobsByPods/JobsOCRuntimeKits@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForJobsOCSnowflake::standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["method:JobsTimer::init<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:276"]
  T19["method:JobsTimer::init<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:276"]
  S19 -->|calls| T19
  S20["method:JobsTimer::dealloc<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:290"]
  T20["method:JobsTimer::teardownAppStateMonitor<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:724"]
  S20 -->|calls| T20
  S21["method:JobsTimer::dealloc<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:290"]
  T21["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S21 -->|calls| T21
  S22["method:JobsTimer::setupAppStateIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:305"]
  T22["method:JobsTimer::setupAppStateMonitorIfNeeded<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:696"]
  S22 -->|calls| T22
  S23["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  T23["method:JobsTimer::invalidateInternal<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:530"]
  S23 -->|calls| T23
  S24["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  T24["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S24 -->|calls| T24
  S25["method:JobsTimer::routeStopIfNeededFromCallback<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:309"]
  T25["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
