# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::backgroundConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+UIBackgroundConfig/UIView+UIBackgroundConfig.m:14"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:UIView::backgroundConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+UIBackgroundConfig/UIView+UIBackgroundConfig.m:14"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:UIView::backgroundConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+UIBackgroundConfig/UIView+UIBackgroundConfig.m:14"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:UIView::backgroundConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+UIBackgroundConfig/UIView+UIBackgroundConfig.m:14"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:UIView::currentController<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIViewController::path<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+GifImageView/UIViewController+GifImageView.m:36"]
  T6["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S6 -->|calls| T6
  S7["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T7["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S7 -->|calls| T7
  S8["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T8["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S8 -->|calls| T8
  S9["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T9["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S9 -->|calls| T9
  S10["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T10["method:UIViewController::fixErrorBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:318"]
  S10 -->|calls| T10
  S11["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T11["method:UIViewController::fixStartBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:328"]
  S11 -->|calls| T11
  S12["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T12["method:UIViewController::fixProgressBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:338"]
  S12 -->|calls| T12
  S13["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T13["method:UIViewController::fixCompleteBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:348"]
  S13 -->|calls| T13
  S14["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T14["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S14 -->|calls| T14
  S15["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T15["method:UIViewController::fixErrorBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:318"]
  S15 -->|calls| T15
  S16["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T16["method:UIViewController::fixStartBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:328"]
  S16 -->|calls| T16
  S17["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T17["method:UIViewController::fixProgressBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:338"]
  S17 -->|calls| T17
  S18["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T18["method:UIViewController::fixCompleteBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:348"]
  S18 -->|calls| T18
  S19["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T19["function:JobsApplyJPImageresizerBlurAppearance<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:10"]
  S19 -->|calls| T19
  S20["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T20["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S20 -->|calls| T20
  S21["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T21["function:JobsApplyJPImageresizerBlurAppearance<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:10"]
  S21 -->|calls| T21
  S22["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T22["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S22 -->|calls| T22
  S23["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T23["function:JobsApplyJPImageresizerBlurAppearance<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:10"]
  S23 -->|calls| T23
  S24["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T24["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S24 -->|calls| T24
  S25["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T25["method:UIViewController::fixErrorBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:318"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
