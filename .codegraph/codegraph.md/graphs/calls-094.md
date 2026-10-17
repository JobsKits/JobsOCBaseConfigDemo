# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:658"]
  T1["function:JobsAppDoorActionFont<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:19"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:658"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:658"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:658"]
  T4["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:678"]
  T5["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:678"]
  T6["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:692"]
  T7["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:692"]
  T8["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:692"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::selectTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:703"]
  T10["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::selectTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:703"]
  T11["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::selectTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:703"]
  T12["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::selectTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:703"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T14["function:JobsAppDoorRegisterSendBtnHeight<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:27"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T15["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T16["method:NSValue::bySize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:11"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T17["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T18["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T19["method:UIButton::normalStateTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:535"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T21["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T22["method:CALayer::byCornerRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:448"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T23["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T24["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T25["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
