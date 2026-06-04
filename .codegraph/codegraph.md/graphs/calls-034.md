# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  T1["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  S1 -->|calls| T1
  S2["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  T2["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  S2 -->|calls| T2
  S3["method:BaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:33"]
  T3["method:BaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:33"]
  S3 -->|calls| T3
  S4["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  T4["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  S4 -->|calls| T4
  S5["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  T5["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S5 -->|calls| T5
  S6["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:65"]
  T6["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:65"]
  S6 -->|calls| T6
  S7["method:BaseTableViewHeaderFooterView::initWithReuseIdentifier:<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:20"]
  T7["method:UIView::initByFrame<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T8["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  S8 -->|calls| T8
  S9["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:JobsLinkageMenuView::initWithFrame:btnConfig:linkageMenuViewConfig:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:43"]
  T10["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  S10 -->|calls| T10
  S11["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T11["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S11 -->|calls| T11
  S12["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T12["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S12 -->|calls| T12
  S13["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T13["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S13 -->|calls| T13
  S14["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T14["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S14 -->|calls| T14
  S15["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T15["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S15 -->|calls| T15
  S16["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T16["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S16 -->|calls| T16
  S17["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T17["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S17 -->|calls| T17
  S18["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T18["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S18 -->|calls| T18
  S19["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:150"]
  T19["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S19 -->|calls| T19
  S20["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:150"]
  T20["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S20 -->|calls| T20
  S21["method:JobsLinkageMenuView::setTextSize:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:158"]
  T21["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S21 -->|calls| T21
  S22["method:JobsLinkageMenuView::lineView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:166"]
  T22["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:JobsLinkageMenuView::rightview<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:178"]
  T23["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S23 -->|calls| T23
  S24["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T24["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S24 -->|calls| T24
  S25["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T25["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
