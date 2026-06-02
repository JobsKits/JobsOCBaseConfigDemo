# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPageView::tableView:cellForRowAtIndexPath:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsPageTBV/JobsPageView.m:65"]
  T1["method:JobsPageTBVCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsPageTBV/JobsPageTBVCell.m:18"]
  S1 -->|calls| T1
  S2["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  T2["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  S2 -->|calls| T2
  S3["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T3["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  S3 -->|calls| T3
  S4["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T4["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S4 -->|calls| T4
  S5["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsRightMenuView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:51"]
  T7["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  S7 -->|calls| T7
  S8["method:JobsRightMenuView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:70"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:JobsRightMenuView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:70"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:JobsRightMenuView::resetUI<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:77"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:JobsRightMenuView::suspendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:90"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:JobsRightMenuView::suspendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:90"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsRightMenuView::stackImageView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:113"]
  T13["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:18"]
  S13 -->|calls| T13
  S14["method:JobsRightMenuView::stackImageView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:113"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsRightMenuView::stackImageView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:113"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T17["method:UIStackView::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIStackView/UIStackView+Extra/UIStackView+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:JobsScale::scaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:77"]
  T18["method:JobsScale::screenWidth<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:28"]
  S18 -->|calls| T18
  S19["method:JobsScale::scaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:82"]
  T19["method:JobsScale::screenHeight<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:53"]
  S19 -->|calls| T19
  S20["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  T20["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S20 -->|calls| T20
  S21["function:JXScaleSetupUsingSafeArea<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:103"]
  T21["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S21 -->|calls| T21
  S22["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  T22["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  S22 -->|calls| T22
  S23["function:w<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:124"]
  T23["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S23 -->|calls| T23
  S24["function:h<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:129"]
  T24["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S24 -->|calls| T24
  S25["function:fz<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:134"]
  T25["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
