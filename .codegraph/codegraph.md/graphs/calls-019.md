# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForJobsOCTimerManager::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:GXCardItemDemoCell::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardItemDemoCell/GXCardItemDemoCell.m:12"]
  T4["method:GXCardItemDemoCell::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardItemDemoCell/GXCardItemDemoCell.m:12"]
  S4 -->|calls| T4
  S5["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T5["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S5 -->|calls| T5
  S6["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T6["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S6 -->|calls| T6
  S7["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T7["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S7 -->|calls| T7
  S8["method:JobsVPN::configureVPN<br/>JobsByPods/JobsOCTools@Pods/Core/VPN/JobsVPN.m:20"]
  T8["method:JobsVPN::getKeychainPassword<br/>JobsByPods/JobsOCTools@Pods/Core/VPN/JobsVPN.m:12"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  T9["method:JobsPodspecKitForJobsOCTools::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:266"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsOCTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:273"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  S11 -->|calls| T11
  S12["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  T12["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S12 -->|calls| T12
  S13["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  T13["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S13 -->|calls| T13
  S14["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  T14["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S14 -->|calls| T14
  S15["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  T15["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S15 -->|calls| T15
  S16["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  T16["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S16 -->|calls| T16
  S17["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  T17["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S17 -->|calls| T17
  S18["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  T18["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S18 -->|calls| T18
  S19["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  T19["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S19 -->|calls| T19
  S20["function:JobsRandomNumber<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:52"]
  T20["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  S20 -->|calls| T20
  S21["function:JobsRandom0_100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:62"]
  T21["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S21 -->|calls| T21
  S22["function:JobsRandom0__100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:66"]
  T22["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S22 -->|calls| T22
  S23["function:JobsRandom100_200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:70"]
  T23["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  S23 -->|calls| T23
  S24["function:JobsRandom100__200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:74"]
  T24["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  S24 -->|calls| T24
  S25["function:baseRandomNOContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:78"]
  T25["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
