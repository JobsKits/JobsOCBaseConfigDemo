# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DoubanNormalViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:60"]
  T1["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S1 -->|calls| T1
  S2["method:DoubanNormalViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:60"]
  T2["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S2 -->|calls| T2
  S3["method:GradientButtonViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:24"]
  T3["method:GradientButtonViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:24"]
  S3 -->|calls| T3
  S4["method:GradientButtonViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:24"]
  T4["method:GradientButtonViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:45"]
  S4 -->|calls| T4
  S5["method:GradientButtonViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:37"]
  T5["method:GradientButtonViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:45"]
  S5 -->|calls| T5
  S6["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T6["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  S6 -->|calls| T6
  S7["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T7["method:PenerateViewExampleController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:72"]
  S7 -->|calls| T7
  S8["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T8["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S8 -->|calls| T8
  S9["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T9["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S9 -->|calls| T9
  S10["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T10["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S10 -->|calls| T10
  S11["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T11["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S11 -->|calls| T11
  S12["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T12["method:PenerateViewExampleController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:53"]
  S12 -->|calls| T12
  S13["method:PenerateViewExampleController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:63"]
  T13["method:PenerateViewExampleController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:53"]
  S13 -->|calls| T13
  S14["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T14["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  S14 -->|calls| T14
  S15["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T15["method:ViewExampleViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:71"]
  S15 -->|calls| T15
  S16["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T16["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S16 -->|calls| T16
  S17["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T17["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S17 -->|calls| T17
  S18["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T18["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S18 -->|calls| T18
  S19["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T19["method:TABComponentManager::create<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:144"]
  S19 -->|calls| T19
  S20["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T20["method:ViewExampleViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:50"]
  S20 -->|calls| T20
  S21["method:ViewExampleViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:62"]
  T21["method:ViewExampleViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:50"]
  S21 -->|calls| T21
  S22["method:TestHeadView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:26"]
  T22["method:TestHeadView::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:72"]
  S22 -->|calls| T22
  S23["method:TestHeadView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:34"]
  T23["method:TestHeadView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:34"]
  S23 -->|calls| T23
  S24["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  T24["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  S24 -->|calls| T24
  S25["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  T25["method:BaseOptionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:78"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
