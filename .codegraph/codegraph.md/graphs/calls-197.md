# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T1["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  S1 -->|calls| T1
  S2["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T2["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S2 -->|calls| T2
  S3["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T3["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S3 -->|calls| T3
  S4["method:ASDKNavigationController::popToViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:60"]
  T4["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S4 -->|calls| T4
  S5["method:ASDKNavigationController::popToRootViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:70"]
  T5["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S5 -->|calls| T5
  S6["method:ASDKNavigationController::popToRootViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:70"]
  T6["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S6 -->|calls| T6
  S7["method:ASDKNavigationController::popToRootViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:70"]
  T7["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S7 -->|calls| T7
  S8["method:ASDKNavigationController::setViewControllers:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:80"]
  T8["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S8 -->|calls| T8
  S9["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T9["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S9 -->|calls| T9
  S10["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T10["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S10 -->|calls| T10
  S11["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T11["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  S11 -->|calls| T11
  S12["method:ASDKNavigationController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:88"]
  T12["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S12 -->|calls| T12
  S13["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T13["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S13 -->|calls| T13
  S14["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T14["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  S14 -->|calls| T14
  S15["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  T15["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S15 -->|calls| T15
  S16["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T16["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S16 -->|calls| T16
  S17["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  T17["method:ASDKNavigationController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:30"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T18["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T19["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T21["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T23["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  S23 -->|calls| T23
  S24["method:ASDKViewController::initWithNibName:bundle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:31"]
  T24["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S24 -->|calls| T24
  S25["method:ASDKViewController::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:42"]
  T25["method:ASDKViewController::_initializeInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:78"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
