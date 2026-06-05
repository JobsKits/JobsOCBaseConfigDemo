# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  T1["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:122"]
  S1 -->|calls| T1
  S2["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:58"]
  T2["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:58"]
  S2 -->|calls| T2
  S3["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  T3["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  S3 -->|calls| T3
  S4["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  T4["method:BaseTextView::adjustContentOffset<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:118"]
  S4 -->|calls| T4
  S5["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:81"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:81"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:122"]
  T7["method:UITextView::switchs<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  S7 -->|calls| T7
  S8["method:BaseViewController::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:22"]
  T8["method:BaseViewController::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:22"]
  S8 -->|calls| T8
  S9["method:BaseViewController::initWithNibName:bundle:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:28"]
  T9["method:BaseViewController::initWithNibName:bundle:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:28"]
  S9 -->|calls| T9
  S10["method:BaseViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:36"]
  T10["method:BaseViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:36"]
  S10 -->|calls| T10
  S11["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  T11["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  S11 -->|calls| T11
  S12["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:41"]
  T12["method:BaseViewController::setBackGround<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:87"]
  S12 -->|calls| T12
  S13["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  T13["method:BaseViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:77"]
  S13 -->|calls| T13
  S14["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  T14["method:BaseViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:81"]
  S14 -->|calls| T14
  S15["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T15["method:UIView::resetOrigin<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:290"]
  S15 -->|calls| T15
  S16["method:BaseViewController::bgImageView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:116"]
  T16["method:UIView::resetSize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:302"]
  S16 -->|calls| T16
  S17["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  T17["method:CheckMemFreeVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:22"]
  S17 -->|calls| T17
  S18["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  T18["method:CheckMemFreeVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:26"]
  S18 -->|calls| T18
  S19["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  T19["method:CheckMemFreeVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:53"]
  S19 -->|calls| T19
  S20["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  T20["method:CheckMemFreeVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/DebugBaseVC/CheckMemFreeVC/CheckMemFreeVC.m:58"]
  S20 -->|calls| T20
  S21["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  T21["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  S21 -->|calls| T21
  S22["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  T22["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  S22 -->|calls| T22
  S23["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  T23["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  S23 -->|calls| T23
  S24["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  T24["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  S24 -->|calls| T24
  S25["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  T25["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
