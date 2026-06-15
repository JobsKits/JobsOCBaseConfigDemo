# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:OneSectionWithHeaderSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithHeaderSectionViewController.m:147"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:OneSectionWithHeaderSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithHeaderSectionViewController.m:147"]
  T2["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S2 -->|calls| T2
  S3["method:OneSectionWithHeaderSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithHeaderSectionViewController.m:147"]
  T3["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S3 -->|calls| T3
  S4["method:OneSectionWithHeaderSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithHeaderSectionViewController.m:147"]
  T4["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S4 -->|calls| T4
  S5["method:OneSectionWithTableHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:30"]
  T5["method:OneSectionWithTableHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:30"]
  S5 -->|calls| T5
  S6["method:OneSectionWithTableHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:30"]
  T6["method:OneSectionWithTableHeaderViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:114"]
  S6 -->|calls| T6
  S7["method:OneSectionWithTableHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:30"]
  T7["method:OneSectionWithTableHeaderViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:122"]
  S7 -->|calls| T7
  S8["method:OneSectionWithTableHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:30"]
  T8["method:OneSectionWithTableHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:67"]
  S8 -->|calls| T8
  S9["method:OneSectionWithTableHeaderViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:49"]
  T9["method:OneSectionWithTableHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:30"]
  S9 -->|calls| T9
  S10["method:OneSectionWithTableHeaderViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:55"]
  T10["method:OneSectionWithTableHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:67"]
  S10 -->|calls| T10
  S11["method:OneSectionWithTableHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:67"]
  T11["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S11 -->|calls| T11
  S12["method:OneSectionWithTableHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:128"]
  T12["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S12 -->|calls| T12
  S13["method:OneSectionWithTableHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:128"]
  T13["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S13 -->|calls| T13
  S14["method:OneSectionWithTableHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:128"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:OneSectionWithTableHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:128"]
  T15["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S15 -->|calls| T15
  S16["method:OneSectionWithTableHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:128"]
  T16["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S16 -->|calls| T16
  S17["method:OneSectionWithTableHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/OneSection/OneSectionWithTableHeaderViewController.m:128"]
  T17["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S17 -->|calls| T17
  S18["method:NestTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:28"]
  T18["method:NestTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:28"]
  S18 -->|calls| T18
  S19["method:NestTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:28"]
  T19["method:NestTableViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:128"]
  S19 -->|calls| T19
  S20["method:NestTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:28"]
  T20["method:NestTableViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:136"]
  S20 -->|calls| T20
  S21["method:NestTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:28"]
  T21["method:NestTableViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:65"]
  S21 -->|calls| T21
  S22["method:NestTableViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:47"]
  T22["method:NestTableViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:28"]
  S22 -->|calls| T22
  S23["method:NestTableViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:53"]
  T23["method:NestTableViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:65"]
  S23 -->|calls| T23
  S24["method:NestTableViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:65"]
  T24["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S24 -->|calls| T24
  S25["method:NestTableViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Others/NestTableViewController.m:142"]
  T25["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
