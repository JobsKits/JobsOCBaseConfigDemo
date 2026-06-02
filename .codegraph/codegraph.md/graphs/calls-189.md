# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T1["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T2["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T3["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T4["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T5["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T8["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:535"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:535"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:535"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:535"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:535"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:535"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:575"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
