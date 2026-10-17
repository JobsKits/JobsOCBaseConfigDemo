# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  T1["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  T2["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:30"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  T3["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  T4["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  T5["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  T6["method:CALayer::byCornerRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:448"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T7["method:JobsAppDoorContentView::jobs_lastVisibleRegisterInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:382"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T8["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T9["function:JobsAppDoorRegisterSendBtnTopOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:39"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T10["method:MasonryModel::byBottom<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:62"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T12["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T13["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T14["function:JobsAppDoorRegisterHomeBtnTopOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:43"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  T15["method:UIView::byBringSubviewToFront<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:825"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::jobs_layoutRegisterInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:414"]
  T16["function:JobsAppDoorRegisterFirstInputTopOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:35"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::jobs_layoutRegisterInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:414"]
  T17["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::jobs_layoutRegisterInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:414"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::jobs_layoutRegisterInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:414"]
  T19["function:JobsAppDoorRegisterInputViewOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:31"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::jobs_applyRegisterInputViewState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:429"]
  T20["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:620"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::jobs_applyRegisterInputViewState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:429"]
  T21["function:jobsMakeLocationModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsLocationModel/JobsLocationModel.h:46"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::jobs_applyRegisterInputViewState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:429"]
  T22["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::jobs_applyRegisterInputViewState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:429"]
  T23["method:FMBannerAdsModel::byCornerRadiusValue<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:263"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::jobs_applyRegisterInputViewState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:429"]
  T24["method:JobsAppDoorInputViewBaseStyleModel::byLayerCor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:3356"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::jobs_applyRegisterInputViewState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:429"]
  T25["method:JobsLocationModel::byJobsWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
