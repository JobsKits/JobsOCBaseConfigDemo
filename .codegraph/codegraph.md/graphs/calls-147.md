# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JXScaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:145"]
  T1["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S1 -->|calls| T1
  S2["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  T2["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  S2 -->|calls| T2
  S3["method:JobsShowNumView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:43"]
  T3["method:JobsShowNumView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:36"]
  S3 -->|calls| T3
  S4["function:JobsShowNumView::jobsRichViewByModel::for<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:71"]
  T4["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S4 -->|calls| T4
  S5["function:JobsShowNumView::jobsRichViewByModel::for<br/>JobsByPods/JobsOCTools@Pods/Core/JobsShowNumView/JobsShowNumView.m:71"]
  T5["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S5 -->|calls| T5
  S6["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  T6["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  S6 -->|calls| T6
  S7["method:JobsStepView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:54"]
  T7["method:JobsStepView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:54"]
  S7 -->|calls| T7
  S8["method:JobsStepView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:58"]
  T8["method:JobsStepView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:38"]
  S8 -->|calls| T8
  S9["method:JobsStepView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:64"]
  T9["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  S9 -->|calls| T9
  S10["method:JobsStepView::makeButtonModelBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:170"]
  T10["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  S10 -->|calls| T10
  S11["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T11["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S11 -->|calls| T11
  S12["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T12["method:JobsStepView::makeLeftLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:253"]
  S12 -->|calls| T12
  S13["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T13["method:JobsStepView::makeLeftLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:253"]
  S13 -->|calls| T13
  S14["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T14["method:JobsStepView::makeRightLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:237"]
  S14 -->|calls| T14
  S15["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T15["method:JobsStepView::makeRightLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:237"]
  S15 -->|calls| T15
  S16["method:JobsTitleView01::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:37"]
  T16["method:JobsTitleView01::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:37"]
  S16 -->|calls| T16
  S17["method:JobsTitleView01::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:49"]
  T17["method:JobsTitleView01::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:37"]
  S17 -->|calls| T17
  S18["method:JobsTitleView01::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:59"]
  T18["method:JobsTitleView01::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:59"]
  S18 -->|calls| T18
  S19["method:JobsTitleView01::titleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:82"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:JobsToggleBaseView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:35"]
  T20["method:JobsToggleBaseView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:35"]
  S20 -->|calls| T20
  S21["method:JobsToggleBaseView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:51"]
  T21["method:JobsToggleBaseView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:51"]
  S21 -->|calls| T21
  S22["method:JobsToggleBaseView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:58"]
  T22["method:JobsToggleBaseView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:35"]
  S22 -->|calls| T22
  S23["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T23["method:JobsToggleBaseView::makeScrollContentViewsFrameBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:147"]
  S23 -->|calls| T23
  S24["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T24["method:JobsToggleBaseView::refreshScrollContentViews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:115"]
  S24 -->|calls| T24
  S25["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T25["method:JobsToggleBaseView::configBgScroll<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:130"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
