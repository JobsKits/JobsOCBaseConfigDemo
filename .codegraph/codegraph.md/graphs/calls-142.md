# `calls 符号关系 - 142`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:HAHandleDemoView::handleBtnTouchDownAction<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:44"]
  T1["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  S1 -->|calls| T1
  S2["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  T2["method:ASDisplayNode::bounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S2 -->|calls| T2
  S3["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  T3["method:ASDisplayNode::bounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S3 -->|calls| T3
  S4["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T4["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S4 -->|calls| T4
  S5["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T5["method:NSObject::mainBundle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:13"]
  S5 -->|calls| T5
  S6["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T6["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S6 -->|calls| T6
  S7["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T7["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S7 -->|calls| T7
  S8["method:JobsAdNoticeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAdNoticeView/JobsAdNoticeView.m:18"]
  T8["method:JobsAdNoticeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAdNoticeView/JobsAdNoticeView.m:18"]
  S8 -->|calls| T8
  S9["method:JobsAdNoticeView::adNoticeLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAdNoticeView/JobsAdNoticeView.m:43"]
  T9["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S9 -->|calls| T9
  S10["method:BaseContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/BaseContentView/BaseContentView.m:18"]
  T10["method:BaseContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/BaseContentView/BaseContentView.m:18"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:37"]
  T11["method:JobsAppDoorContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:37"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T12["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:181"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T13["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T14["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:191"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T15["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:210"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:47"]
  T16["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:223"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:95"]
  T17["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::checkTelePhoneNum:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:117"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T19["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:139"]
  T20["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T21["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:181"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T22["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:191"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T23["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:210"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T24["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:223"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::一些UI的初始状态<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:263"]
  T25["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:228"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
