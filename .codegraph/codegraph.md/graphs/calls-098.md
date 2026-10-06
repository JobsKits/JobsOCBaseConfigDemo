# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T1["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T2["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T3["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T4["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T5["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T6["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T7["method:JobsAppDoorModel::byConfirmPassword<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorModel/JobsAppDoorModel+DSL/JobsAppDoorModel+DSL.m:29"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T8["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T9["method:JobsAppDoorContentView::allRise<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:261"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T10["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T11["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T12["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T13["method:JobsAppDoorModel::byTel<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorModel/JobsAppDoorModel+DSL/JobsAppDoorModel+DSL.m:38"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T14["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T15["method:JobsAppDoorContentView::allRise<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:261"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T16["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T17["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T18["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T19["method:JobsAppDoorContentView::jobs_prepareStaticPlaceholderForInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:310"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T20["method:JobsAppDoorModel::byVerificationCode<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorModel/JobsAppDoorModel+DSL/JobsAppDoorModel+DSL.m:47"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T21["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T22["method:JobsAppDoorContentView::allRise<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:261"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T23["method:JobsAppDoorContentView::getCellPhoneVerificationCodeWithCountry:phone:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:169"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T24["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T25["method:JobsAppDoorInputViewBaseStyle_4::byGraphicCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':259"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
