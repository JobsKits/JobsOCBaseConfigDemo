# `calls 符号关系 - 137`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  T1["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S1 -->|calls| T1
  S2["function:pingFangHKMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:158"]
  T2["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S2 -->|calls| T2
  S3["function:pingFangHKSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:162"]
  T3["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S3 -->|calls| T3
  S4["function:pingFangHKBold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:166"]
  T4["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S4 -->|calls| T4
  S5["function:pingFangHKUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:170"]
  T5["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S5 -->|calls| T5
  S6["function:pingFangHKThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:174"]
  T6["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S6 -->|calls| T6
  S7["function:pingFangHKLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:178"]
  T7["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S7 -->|calls| T7
  S8["function:pingFangTCUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:182"]
  T8["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S8 -->|calls| T8
  S9["function:pingFangTCThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:186"]
  T9["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S9 -->|calls| T9
  S10["function:pingFangTCLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:190"]
  T10["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S10 -->|calls| T10
  S11["function:pingFangTCRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:194"]
  T11["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S11 -->|calls| T11
  S12["function:pingFangTCMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:198"]
  T12["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S12 -->|calls| T12
  S13["function:pingFangTCSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:202"]
  T13["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsOCDefs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForJobsOCDefs::standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsOCDefs::apply_standard_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsOCDefs::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsOCDefs::apply_standard_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsOCDefs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["method:NSString::isEqualToString<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:12"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSString::isEqualToString<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:12"]
  T18["method:NSString::isEqualToString<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:NSString::add<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:22"]
  T19["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsOCProtocols::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsOCProtocols::standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsOCProtocols::apply_standard_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsOCProtocols::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsOCProtocols::apply_standard_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsOCProtocols::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
