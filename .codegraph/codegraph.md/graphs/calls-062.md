# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TestLayoutDelegateTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:29"]
  T1["method:TestLayoutDelegateTableViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:108"]
  S1 -->|calls| T1
  S2["method:TestLayoutDelegateTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:115"]
  T2["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S2 -->|calls| T2
  S3["method:TestLayoutDelegateTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:115"]
  T3["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S3 -->|calls| T3
  S4["method:TestLayoutDelegateTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:115"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:XibTestViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:27"]
  T5["method:XibTestViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:27"]
  S5 -->|calls| T5
  S6["method:XibTestViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:27"]
  T6["method:XibTestViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:100"]
  S6 -->|calls| T6
  S7["method:XibTestViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:27"]
  T7["method:XibTestViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:43"]
  S7 -->|calls| T7
  S8["method:XibTestViewController::tableView:cellForRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:77"]
  T8["method:XIBTableViewCell::updateCell<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/View/XIBTableViewCell.m:29"]
  S8 -->|calls| T8
  S9["method:XibTestViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:106"]
  T9["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S9 -->|calls| T9
  S10["method:XibTestViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:106"]
  T10["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S10 -->|calls| T10
  S11["method:XibTestViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:106"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:XibTestViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:106"]
  T12["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S12 -->|calls| T12
  S13["method:XibTestViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:106"]
  T13["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S13 -->|calls| T13
  S14["method:XibTestViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/Controller/XibTestViewController.m:106"]
  T14["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S14 -->|calls| T14
  S15["method:XIBTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/View/XIBTableViewCell.m:24"]
  T15["method:XIBTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/View/XIBTableViewCell.m:24"]
  S15 -->|calls| T15
  S16["method:XIBTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/View/XIBTableViewCell.m:33"]
  T16["method:XIBTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UseXib/View/XIBTableViewCell.m:33"]
  S16 -->|calls| T16
  S17["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:28"]
  T17["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:28"]
  S17 -->|calls| T17
  S18["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:28"]
  T18["method:TableDynamicSectionViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:107"]
  S18 -->|calls| T18
  S19["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:28"]
  T19["method:TableDynamicSectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:115"]
  S19 -->|calls| T19
  S20["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:28"]
  T20["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:56"]
  S20 -->|calls| T20
  S21["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:121"]
  T21["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S21 -->|calls| T21
  S22["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:121"]
  T22["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S22 -->|calls| T22
  S23["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:121"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableDynamicSectionViewController.m:121"]
  T24["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S24 -->|calls| T24
  S25["method:TableNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:31"]
  T25["method:TableNormalViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/Controller/TableNormalViewController.m:31"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
