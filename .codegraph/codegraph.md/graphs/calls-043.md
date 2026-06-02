# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:66"]
  T1["method:JobsTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:66"]
  S1 -->|calls| T1
  S2["method:JobsTextView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:73"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:JobsTextView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:73"]
  T3["method:JobsTextView::updateWordCount<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:90"]
  S3 -->|calls| T3
  S4["method:JobsTextView::updateWordCount<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:90"]
  T4["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S4 -->|calls| T4
  S5["method:JobsTextView::updateWordCount<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:90"]
  T5["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S5 -->|calls| T5
  S6["method:JobsTextView::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:103"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsTextView::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:103"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:JobsTextView::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:103"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:JobsTextView::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:103"]
  T9["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S9 -->|calls| T9
  S10["method:JobsTextView::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:103"]
  T10["method:JobsTextView::updateWordCount<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:90"]
  S10 -->|calls| T10
  S11["method:JobsTextView::countLabel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:139"]
  T11["method:UILabel::byTextCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:12"]
  S11 -->|calls| T11
  S12["method:JobsTextView::countLabel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:139"]
  T12["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S12 -->|calls| T12
  S13["method:JobsTextView::countLabel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:139"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:JobsTextView::countLabel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:139"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsTextView::countLabel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:139"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:BaseViewController::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:22"]
  T16["method:BaseViewController::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:22"]
  S16 -->|calls| T16
  S17["method:BaseViewController::initWithNibName:bundle:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:28"]
  T17["method:BaseViewController::initWithNibName:bundle:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:28"]
  S17 -->|calls| T17
  S18["method:BaseViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:36"]
  T18["method:BaseViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:36"]
  S18 -->|calls| T18
  S19["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  T19["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  S19 -->|calls| T19
  S20["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  T20["method:BaseViewController::setBackGround<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:87"]
  S20 -->|calls| T20
  S21["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  T21["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  S21 -->|calls| T21
  S22["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  T22["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  S22 -->|calls| T22
  S23["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T23["method:UIView::resetOrigin<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:290"]
  S23 -->|calls| T23
  S24["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T24["method:UIView::resetSize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:302"]
  S24 -->|calls| T24
  S25["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  T25["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
