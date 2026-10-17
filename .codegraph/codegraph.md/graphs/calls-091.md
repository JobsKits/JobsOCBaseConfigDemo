# `calls 符号关系 - 091`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:451"]
  T1["method:JobsAppDoorContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:291"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:451"]
  T2["method:UITextField::jobsTextFieldEventFilterBlock:subscribeNextBlock:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:13"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T3["method:JobsAppDoorContentView::bySendBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1304"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T4["method:RACCompoundDisposable::byCompoundDisposable<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ReactiveObjC+DSL/ReactiveObjC+DSL/ReactiveObjC+DSL.m:74"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T5["method:JobsAppDoorContentView::jobs_subscribeTextChangeByInputView:block:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:451"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T6["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T7["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T8["method:RACCompoundDisposable::byAddDisposable<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ReactiveObjC+DSL/ReactiveObjC+DSL/ReactiveObjC+DSL.m:86"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T9["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T10["method:JobsAppDoorContentView::bySendBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1304"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T11["method:JobsAppDoorContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:362"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  T12["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T13["method:JobsAppDoorContentView::jobs_textIsNotEmpty<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:281"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T15["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T16["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T17["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:30"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T18["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T19["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T20["method:UIButton::disabledStateTitleColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:389"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T21["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  T22["method:CALayer::byCornerRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:448"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T23["method:JobsAppDoorContentView::byVerificationCodeBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1313"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T24["method:JobsAppDoorInputViewBaseStyle_1::getCountDownBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:119"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T25["method:JobsCountdownBtn::jobsResetCountdownTitle<br/>JobsByPods/JobsCountdownBtn@Pods/Core/JobsCountdownBtn/JobsCountdownButton/JobsCountdownButton.m:148"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
