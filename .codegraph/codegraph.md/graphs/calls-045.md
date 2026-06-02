# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  T1["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  S1 -->|calls| T1
  S2["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  T2["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  S2 -->|calls| T2
  S3["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  T3["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  S3 -->|calls| T3
  S4["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  T4["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  S4 -->|calls| T4
  S5["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  T5["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  S5 -->|calls| T5
  S6["method:JobsBaseWebVC::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:26"]
  T6["method:JobsBaseWebVC::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:26"]
  S6 -->|calls| T6
  S7["method:JobsBaseWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:32"]
  T7["method:JobsBaseWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:32"]
  S7 -->|calls| T7
  S8["method:JobsBaseWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:32"]
  T8["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S8 -->|calls| T8
  S9["method:JobsBaseWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:32"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:JobsBaseWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:60"]
  T10["method:JobsBaseWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:60"]
  S10 -->|calls| T10
  S11["method:JobsBaseWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:60"]
  T11["method:JobsNavSettingVC::makeNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:142"]
  S11 -->|calls| T11
  S12["method:JobsBaseWebVC::initByWebView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:86"]
  T12["method:WKWebView::loadRequest<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:JobsBaseWebVC::activityIndicatorView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsBaseWebVC/JobsBaseWebVC.m:138"]
  T13["method:UIActivityIndicatorView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIActivityIndicatorView/UIActivityIndicatorView+Extra/UIActivityIndicatorView+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:JobsNavBarWebVC::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:27"]
  T14["method:JobsNavBarWebVC::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:27"]
  S14 -->|calls| T14
  S15["method:JobsNavBarWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:33"]
  T15["method:JobsNavBarWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:33"]
  S15 -->|calls| T15
  S16["method:JobsNavBarWebVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:33"]
  T16["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S16 -->|calls| T16
  S17["method:JobsNavBarWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:62"]
  T17["method:JobsNavBarWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:62"]
  S17 -->|calls| T17
  S18["method:JobsNavBarWebVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:62"]
  T18["method:JobsNavSettingVC::makeGKNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:155"]
  S18 -->|calls| T18
  S19["method:JobsNavBarWebVC::initByWebView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebVC/JobsNavBarWebVC/JobsNavBarWebVC.m:85"]
  T19["method:WKWebView::loadRequest<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:18"]
  S19 -->|calls| T19
  S20["method:JobsWebViewController::dealloc<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:30"]
  T20["method:NSNotificationCenter::remove<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNotificationCenter/NSNotificationCenter+JobsBlock/NSNotificationCenter+JobsBlock.m:12"]
  S20 -->|calls| T20
  S21["method:JobsWebViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:35"]
  T21["method:JobsWebViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:35"]
  S21 -->|calls| T21
  S22["method:JobsWebViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:46"]
  T22["method:JobsWebViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:46"]
  S22 -->|calls| T22
  S23["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  T23["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  S23 -->|calls| T23
  S24["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  T24["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  S24 -->|calls| T24
  S25["method:BaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:33"]
  T25["method:BaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
