# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  T1["method:BaseViewController::setBackGround<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:87"]
  S1 -->|calls| T1
  S2["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  T2["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  S2 -->|calls| T2
  S3["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  T3["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  S3 -->|calls| T3
  S4["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T4["method:UIView::resetOrigin<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:290"]
  S4 -->|calls| T4
  S5["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T5["method:UIView::resetSize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:302"]
  S5 -->|calls| T5
  S6["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  T6["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  S6 -->|calls| T6
  S7["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  T7["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  S7 -->|calls| T7
  S8["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  T8["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  S8 -->|calls| T8
  S9["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  T9["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  S9 -->|calls| T9
  S10["method:JobsBaseDataSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:20"]
  T10["method:JobsBaseDataSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:20"]
  S10 -->|calls| T10
  S11["method:JobsBaseDataSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:29"]
  T11["method:JobsBaseDataSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:29"]
  S11 -->|calls| T11
  S12["method:JobsBaseDataSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:37"]
  T12["method:JobsBaseDataSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:37"]
  S12 -->|calls| T12
  S13["method:JobsBaseDataSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:62"]
  T13["method:JobsBaseDataSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:62"]
  S13 -->|calls| T13
  S14["method:JobsBaseDataSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:66"]
  T14["method:JobsBaseDataSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:66"]
  S14 -->|calls| T14
  S15["method:JobsBaseDataSettingVC::willTransitionToTraitCollection:withTransitionCoordinator:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:83"]
  T15["method:JobsBaseDataSettingVC::willTransitionToTraitCollection:withTransitionCoordinator:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:83"]
  S15 -->|calls| T15
  S16["method:JobsBaseDataSettingVC::viewModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:137"]
  T16["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S16 -->|calls| T16
  S17["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  T17["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  S17 -->|calls| T17
  S18["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  T18["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  S18 -->|calls| T18
  S19["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  T19["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  S19 -->|calls| T19
  S20["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  T20["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  S20 -->|calls| T20
  S21["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  T21["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  S21 -->|calls| T21
  S22["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  T22["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  S22 -->|calls| T22
  S23["method:JobsNavSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:19"]
  T23["method:JobsNavSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:19"]
  S23 -->|calls| T23
  S24["method:JobsNavSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:28"]
  T24["method:JobsNavSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:28"]
  S24 -->|calls| T24
  S25["method:JobsNavSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:33"]
  T25["method:JobsNavSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
