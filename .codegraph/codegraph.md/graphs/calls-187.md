# `calls 符号关系 - 187`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:210"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:228"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:239"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::selectAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:247"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T5["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:181"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T6["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:191"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T7["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:210"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T8["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:223"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T9["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:228"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:271"]
  T10["method:JobsAppDoorContentView::selectTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:233"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:271"]
  T11["method:JobsAppDoorContentView::selectSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:239"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:271"]
  T12["method:JobsAppDoorContentView::selectAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:247"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:271"]
  T13["method:JobsAppDoorContentView::selectOthers<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:253"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:271"]
  T14["method:JobsAppDoorContentView::selectToRegisterBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:258"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:279"]
  T15["method:JobsAppDoorContentView::一些UI点击以后的状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:271"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:279"]
  T16["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:279"]
  T17["method:JobsAppDoorInputViewBaseStyle_1::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:109"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:279"]
  T18["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:279"]
  T19["method:JobsAppDoorInputViewBaseStyle_1::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:109"]
  S19 -->|calls| T19
  S20["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T20["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S20 -->|calls| T20
  S21["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T21["method:JobsAppDoorInputViewBaseStyle_1::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:109"]
  S21 -->|calls| T21
  S22["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
