# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  T1["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  S1 -->|calls| T1
  S2["method:BaseOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:24"]
  T2["method:BaseOptionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:78"]
  S2 -->|calls| T2
  S3["method:BaseOptionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:84"]
  T3["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S3 -->|calls| T3
  S4["method:BaseOptionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:84"]
  T4["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S4 -->|calls| T4
  S5["method:MainViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/MainViewController.m:24"]
  T5["method:MainViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/MainViewController.m:24"]
  S5 -->|calls| T5
  S6["method:SencondaryOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/SencondaryOptionViewController.m:21"]
  T6["method:SencondaryOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/SencondaryOptionViewController.m:21"]
  S6 -->|calls| T6
  S7["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T7["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  S7 -->|calls| T7
  S8["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T8["method:TableDynamicSectionViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:112"]
  S8 -->|calls| T8
  S9["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T9["method:TableDynamicSectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:120"]
  S9 -->|calls| T9
  S10["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T10["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  S10 -->|calls| T10
  S11["method:TableDynamicSectionViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:46"]
  T11["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  S11 -->|calls| T11
  S12["method:TableDynamicSectionViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:52"]
  T12["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  S12 -->|calls| T12
  S13["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  T13["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S13 -->|calls| T13
  S14["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T14["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S14 -->|calls| T14
  S15["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T15["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S15 -->|calls| T15
  S16["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T17["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S17 -->|calls| T17
  S18["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T18["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  S18 -->|calls| T18
  S19["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T19["method:TableDynamicWithHeaderViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:121"]
  S19 -->|calls| T19
  S20["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T20["method:TableDynamicWithHeaderViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:129"]
  S20 -->|calls| T20
  S21["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T21["method:TableDynamicWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:65"]
  S21 -->|calls| T21
  S22["method:TableDynamicWithHeaderViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:47"]
  T22["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  S22 -->|calls| T22
  S23["method:TableDynamicWithHeaderViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:53"]
  T23["method:TableDynamicWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:65"]
  S23 -->|calls| T23
  S24["method:TableDynamicWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:65"]
  T24["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S24 -->|calls| T24
  S25["method:TableDynamicWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:135"]
  T25["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
