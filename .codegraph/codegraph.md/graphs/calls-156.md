# `calls 符号关系 - 156`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T1["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S1 -->|calls| T1
  S2["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T2["method:JobsStepView::makeLeftLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:253"]
  S2 -->|calls| T2
  S3["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T3["method:JobsStepView::makeLeftLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:253"]
  S3 -->|calls| T3
  S4["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T4["method:JobsStepView::makeRightLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:237"]
  S4 -->|calls| T4
  S5["method:JobsStepView::makeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:189"]
  T5["method:JobsStepView::makeRightLabBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsStepView/JobsStepView.m:237"]
  S5 -->|calls| T5
  S6["method:JobsTitleView01::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:37"]
  T6["method:JobsTitleView01::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:37"]
  S6 -->|calls| T6
  S7["method:JobsTitleView01::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:49"]
  T7["method:JobsTitleView01::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:37"]
  S7 -->|calls| T7
  S8["method:JobsTitleView01::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:59"]
  T8["method:JobsTitleView01::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:59"]
  S8 -->|calls| T8
  S9["method:JobsTitleView01::titleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsTitleView01/JobsTitleView01.m:82"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S9 -->|calls| T9
  S10["method:JobsToggleBaseView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:35"]
  T10["method:JobsToggleBaseView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:35"]
  S10 -->|calls| T10
  S11["method:JobsToggleBaseView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:51"]
  T11["method:JobsToggleBaseView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:51"]
  S11 -->|calls| T11
  S12["method:JobsToggleBaseView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:58"]
  T12["method:JobsToggleBaseView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:35"]
  S12 -->|calls| T12
  S13["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T13["method:JobsToggleBaseView::makeScrollContentViewsFrameBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:147"]
  S13 -->|calls| T13
  S14["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T14["method:JobsToggleBaseView::refreshScrollContentViews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:115"]
  S14 -->|calls| T14
  S15["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T15["method:JobsToggleBaseView::configBgScroll<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:130"]
  S15 -->|calls| T15
  S16["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T16["method:JobsToggleBaseView::refreshScrollContentViews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:115"]
  S16 -->|calls| T16
  S17["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T17["method:JobsToggleBaseView::switchViewsBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:92"]
  S17 -->|calls| T17
  S18["method:JobsToggleBaseView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:82"]
  T18["method:JobsToggleBaseView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:76"]
  S18 -->|calls| T18
  S19["method:JobsToggleBaseView::makeTaggedNavViewBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:162"]
  T19["method:JobsToggleBaseView::makeTaggedNavViewSizeBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:102"]
  S19 -->|calls| T19
  S20["method:JobsToggleBaseView::makeTaggedNavViewBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:162"]
  T20["method:JobsToggleBaseView::makeTaggedNavViewSizeBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:102"]
  S20 -->|calls| T20
  S21["method:JobsToggleBaseView::taggedNavView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:211"]
  T21["method:JobsToggleBaseView::makeTaggedNavViewBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:162"]
  S21 -->|calls| T21
  S22["method:JobsToggleBaseView::tempLabs<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:250"]
  T22["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S22 -->|calls| T22
  S23["method:JobsToggleBaseView::taggedNavDatas<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:270"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S23 -->|calls| T23
  S24["method:JobsToggleBaseView::buttonModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:286"]
  T24["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  S24 -->|calls| T24
  S25["method:JobsToggleNavView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:26"]
  T25["method:JobsToggleNavView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
