# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAdNoticeView::adNoticeLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAdNoticeView/JobsAdNoticeView.m:43"]
  T1["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S1 -->|calls| T1
  S2["method:JobsAdNoticeView::adNoticeLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAdNoticeView/JobsAdNoticeView.m:43"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:BaseContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/BaseContentView/BaseContentView.m:18"]
  T3["method:BaseContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/BaseContentView/BaseContentView.m:18"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:37"]
  T4["method:JobsAppDoorContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:37"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T5["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:181"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T6["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T7["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:191"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T8["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:210"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T9["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:223"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:95"]
  T10["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:95"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::checkTelePhoneNum:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:117"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T13["method:JobsAppDoorInputViewBaseStyle_1::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:109"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T14["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T18["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:181"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:181"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:191"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:191"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:191"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:210"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:210"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
