# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T1["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T2["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:16"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T3["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T4["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T5["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T6["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T7["function:UIFontWeightSemiboldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:43"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T8["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T9["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T10["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T11["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T12["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T13["method:UIButton::cornerRadiusValueBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:510"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T14["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T15["function:UIFontWeightSemiboldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:43"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T16["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T17["function:toastBy<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast/NSObject+WHToast.h:66"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorLoginContentView::sendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:431"]
  T18["method:UIButton::jobsTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:654"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorLoginContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:452"]
  T19["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorLoginContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:452"]
  T20["method:UICollectionViewCell::bySelected<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+BaseViewProtocol/UICollectionViewCell+BaseViewProtocol.m:21"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorLoginContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:452"]
  T21["method:FSCalendarCell::byTitleLabel<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/FSCalendar+DSL/FSCalendar+DSL/FSCalendar+DSL.m:834"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorLoginContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:452"]
  T22["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:11"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorLoginContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:452"]
  T23["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorLoginContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:452"]
  T24["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorLoginContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:452"]
  T25["method:UIButton::initByStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:271"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
