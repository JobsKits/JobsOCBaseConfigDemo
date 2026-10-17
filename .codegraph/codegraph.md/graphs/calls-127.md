# `calls 符号关系 - 127`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T2["method:UILabel::byMinimumFontSize<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:1371"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T3["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:451"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T4["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T5["method:JobsAppDoorRegisterContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:276"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T6["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T9["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T10["method:CALayer::byMasksToBounds<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:421"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T11["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T14["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T16["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T17["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T18["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T19["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T20["method:UIView::byBringSubviewToFront<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:825"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T21["method:UIView::byBringSubviewToFront<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:825"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  T22["method:UIView::byBringSubviewToFront<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:825"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorRegisterContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:231"]
  T23["method:JobsAppDoorRegisterContentView::dk<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:388"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorRegisterContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:231"]
  T24["method:JobsAppDoorRegisterContentView::dk<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:388"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorRegisterContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:231"]
  T25["method:JobsAppDoorRegisterContentView::dk<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:388"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
