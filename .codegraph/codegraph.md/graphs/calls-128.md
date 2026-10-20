# `calls 符号关系 - 128`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorRegisterContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:231"]
  T1["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorRegisterContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:231"]
  T2["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorRegisterContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:231"]
  T3["method:JobsAppDoorRegisterContentView::refreshRegisterLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:157"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorRegisterContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:295"]
  T4["method:JobsAppDoorRegisterContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:276"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorRegisterContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:311"]
  T5["method:JobsAppDoorRegisterContentView::jobs_textIsNotEmpty<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:266"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorRegisterContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:311"]
  T6["method:JobsAppDoorRegisterContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:295"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorRegisterContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:311"]
  T7["method:JobsAppDoorRegisterContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:295"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorRegisterContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:311"]
  T8["method:JobsAppDoorRegisterContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:295"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  T9["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  T10["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  T11["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:30"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  T12["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  T13["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  T14["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  T15["method:CALayer::byCornerRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:448"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorRegisterContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:347"]
  T16["method:JobsAppDoorRegisterContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:276"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorRegisterContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:347"]
  T17["method:UITextField::jobsTextFieldEventFilterBlock:subscribeNextBlock:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:13"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T18["method:JobsAppDoorRegisterContentView::bySendBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:598"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T19["method:RACCompoundDisposable::byCompoundDisposable<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ReactiveObjC+DSL/ReactiveObjC+DSL/ReactiveObjC+DSL.m:74"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T20["method:JobsAppDoorRegisterContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:347"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T21["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T22["method:JobsAppDoorRegisterContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:311"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T23["method:RACCompoundDisposable::byAddDisposable<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ReactiveObjC+DSL/ReactiveObjC+DSL/ReactiveObjC+DSL.m:86"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T24["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T25["method:JobsAppDoorRegisterContentView::bySendBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:598"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
