# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DoubanNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:29"]
  T1["method:DoubanNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:29"]
  S1 -->|calls| T1
  S2["method:DoubanNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:29"]
  T2["method:DoubanNormalViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:60"]
  S2 -->|calls| T2
  S3["method:DoubanNormalViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:51"]
  T3["method:DoubanNormalViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:38"]
  S3 -->|calls| T3
  S4["method:DoubanNormalViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:60"]
  T4["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S4 -->|calls| T4
  S5["method:DoubanNormalViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:60"]
  T5["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S5 -->|calls| T5
  S6["method:DoubanNormalViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/DoubanNormalViewController.m:60"]
  T6["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S6 -->|calls| T6
  S7["method:GradientButtonViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:24"]
  T7["method:GradientButtonViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:24"]
  S7 -->|calls| T7
  S8["method:GradientButtonViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:24"]
  T8["method:GradientButtonViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:45"]
  S8 -->|calls| T8
  S9["method:GradientButtonViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:37"]
  T9["method:GradientButtonViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/GradientButtonViewController.m:45"]
  S9 -->|calls| T9
  S10["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T10["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  S10 -->|calls| T10
  S11["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T11["method:PenerateViewExampleController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:72"]
  S11 -->|calls| T11
  S12["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T12["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S12 -->|calls| T12
  S13["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T13["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S13 -->|calls| T13
  S14["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T14["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S14 -->|calls| T14
  S15["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T15["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S15 -->|calls| T15
  S16["method:PenerateViewExampleController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:29"]
  T16["method:PenerateViewExampleController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:53"]
  S16 -->|calls| T16
  S17["method:PenerateViewExampleController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:63"]
  T17["method:PenerateViewExampleController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/PenerateViewExampleController.m:53"]
  S17 -->|calls| T17
  S18["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T18["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  S18 -->|calls| T18
  S19["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T19["method:ViewExampleViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:71"]
  S19 -->|calls| T19
  S20["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T20["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S20 -->|calls| T20
  S21["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T21["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S21 -->|calls| T21
  S22["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T22["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S22 -->|calls| T22
  S23["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T23["method:TABComponentManager::create<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:144"]
  S23 -->|calls| T23
  S24["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T24["method:ViewExampleViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:50"]
  S24 -->|calls| T24
  S25["method:ViewExampleViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:62"]
  T25["method:ViewExampleViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:50"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
