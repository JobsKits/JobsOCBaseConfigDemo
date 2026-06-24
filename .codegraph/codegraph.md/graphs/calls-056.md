# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T1["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S1 -->|calls| T1
  S2["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T2["method:TABComponentManager::create<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:144"]
  S2 -->|calls| T2
  S3["method:ViewExampleViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:27"]
  T3["method:ViewExampleViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:50"]
  S3 -->|calls| T3
  S4["method:ViewExampleViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:62"]
  T4["method:ViewExampleViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/Controller/ViewExampleViewController.m:50"]
  S4 -->|calls| T4
  S5["method:TestHeadView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:26"]
  T5["method:TestHeadView::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:72"]
  S5 -->|calls| T5
  S6["method:TestHeadView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:34"]
  T6["method:TestHeadView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CustomView/View/TestHeadView.m:34"]
  S6 -->|calls| T6
  S7["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  T7["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  S7 -->|calls| T7
  S8["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  T8["method:BaseOptionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:78"]
  S8 -->|calls| T8
  S9["method:BaseOptionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:84"]
  T9["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S9 -->|calls| T9
  S10["method:BaseOptionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:84"]
  T10["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S10 -->|calls| T10
  S11["method:MainViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/MainViewController.m:24"]
  T11["method:MainViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/MainViewController.m:24"]
  S11 -->|calls| T11
  S12["method:SencondaryOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/SencondaryOptionViewController.m:21"]
  T12["method:SencondaryOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/SencondaryOptionViewController.m:21"]
  S12 -->|calls| T12
  S13["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T13["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  S13 -->|calls| T13
  S14["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T14["method:TableDynamicSectionViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:112"]
  S14 -->|calls| T14
  S15["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T15["method:TableDynamicSectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:120"]
  S15 -->|calls| T15
  S16["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T16["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  S16 -->|calls| T16
  S17["method:TableDynamicSectionViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:46"]
  T17["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  S17 -->|calls| T17
  S18["method:TableDynamicSectionViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:52"]
  T18["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  S18 -->|calls| T18
  S19["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  T19["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S19 -->|calls| T19
  S20["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T20["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S20 -->|calls| T20
  S21["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T21["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S21 -->|calls| T21
  S22["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T23["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S23 -->|calls| T23
  S24["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T24["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  S24 -->|calls| T24
  S25["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T25["method:TableDynamicWithHeaderViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
