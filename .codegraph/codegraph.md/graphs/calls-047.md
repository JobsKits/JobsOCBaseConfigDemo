# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T1["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S1 -->|calls| T1
  S2["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T2["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S2 -->|calls| T2
  S3["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T3["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S3 -->|calls| T3
  S4["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T4["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S4 -->|calls| T4
  S5["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T5["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S5 -->|calls| T5
  S6["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T6["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S6 -->|calls| T6
  S7["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:150"]
  T7["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S7 -->|calls| T7
  S8["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:150"]
  T8["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S8 -->|calls| T8
  S9["method:JobsLinkageMenuView::setTextSize:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:158"]
  T9["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S9 -->|calls| T9
  S10["method:JobsLinkageMenuView::lineView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:166"]
  T10["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S10 -->|calls| T10
  S11["method:JobsLinkageMenuView::rightview<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:178"]
  T11["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T12["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T13["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S13 -->|calls| T13
  S14["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T14["function:jobs3TO<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:17"]
  S14 -->|calls| T14
  S15["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T17["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S17 -->|calls| T17
  S18["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T18["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S18 -->|calls| T18
  S19["method:JobsLinkageMenuView::MENU_WIDTH<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:268"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsLinkageMenuView::BOTTOMVIEW_HEIGHT<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:274"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:JobsLinkageMenuView::BOTTOMVIEW_WIDTH<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:280"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsLinkageMenuView::LINEVIEW_WIDTH<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:286"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  T23["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  S23 -->|calls| T23
  S24["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:39"]
  T24["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:39"]
  S24 -->|calls| T24
  S25["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:39"]
  T25["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
