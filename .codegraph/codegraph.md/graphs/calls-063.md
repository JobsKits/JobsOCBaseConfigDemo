# `calls 符号关系 - 063`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TableNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:31"]
  T1["method:TableNormalViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:122"]
  S1 -->|calls| T1
  S2["method:TableNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:31"]
  T2["method:TableNormalViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:130"]
  S2 -->|calls| T2
  S3["method:TableNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:31"]
  T3["method:TableNormalViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:64"]
  S3 -->|calls| T3
  S4["method:TableNormalViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:136"]
  T4["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S4 -->|calls| T4
  S5["method:TableNormalViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:136"]
  T5["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S5 -->|calls| T5
  S6["method:TableNormalViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:136"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:TableNormalViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:136"]
  T7["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S7 -->|calls| T7
  S8["method:TableNormalViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:136"]
  T8["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S8 -->|calls| T8
  S9["method:TableNormalViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:136"]
  T9["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S9 -->|calls| T9
  S10["method:TableRowModeViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:26"]
  T10["method:TableRowModeViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:26"]
  S10 -->|calls| T10
  S11["method:TableRowModeViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:26"]
  T11["method:TableRowModeViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:96"]
  S11 -->|calls| T11
  S12["method:TableRowModeViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:26"]
  T12["method:TableRowModeViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:42"]
  S12 -->|calls| T12
  S13["method:TableRowModeViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:102"]
  T13["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S13 -->|calls| T13
  S14["method:TableRowModeViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:102"]
  T14["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S14 -->|calls| T14
  S15["method:TableRowModeViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableRowModeViewController.m:102"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:TableSectionsViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:25"]
  T16["method:TableSectionsViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:25"]
  S16 -->|calls| T16
  S17["method:TableSectionsViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:25"]
  T17["method:TableSectionsViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:116"]
  S17 -->|calls| T17
  S18["method:TableSectionsViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:25"]
  T18["method:TableSectionsViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:124"]
  S18 -->|calls| T18
  S19["method:TableSectionsViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:129"]
  T19["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S19 -->|calls| T19
  S20["method:TableSectionsViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:129"]
  T20["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S20 -->|calls| T20
  S21["method:TableSectionsViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:129"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:TableSectionsViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:129"]
  T22["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S22 -->|calls| T22
  S23["method:TableSectionsViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:129"]
  T23["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S23 -->|calls| T23
  S24["method:TableSectionsViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableSectionsViewController.m:129"]
  T24["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S24 -->|calls| T24
  S25["method:TestTableHeaderFooterView::initWithReuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableHeaderFooterView/TestTableHeaderFooterView.m:26"]
  T25["method:TestTableHeaderFooterView::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableHeaderFooterView/TestTableHeaderFooterView.m:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
