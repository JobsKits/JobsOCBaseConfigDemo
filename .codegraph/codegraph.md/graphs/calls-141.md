# `calls 符号关系 - 141`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMenuSubView_1::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:35"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:JobsMenuSubView_1::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:42"]
  T2["method:JobsMenuSubView_1::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@1/JobsMenuSubView@1.m:19"]
  S2 -->|calls| T2
  S3["method:JobsMenuSubView_2::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:19"]
  T3["method:JobsMenuSubView_2::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:19"]
  S3 -->|calls| T3
  S4["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  T4["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  S4 -->|calls| T4
  S5["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  T5["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S5 -->|calls| T5
  S6["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsMenuSubView_2::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:35"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:JobsMenuSubView_2::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:42"]
  T8["method:JobsMenuSubView_2::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@2/JobsMenuSubView@2.m:19"]
  S8 -->|calls| T8
  S9["method:JobsMenuSubView_3::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:19"]
  T9["method:JobsMenuSubView_3::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:19"]
  S9 -->|calls| T9
  S10["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  T10["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  S10 -->|calls| T10
  S11["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  T11["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S11 -->|calls| T11
  S12["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsMenuSubView_3::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:35"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:JobsMenuSubView_3::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:42"]
  T14["method:JobsMenuSubView_3::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@3/JobsMenuSubView@3.m:19"]
  S14 -->|calls| T14
  S15["method:JobsMenuSubView_4::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:19"]
  T15["method:JobsMenuSubView_4::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:19"]
  S15 -->|calls| T15
  S16["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  T16["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  S16 -->|calls| T16
  S17["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  T17["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S17 -->|calls| T17
  S18["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:JobsMenuSubView_4::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:35"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsMenuSubView_4::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:42"]
  T20["method:JobsMenuSubView_4::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuSubViews/JobsMenuSubView@4/JobsMenuSubView@4.m:19"]
  S20 -->|calls| T20
  S21["method:JobsMenuView::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:23"]
  T21["method:JobsMenuView::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:23"]
  S21 -->|calls| T21
  S22["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:39"]
  T22["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:39"]
  S22 -->|calls| T22
  S23["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:39"]
  T23["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsMenuView@Pods/Support/UIKit/UIView+Extra/UIView+Extra.m:13"]
  S23 -->|calls| T23
  S24["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:39"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:39"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
