# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JXScaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:140"]
  T1["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S1 -->|calls| T1
  S2["function:JXScaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:145"]
  T2["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S2 -->|calls| T2
  S3["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  T3["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  S3 -->|calls| T3
  S4["method:JobsShowNumView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:43"]
  T4["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  S4 -->|calls| T4
  S5["method:JobsShowNumView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:54"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:JobsShowNumView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:54"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["function:JobsShowNumView::jobsRichViewByModel::for<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:71"]
  T7["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S7 -->|calls| T7
  S8["function:JobsShowNumView::jobsRichViewByModel::for<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:71"]
  T8["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S8 -->|calls| T8
  S9["method:JobsShowNumView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:102"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:JobsShowNumView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:102"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  T11["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  S11 -->|calls| T11
  S12["method:JobsStepView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:54"]
  T12["method:JobsStepView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:54"]
  S12 -->|calls| T12
  S13["method:JobsStepView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:58"]
  T13["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  S13 -->|calls| T13
  S14["method:JobsStepView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:64"]
  T14["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  S14 -->|calls| T14
  S15["method:JobsStepView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:73"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsStepView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:73"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JobsStepView::makeButtonModelBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:170"]
  T17["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  S17 -->|calls| T17
  S18["method:JobsStepView::makeButtonModelBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:170"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:JobsStepView::makeButtonModelBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:170"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T20["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S20 -->|calls| T20
  S21["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T21["method:JobsStepView::makeLeftLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:253"]
  S21 -->|calls| T21
  S22["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T22["method:JobsStepView::makeLeftLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:253"]
  S22 -->|calls| T22
  S23["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T23["method:JobsStepView::makeRightLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:237"]
  S23 -->|calls| T23
  S24["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T24["method:JobsStepView::makeRightLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:237"]
  S24 -->|calls| T24
  S25["method:JobsStepView::makeRightLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:237"]
  T25["method:UILabel::byBgColor<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:106"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
