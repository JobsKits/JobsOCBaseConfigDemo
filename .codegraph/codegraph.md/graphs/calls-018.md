# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:pingFangTCLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:190"]
  T1["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S1 -->|calls| T1
  S2["function:pingFangTCRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:194"]
  T2["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S2 -->|calls| T2
  S3["function:pingFangTCMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:198"]
  T3["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S3 -->|calls| T3
  S4["function:pingFangTCSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:202"]
  T4["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsOCDefs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForJobsOCDefs::standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsOCDefs::apply_standard_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsOCDefs::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsOCDefs::apply_standard_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsOCDefs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsOCProtocols::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsOCProtocols::standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsOCProtocols::apply_standard_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsOCProtocols::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsOCProtocols::apply_standard_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsOCProtocols::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForJobsOCRuntimeKits::standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  T17["method:JobsPodspecKitForJobsOCSnowflake::standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:266"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:273"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsOCTimer::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsOCTimer::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:NSString::add<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T23["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S23 -->|calls| T23
  S24["method:NSString::toast<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T24["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S24 -->|calls| T24
  S25["method:NSString::toast<br/>JobsByPods/JobsOCTimer@Pods/Support/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T25["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
