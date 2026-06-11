# `calls 符号关系 - 017`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T1["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S1 -->|calls| T1
  S2["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T2["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S2 -->|calls| T2
  S3["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T3["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T4["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T5["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T6["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T7["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UINavigationController::initBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UINavigationController/UINavigationController+Extra/UINavigationController+Extra.m:12"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIView::currentController<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIViewController::navCtrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+Extra/UIViewController+Extra.m:32"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:277"]
  T11["method:JobsPodspecKitForJobsNetWorkTools::standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:266"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:273"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:277"]
  S13 -->|calls| T13
  S14["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  T14["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S14 -->|calls| T14
  S15["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  T15["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S15 -->|calls| T15
  S16["function:dinAlternate<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:149"]
  T16["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S16 -->|calls| T16
  S17["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  T17["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S17 -->|calls| T17
  S18["function:pingFangHKMedium<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:158"]
  T18["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S18 -->|calls| T18
  S19["function:pingFangHKSemibold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:162"]
  T19["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S19 -->|calls| T19
  S20["function:pingFangHKBold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:166"]
  T20["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S20 -->|calls| T20
  S21["function:pingFangHKUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:170"]
  T21["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S21 -->|calls| T21
  S22["function:pingFangHKThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:174"]
  T22["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S22 -->|calls| T22
  S23["function:pingFangHKLight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:178"]
  T23["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S23 -->|calls| T23
  S24["function:pingFangTCUltralight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:182"]
  T24["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S24 -->|calls| T24
  S25["function:pingFangTCThin<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:186"]
  T25["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
