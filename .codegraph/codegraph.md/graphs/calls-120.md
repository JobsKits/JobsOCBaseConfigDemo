# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorLoginContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:288"]
  T1["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorLoginContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:288"]
  T2["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorLoginContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:288"]
  T3["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorLoginContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:288"]
  T4["method:CALayer::byCornerRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:448"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorLoginContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:307"]
  T5["method:JobsAppDoorLoginContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:241"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorLoginContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:307"]
  T6["method:UITextField::jobsTextFieldEventFilterBlock:subscribeNextBlock:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:13"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T7["method:JobsAppDoorLoginContentView::bySendBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:570"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T8["method:RACCompoundDisposable::byCompoundDisposable<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ReactiveObjC+DSL/ReactiveObjC+DSL/ReactiveObjC+DSL.m:74"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T9["method:JobsAppDoorLoginContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:307"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T10["method:JobsAppDoorLoginContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:288"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T11["method:JobsAppDoorLoginContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:276"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T12["method:RACCompoundDisposable::byAddDisposable<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ReactiveObjC+DSL/ReactiveObjC+DSL/ReactiveObjC+DSL.m:86"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T13["method:JobsAppDoorLoginContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:288"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T14["method:JobsAppDoorLoginContentView::bySendBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:570"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T15["method:JobsAppDoorLoginContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:288"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorLoginContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:318"]
  T16["method:JobsAppDoorLoginContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:276"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T17["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T18["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T19["method:JobsAppDoorLoginContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:205"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T20["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T21["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T22["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T23["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorLoginContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:358"]
  T24["method:JobsAppDoorLoginContentView::refreshLoginLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:115"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T25["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
