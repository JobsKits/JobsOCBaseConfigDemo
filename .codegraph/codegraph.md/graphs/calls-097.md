# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T1["method:MasonryModel::byLeft<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:71"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T2["method:NSValue::bySize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:11"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T3["function:JobsAppDoorRegisterInputViewOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:31"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T6["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T7["method:CALayer::byCornerRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:448"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T8["method:JobsAppDoorContentView::jobs_layoutRegisterInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:414"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T9["method:JobsAppDoorContentView::jobs_refreshRegisterSendBtnLayout<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:393"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T10["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  T11["method:JobsAppDoorContentView::jobs_bindVerificationCodeBtnEnableSignal<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:511"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::animationCommon<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:905"]
  T12["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::animationCommon<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:905"]
  T13["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::animationCommon<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:905"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::animationCommon<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:905"]
  T15["method:JobsAppDoorContentView::jobs_applyRegisterInputViewState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:429"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::animationChangeRegisterBtnFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:916"]
  T16["method:JobsAppDoorContentView::animationCommon<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:905"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::animationChangeRegisterBtnFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:916"]
  T17["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:788"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::animationChangeRegisterBtnFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:916"]
  T18["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:207"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:948"]
  T19["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:948"]
  T20["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:948"]
  T21["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:948"]
  T22["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:948"]
  T23["method:FSCalendarCell::byTitleLabel<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/FSCalendar+DSL/FSCalendar+DSL/FSCalendar+DSL.m:834"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:948"]
  T24["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:948"]
  T25["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
