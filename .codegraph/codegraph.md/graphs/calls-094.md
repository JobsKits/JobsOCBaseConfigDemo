# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T1["method:JobsAppDoorInputViewBaseStyle_1::getCountDownBtn<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m':119"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T2["method:JobsCountdownBtn::jobsResetCountdownTitle<br/>JobsByPods/JobsCountdownBtn@Pods/Core/JobsCountdownBtn/JobsCountdownButton/JobsCountdownButton.m:148"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T3["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T4["method:JobsAppDoorContentView::jobs_textByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:329"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T5["method:JobsAppDoorContentView::jobs_textFieldByInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:291"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  T6["method:JobsAppDoorContentView::jobs_refreshVerificationCodeBtn:phoneText:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:492"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T7["method:JobsAppDoorInputViewBaseStyle_3::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m':130"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T8["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T9["method:FMDoorModel::byUserName<br/>JobsByPods/JobsModelDSL@Pods/Core/FMDoorModel/FMDoorModel+DSL/FMDoorModel+DSL.m:29"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T10["method:FMDoorModel::byPassword<br/>JobsByPods/JobsModelDSL@Pods/Core/FMDoorModel/FMDoorModel+DSL/FMDoorModel+DSL.m:137"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T11["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T12["method:JobsAppDoorContentView::allRise<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:261"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T13["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T14["method:MasonryModel::byLeft<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:71"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T18["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  T19["method:CALayer::byCornerRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:448"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::checkLoginBtnCanBeUsed<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:599"]
  T20["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::checkRegisterBtnCanBeUsed<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:608"]
  T21["method:JobsAppDoorContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:345"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:618"]
  T22["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:618"]
  T23["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:618"]
  T24["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:618"]
  T25["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
