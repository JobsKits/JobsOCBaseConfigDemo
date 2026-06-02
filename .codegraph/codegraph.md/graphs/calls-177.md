# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:35"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:JobsNetworkTrafficMonitor::destroyShared<br/>JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools.m:27"]
  T2["method:JobsNetworkTrafficMonitor::byStop<br/>JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools.m:54"]
  S2 -->|calls| T2
  S3["method:JobsNetworkTrafficMonitor::timer<br/>JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools.m:63"]
  T3["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsNetWorkTools::standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  T7["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S7 -->|calls| T7
  S8["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  T8["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S8 -->|calls| T8
  S9["function:dinAlternate<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:149"]
  T9["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S9 -->|calls| T9
  S10["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  T10["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S10 -->|calls| T10
  S11["function:pingFangHKMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:158"]
  T11["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S11 -->|calls| T11
  S12["function:pingFangHKSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:162"]
  T12["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S12 -->|calls| T12
  S13["function:pingFangHKBold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:166"]
  T13["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S13 -->|calls| T13
  S14["function:pingFangHKUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:170"]
  T14["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S14 -->|calls| T14
  S15["function:pingFangHKThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:174"]
  T15["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S15 -->|calls| T15
  S16["function:pingFangHKLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:178"]
  T16["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S16 -->|calls| T16
  S17["function:pingFangTCUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:182"]
  T17["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S17 -->|calls| T17
  S18["function:pingFangTCThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:186"]
  T18["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S18 -->|calls| T18
  S19["function:pingFangTCLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:190"]
  T19["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S19 -->|calls| T19
  S20["function:pingFangTCRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:194"]
  T20["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S20 -->|calls| T20
  S21["function:pingFangTCMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:198"]
  T21["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S21 -->|calls| T21
  S22["function:pingFangTCSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:202"]
  T22["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S22 -->|calls| T22
  S23["function:JobsSafeWidth::jobsSameSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:565"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["function:JobsSafeWidth::jobsSameSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:565"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["function:JobsSafeWidth::jobsSamePoint<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:569"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
