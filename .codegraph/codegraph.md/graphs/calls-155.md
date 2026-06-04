# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T1["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S1 -->|calls| T1
  S2["method:JobsRightMenuView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:51"]
  T2["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  S2 -->|calls| T2
  S3["method:JobsRightMenuView::resetUI<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:77"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:JobsRightMenuView::stackImageView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:113"]
  T4["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:18"]
  S4 -->|calls| T4
  S5["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T6["method:UIStackView::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIStackView/UIStackView+Extra/UIStackView+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:JobsScale::scaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:77"]
  T7["method:JobsScale::screenWidth<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:28"]
  S7 -->|calls| T7
  S8["method:JobsScale::scaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:82"]
  T8["method:JobsScale::screenHeight<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:53"]
  S8 -->|calls| T8
  S9["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  T9["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S9 -->|calls| T9
  S10["function:JXScaleSetupUsingSafeArea<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:103"]
  T10["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S10 -->|calls| T10
  S11["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  T11["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  S11 -->|calls| T11
  S12["function:w<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:124"]
  T12["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S12 -->|calls| T12
  S13["function:h<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:129"]
  T13["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S13 -->|calls| T13
  S14["function:fz<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:134"]
  T14["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S14 -->|calls| T14
  S15["function:JXScaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:140"]
  T15["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S15 -->|calls| T15
  S16["function:JXScaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:145"]
  T16["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S16 -->|calls| T16
  S17["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  T17["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  S17 -->|calls| T17
  S18["method:JobsShowNumView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:43"]
  T18["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  S18 -->|calls| T18
  S19["function:JobsShowNumView::jobsRichViewByModel::for<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:71"]
  T19["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S19 -->|calls| T19
  S20["function:JobsShowNumView::jobsRichViewByModel::for<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:71"]
  T20["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S20 -->|calls| T20
  S21["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  T21["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  S21 -->|calls| T21
  S22["method:JobsStepView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:54"]
  T22["method:JobsStepView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:54"]
  S22 -->|calls| T22
  S23["method:JobsStepView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:58"]
  T23["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  S23 -->|calls| T23
  S24["method:JobsStepView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:64"]
  T24["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  S24 -->|calls| T24
  S25["method:JobsStepView::makeButtonModelBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:170"]
  T25["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
