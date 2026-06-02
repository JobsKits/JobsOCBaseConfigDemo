# `calls 符号关系 - 044`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  T1["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  S1 -->|calls| T1
  S2["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  T2["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  S2 -->|calls| T2
  S3["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  T3["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  S3 -->|calls| T3
  S4["method:JobsBaseDataSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:20"]
  T4["method:JobsBaseDataSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:20"]
  S4 -->|calls| T4
  S5["method:JobsBaseDataSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:29"]
  T5["method:JobsBaseDataSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:29"]
  S5 -->|calls| T5
  S6["method:JobsBaseDataSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:37"]
  T6["method:JobsBaseDataSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:37"]
  S6 -->|calls| T6
  S7["method:JobsBaseDataSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:62"]
  T7["method:JobsBaseDataSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:62"]
  S7 -->|calls| T7
  S8["method:JobsBaseDataSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:66"]
  T8["method:JobsBaseDataSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:66"]
  S8 -->|calls| T8
  S9["method:JobsBaseDataSettingVC::willTransitionToTraitCollection:withTransitionCoordinator:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:83"]
  T9["method:JobsBaseDataSettingVC::willTransitionToTraitCollection:withTransitionCoordinator:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:83"]
  S9 -->|calls| T9
  S10["method:JobsBaseDataSettingVC::viewModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:137"]
  T10["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S10 -->|calls| T10
  S11["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  T11["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  S11 -->|calls| T11
  S12["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  T12["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  S12 -->|calls| T12
  S13["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  T13["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  S13 -->|calls| T13
  S14["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  T14["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  S14 -->|calls| T14
  S15["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  T15["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  S15 -->|calls| T15
  S16["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  T16["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  S16 -->|calls| T16
  S17["method:JobsNavSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:19"]
  T17["method:JobsNavSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:19"]
  S17 -->|calls| T17
  S18["method:JobsNavSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:28"]
  T18["method:JobsNavSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:28"]
  S18 -->|calls| T18
  S19["method:JobsNavSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:33"]
  T19["method:JobsNavSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:33"]
  S19 -->|calls| T19
  S20["method:JobsNavSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:94"]
  T20["method:JobsNavSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:94"]
  S20 -->|calls| T20
  S21["method:JobsNavSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:98"]
  T21["method:JobsNavSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:98"]
  S21 -->|calls| T21
  S22["method:JobsNavSettingVC::makeNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:142"]
  T22["method:JobsNavSettingVC::makeJobsNavByAlpha<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:132"]
  S22 -->|calls| T22
  S23["method:JobsNavSettingVC::makeNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:142"]
  T23["method:JobsNavSettingVC::makeGKNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:155"]
  S23 -->|calls| T23
  S24["method:JobsNavSettingVC::makeGKNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:155"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsNavSettingVC::makeGKNavByConfig<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsNavSettingVC/JobsNavSettingVC.m:155"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
