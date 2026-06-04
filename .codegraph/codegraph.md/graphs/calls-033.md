# `calls 符号关系 - 033`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:58"]
  T1["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:58"]
  S1 -->|calls| T1
  S2["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  T2["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  S2 -->|calls| T2
  S3["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  T3["method:BaseTextView::adjustContentOffset<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:118"]
  S3 -->|calls| T3
  S4["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:81"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:81"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:122"]
  T6["method:UITextView::switchs<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  S6 -->|calls| T6
  S7["method:BaseViewController::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:22"]
  T7["method:BaseViewController::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:22"]
  S7 -->|calls| T7
  S8["method:BaseViewController::initWithNibName:bundle:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:28"]
  T8["method:BaseViewController::initWithNibName:bundle:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:28"]
  S8 -->|calls| T8
  S9["method:BaseViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:36"]
  T9["method:BaseViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:36"]
  S9 -->|calls| T9
  S10["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  T10["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  S10 -->|calls| T10
  S11["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  T11["method:BaseViewController::setBackGround<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:87"]
  S11 -->|calls| T11
  S12["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  T12["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  S12 -->|calls| T12
  S13["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  T13["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  S13 -->|calls| T13
  S14["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T14["method:UIView::resetOrigin<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:290"]
  S14 -->|calls| T14
  S15["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T15["method:UIView::resetSize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:302"]
  S15 -->|calls| T15
  S16["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  T16["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  S16 -->|calls| T16
  S17["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  T17["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  S17 -->|calls| T17
  S18["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  T18["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  S18 -->|calls| T18
  S19["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  T19["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  S19 -->|calls| T19
  S20["method:JobsBaseDataSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:20"]
  T20["method:JobsBaseDataSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:20"]
  S20 -->|calls| T20
  S21["method:JobsBaseDataSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:29"]
  T21["method:JobsBaseDataSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:29"]
  S21 -->|calls| T21
  S22["method:JobsBaseDataSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:37"]
  T22["method:JobsBaseDataSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:37"]
  S22 -->|calls| T22
  S23["method:JobsBaseDataSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:62"]
  T23["method:JobsBaseDataSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:62"]
  S23 -->|calls| T23
  S24["method:JobsBaseDataSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:66"]
  T24["method:JobsBaseDataSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:66"]
  S24 -->|calls| T24
  S25["method:JobsBaseDataSettingVC::willTransitionToTraitCollection:withTransitionCoordinator:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:83"]
  T25["method:JobsBaseDataSettingVC::willTransitionToTraitCollection:withTransitionCoordinator:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsBaseDataSettingVC/JobsBaseDataSettingVC.m:83"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
