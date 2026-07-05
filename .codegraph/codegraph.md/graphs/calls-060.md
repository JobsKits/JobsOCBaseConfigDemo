# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MutiSectionMutiCellTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionMutiCellTableViewController.m:162"]
  T1["method:LawyerTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/LawyerTableViewCell.m:36"]
  S1 -->|calls| T1
  S2["method:MutiSectionMutiCellTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionMutiCellTableViewController.m:162"]
  T2["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S2 -->|calls| T2
  S3["method:MutiSectionMutiCellTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionMutiCellTableViewController.m:162"]
  T3["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S3 -->|calls| T3
  S4["method:MutiSectionMutiCellTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionMutiCellTableViewController.m:162"]
  T4["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S4 -->|calls| T4
  S5["method:MutiSectionMutiCellTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionMutiCellTableViewController.m:162"]
  T5["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S5 -->|calls| T5
  S6["method:MutiSectionMutiCellTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionMutiCellTableViewController.m:162"]
  T6["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S6 -->|calls| T6
  S7["method:MutiSectionsMutiCellWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:29"]
  T7["method:MutiSectionsMutiCellWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:29"]
  S7 -->|calls| T7
  S8["method:MutiSectionsMutiCellWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:29"]
  T8["method:MutiSectionsMutiCellWithHeaderViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:156"]
  S8 -->|calls| T8
  S9["method:MutiSectionsMutiCellWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:29"]
  T9["method:MutiSectionsMutiCellWithHeaderViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:165"]
  S9 -->|calls| T9
  S10["method:MutiSectionsMutiCellWithHeaderViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:40"]
  T10["method:MutiSectionsMutiCellWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:29"]
  S10 -->|calls| T10
  S11["method:MutiSectionsMutiCellWithHeaderViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:46"]
  T11["method:MutiSectionsMutiCellWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:58"]
  S11 -->|calls| T11
  S12["method:MutiSectionsMutiCellWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:58"]
  T12["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S12 -->|calls| T12
  S13["method:MutiSectionsMutiCellWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:58"]
  T13["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S13 -->|calls| T13
  S14["method:MutiSectionsMutiCellWithHeaderViewController::tableView:heightForRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:103"]
  T14["method:TestTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:24"]
  S14 -->|calls| T14
  S15["method:MutiSectionsMutiCellWithHeaderViewController::tableView:heightForRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:103"]
  T15["method:LawyerTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/LawyerTableViewCell.m:36"]
  S15 -->|calls| T15
  S16["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T16["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S16 -->|calls| T16
  S17["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T17["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S17 -->|calls| T17
  S18["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T20["method:TestTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:24"]
  S20 -->|calls| T20
  S21["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T21["method:LawyerTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/LawyerTableViewCell.m:36"]
  S21 -->|calls| T21
  S22["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T24["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S24 -->|calls| T24
  S25["method:MutiSectionsMutiCellWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Sections/MutiSectionsMutiCellWithHeaderViewController.m:170"]
  T25["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
