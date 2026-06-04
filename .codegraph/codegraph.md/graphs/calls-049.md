# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsBioKit::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T3["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S3 -->|calls| T3
  S4["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T4["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S4 -->|calls| T4
  S5["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T5["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S5 -->|calls| T5
  S6["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T6["function:JobsBitsMonitorSuspendLab::JobsFormatSpeed<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:170"]
  S6 -->|calls| T6
  S7["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T7["function:networkingEnvir<br/>JobsByPods/JobsOCDefs@Pods/Core/JobsDefines/JobsDefineURLs.h:42"]
  S7 -->|calls| T7
  S8["method:JobsBitsMonitorSuspendLab::initBy:<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:22"]
  T8["method:JobsBitsMonitorSuspendLab::commonInit_JobsBitsMonitorSuspendLab<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab.m:133"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  T9["method:JobsPodspecKitForJobsBitsMonitor::standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:266"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:273"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsBlock::standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsBlock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T15["method:AVAssetImageGenerator::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVAssetImageGenerator/AVAssetImageGenerator+Extra/AVAssetImageGenerator+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T16["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S16 -->|calls| T16
  S17["method:CALayer::curve<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T17["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S17 -->|calls| T17
  S18["method:CALayer::animaSubtype<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T18["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S18 -->|calls| T18
  S19["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T19["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S19 -->|calls| T19
  S20["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T20["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S20 -->|calls| T20
  S21["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T21["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T22["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T23["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S23 -->|calls| T23
  S24["method:NSArray::jobsVisible<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T25["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
