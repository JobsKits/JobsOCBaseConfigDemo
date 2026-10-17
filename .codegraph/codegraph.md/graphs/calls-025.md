# `calls 符号关系 - 025`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::resetByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:519"]
  T1["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:407"]
  S1 -->|calls| T1
  S2["method:UIButton::resetByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:519"]
  T2["method:UIButton::jobsResetBtnSubTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:416"]
  S2 -->|calls| T2
  S3["method:UIButton::resetByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:519"]
  T3["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:425"]
  S3 -->|calls| T3
  S4["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T4["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S4 -->|calls| T4
  S5["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T5["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:449"]
  S5 -->|calls| T5
  S6["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T6["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:437"]
  S6 -->|calls| T6
  S7["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T7["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:528"]
  S7 -->|calls| T7
  S8["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T8["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S8 -->|calls| T8
  S9["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T9["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S9 -->|calls| T9
  S10["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T10["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S10 -->|calls| T10
  S11["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T11["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:528"]
  S11 -->|calls| T11
  S12["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T12["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:407"]
  S12 -->|calls| T12
  S13["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T13["method:UIButton::jobsResetBtnSubTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:416"]
  S13 -->|calls| T13
  S14["method:UIButton::resetByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:548"]
  T14["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:425"]
  S14 -->|calls| T14
  S15["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T15["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S15 -->|calls| T15
  S16["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T16["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S16 -->|calls| T16
  S17["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T17["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S17 -->|calls| T17
  S18["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T18["method:JobsOCCalendar::byScrollEnabled<br/>JobsByPods/JobsOCCalendar@Pods/Core/JobsOCCalendar/JobsOCCalendar.m:99"]
  S18 -->|calls| T18
  S19["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T19["method:UITextView::byDataDetectorTypes<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:64"]
  S19 -->|calls| T19
  S20["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T20["method:UITextView::bySelectable<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:55"]
  S20 -->|calls| T20
  S21["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T21["method:UITextView::byEditable<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:118"]
  S21 -->|calls| T21
  S22["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T22["method:UITextView::byTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:33"]
  S22 -->|calls| T22
  S23["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T23["method:UITextView::byDelegate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:73"]
  S23 -->|calls| T23
  S24["method:UIButton::textView:primaryActionForTextItem:defaultAction:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:36"]
  T24["method:UITextItem::byTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextItem/UITextItem+Extra/UITextItem+Extra.m:23"]
  S24 -->|calls| T24
  S25["method:UIButton::textView:primaryActionForTextItem:defaultAction:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:36"]
  T25["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
