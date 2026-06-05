# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  T3["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S3 -->|calls| T3
  S4["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  T4["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S4 -->|calls| T4
  S5["function:dinAlternate<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:149"]
  T5["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S5 -->|calls| T5
  S6["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  T6["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S6 -->|calls| T6
  S7["function:pingFangHKMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:158"]
  T7["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S7 -->|calls| T7
  S8["function:pingFangHKSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:162"]
  T8["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S8 -->|calls| T8
  S9["function:pingFangHKBold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:166"]
  T9["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S9 -->|calls| T9
  S10["function:pingFangHKUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:170"]
  T10["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S10 -->|calls| T10
  S11["function:pingFangHKThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:174"]
  T11["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S11 -->|calls| T11
  S12["function:pingFangHKLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:178"]
  T12["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S12 -->|calls| T12
  S13["function:pingFangTCUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:182"]
  T13["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S13 -->|calls| T13
  S14["function:pingFangTCThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:186"]
  T14["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S14 -->|calls| T14
  S15["function:pingFangTCLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:190"]
  T15["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S15 -->|calls| T15
  S16["function:pingFangTCRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:194"]
  T16["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S16 -->|calls| T16
  S17["function:pingFangTCMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:198"]
  T17["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S17 -->|calls| T17
  S18["function:pingFangTCSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:202"]
  T18["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsOCDefs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsOCDefs::standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsOCDefs::apply_standard_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsOCDefs::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsOCDefs::apply_standard_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsOCDefs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCDefs@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:NSString::isEqualToString<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:12"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSString::isEqualToString<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:12"]
  T23["method:NSString::isEqualToString<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSString::add<br/>JobsByPods/JobsOCDefs@Pods/Support/UIKit/NSString/NSString+Extra.m:22"]
  T24["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsOCProtocols::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:277"]
  T25["method:JobsPodspecKitForJobsOCProtocols::standard_user_target_xcconfig<br/>JobsByPods/JobsOCProtocols@Pods/JobsPodspecKit.rb:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
