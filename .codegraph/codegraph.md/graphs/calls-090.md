# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T1["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S1 -->|calls| T1
  S2["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T2["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  S2 -->|calls| T2
  S3["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T3["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S3 -->|calls| T3
  S4["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T4["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S4 -->|calls| T4
  S5["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T5["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  S5 -->|calls| T5
  S6["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T6["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S6 -->|calls| T6
  S7["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T7["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S7 -->|calls| T7
  S8["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T8["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T9["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T10["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T11["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T13["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T14["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S14 -->|calls| T14
  S15["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T15["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S15 -->|calls| T15
  S16["method:ASDKViewController::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:42"]
  T16["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S16 -->|calls| T16
  S17["method:ASDKViewController::initWithNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:55"]
  T17["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S17 -->|calls| T17
  S18["method:ASDKViewController::initWithNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:55"]
  T18["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S18 -->|calls| T18
  S19["method:ASDKViewController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:67"]
  T19["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S19 -->|calls| T19
  S20["method:ASDKViewController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:67"]
  T20["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S20 -->|calls| T20
  S21["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  T21["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S21 -->|calls| T21
  S22["method:ASDKViewController::loadView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:108"]
  T22["method:ASDKViewController::loadView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:108"]
  S22 -->|calls| T22
  S23["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  T23["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  S23 -->|calls| T23
  S24["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  T24["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  S24 -->|calls| T24
  S25["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  T25["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
