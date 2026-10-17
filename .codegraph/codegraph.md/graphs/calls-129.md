# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T1["method:JobsAppDoorRegisterContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:311"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T2["method:RACCompoundDisposable::byAddDisposable<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ReactiveObjC+DSL/ReactiveObjC+DSL/ReactiveObjC+DSL.m:86"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T3["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T4["method:JobsAppDoorRegisterContentView::bySendBtnEnableDisposable<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:598"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T5["method:JobsAppDoorRegisterContentView::jobs_refreshSendBtnEnabled<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:328"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorRegisterContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:358"]
  T6["method:JobsAppDoorRegisterContentView::jobs_inputViewsHaveText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:311"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorRegisterContentView::dk<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:388"]
  T7["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T8["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T9["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T10["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T11["method:FSCalendarCell::byTitleLabel<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/FSCalendar+DSL/FSCalendar+DSL/FSCalendar+DSL.m:834"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T12["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T13["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T14["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T15["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:437"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T16["method:UIButton::jobsResetImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:120"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T17["method:UIButton::jobsResetImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:110"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T18["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T19["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T21["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T22["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T23["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:39"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T24["method:UILabel::byMinimumScaleFactor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:478"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorRegisterContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:402"]
  T25["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:451"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
