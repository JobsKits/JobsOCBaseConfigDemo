# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBaseWebVC::activityIndicatorView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:138"]
  T1["method:UIActivityIndicatorView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIActivityIndicatorView/UIActivityIndicatorView+Extra/UIActivityIndicatorView+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:JobsNavBarWebVC::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:27"]
  T2["method:JobsNavBarWebVC::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:27"]
  S2 -->|calls| T2
  S3["method:JobsNavBarWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:33"]
  T3["method:JobsNavBarWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:33"]
  S3 -->|calls| T3
  S4["method:JobsNavBarWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:33"]
  T4["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S4 -->|calls| T4
  S5["method:JobsNavBarWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:62"]
  T5["method:JobsNavBarWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:62"]
  S5 -->|calls| T5
  S6["method:JobsNavBarWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:62"]
  T6["method:JobsNavSettingVC::makeGKNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:155"]
  S6 -->|calls| T6
  S7["method:JobsNavBarWebVC::initByWebView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:85"]
  T7["method:WKWebView::loadRequest<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:JobsWebViewController::dealloc<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:30"]
  T8["method:NSNotificationCenter::remove<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNotificationCenter/NSNotificationCenter+JobsBlock/NSNotificationCenter+JobsBlock.m:12"]
  S8 -->|calls| T8
  S9["method:JobsWebViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:35"]
  T9["method:JobsWebViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:35"]
  S9 -->|calls| T9
  S10["method:JobsWebViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:46"]
  T10["method:JobsWebViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:46"]
  S10 -->|calls| T10
  S11["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  T11["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  S11 -->|calls| T11
  S12["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  T12["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  S12 -->|calls| T12
  S13["method:BaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:33"]
  T13["method:BaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:33"]
  S13 -->|calls| T13
  S14["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  T14["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  S14 -->|calls| T14
  S15["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  T15["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S15 -->|calls| T15
  S16["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:65"]
  T16["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:65"]
  S16 -->|calls| T16
  S17["method:BaseTableViewHeaderFooterView::initWithReuseIdentifier:<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:20"]
  T17["method:UIView::initByFrame<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T18["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  S18 -->|calls| T18
  S19["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T20["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S20 -->|calls| T20
  S21["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T21["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S21 -->|calls| T21
  S22["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T22["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S22 -->|calls| T22
  S23["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T23["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S23 -->|calls| T23
  S24["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T24["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S24 -->|calls| T24
  S25["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T25["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:493"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
