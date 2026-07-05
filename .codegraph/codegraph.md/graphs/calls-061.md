# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T1["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S1 -->|calls| T1
  S2["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T2["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S2 -->|calls| T2
  S3["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T3["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S3 -->|calls| T3
  S4["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T4["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S4 -->|calls| T4
  S5["method:DeleagteSelfTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:25"]
  T5["method:DeleagteSelfTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:25"]
  S5 -->|calls| T5
  S6["method:DeleagteSelfTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:25"]
  T6["method:DeleagteSelfTableViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:63"]
  S6 -->|calls| T6
  S7["method:DeleagteSelfTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:25"]
  T7["method:DeleagteSelfTableViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:40"]
  S7 -->|calls| T7
  S8["method:DeleagteSelfTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:69"]
  T8["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S8 -->|calls| T8
  S9["method:DeleagteSelfTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:69"]
  T9["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S9 -->|calls| T9
  S10["method:DeleagteSelfTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:69"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:DeleagteSelfTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:69"]
  T11["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S11 -->|calls| T11
  S12["method:DeleagteSelfTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:69"]
  T12["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S12 -->|calls| T12
  S13["method:DeleagteSelfTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/Controller/DeleagteSelfTableViewController.m:69"]
  T13["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S13 -->|calls| T13
  S14["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:12"]
  T14["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:12"]
  S14 -->|calls| T14
  S15["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:17"]
  T15["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:17"]
  S15 -->|calls| T15
  S16["method:BaseTableViewCell::cellFromTableView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:25"]
  T16["method:BaseTableViewCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:50"]
  S16 -->|calls| T16
  S17["method:BaseTableViewCell::cellFromTableView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:25"]
  T17["method:BaseTableViewCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:50"]
  S17 -->|calls| T17
  S18["method:BaseTableViewCell::cellHeightNumber<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:46"]
  T18["method:BaseTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:42"]
  S18 -->|calls| T18
  S19["method:BaseTableViewCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:50"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["method:BaseTableViewCell::cellIdentifierWithIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:54"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:BaseTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:58"]
  T21["method:BaseTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/BaseTableViewCell.m:58"]
  S21 -->|calls| T21
  S22["method:DelegateSelfTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/DelegateSelfTableViewCell.m:12"]
  T22["method:DelegateSelfTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/DelegateSelfTableViewCell.m:12"]
  S22 -->|calls| T22
  S23["method:DelegateSelfTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/DelegateSelfTableViewCell.m:17"]
  T23["method:DelegateSelfTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/DelegateSelf/View/DelegateSelfTableViewCell.m:17"]
  S23 -->|calls| T23
  S24["method:TestLayoutDelegateTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:29"]
  T24["method:TestLayoutDelegateTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:29"]
  S24 -->|calls| T24
  S25["method:TestLayoutDelegateTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:29"]
  T25["method:TestLayoutDelegateTableViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/EstimatedHeight/Controller/TestLayoutDelegateTableViewController.m:100"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
