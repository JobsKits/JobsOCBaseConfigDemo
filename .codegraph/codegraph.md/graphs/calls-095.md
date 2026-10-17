# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  T1["method:JobsAppDoorContentView::checkRegisterBtnCanBeUsed<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:608"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::selectAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:739"]
  T2["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::selectAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:739"]
  T3["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::selectAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:739"]
  T4["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::selectAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:739"]
  T5["function:JobsAppDoorRegisterHomeBtnTopOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:43"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::selectOthers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:751"]
  T6["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::selectOthers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:751"]
  T7["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::selectToRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:763"]
  T8["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:772"]
  T9["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:618"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:772"]
  T10["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:633"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:772"]
  T11["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:658"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:772"]
  T12["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:678"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:772"]
  T13["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:692"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:780"]
  T14["method:JobsAppDoorContentView::selectTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:703"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:780"]
  T15["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:716"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:780"]
  T16["method:JobsAppDoorContentView::selectAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:739"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:780"]
  T17["method:JobsAppDoorContentView::selectOthers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:751"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:780"]
  T18["method:JobsAppDoorContentView::selectToRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:763"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T19["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:780"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T20["method:JobsAppDoorInputViewBaseStyleModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:1223"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T21["method:JobsAppDoorContentView::jobs_layoutRegisterInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:414"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T22["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T23["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T24["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T25["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
