# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseOptionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:84"]
  T1["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S1 -->|calls| T1
  S2["method:BaseOptionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/Base/BaseOptionViewController.m:84"]
  T2["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S2 -->|calls| T2
  S3["method:MainViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/MainViewController.m:24"]
  T3["method:MainViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/MainViewController.m:24"]
  S3 -->|calls| T3
  S4["method:SencondaryOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/SencondaryOptionViewController.m:21"]
  T4["method:SencondaryOptionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/Options/SencondaryOptionViewController.m:21"]
  S4 -->|calls| T4
  S5["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T5["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  S5 -->|calls| T5
  S6["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T6["method:TableDynamicSectionViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:112"]
  S6 -->|calls| T6
  S7["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T7["method:TableDynamicSectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:120"]
  S7 -->|calls| T7
  S8["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  T8["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  S8 -->|calls| T8
  S9["method:TableDynamicSectionViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:46"]
  T9["method:TableDynamicSectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:28"]
  S9 -->|calls| T9
  S10["method:TableDynamicSectionViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:52"]
  T10["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  S10 -->|calls| T10
  S11["method:TableDynamicSectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:64"]
  T11["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S11 -->|calls| T11
  S12["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T12["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S12 -->|calls| T12
  S13["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T13["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S13 -->|calls| T13
  S14["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:TableDynamicSectionViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicSectionViewController.m:126"]
  T15["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S15 -->|calls| T15
  S16["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T16["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  S16 -->|calls| T16
  S17["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T17["method:TableDynamicWithHeaderViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:121"]
  S17 -->|calls| T17
  S18["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T18["method:TableDynamicWithHeaderViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:129"]
  S18 -->|calls| T18
  S19["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  T19["method:TableDynamicWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:65"]
  S19 -->|calls| T19
  S20["method:TableDynamicWithHeaderViewController::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:47"]
  T20["method:TableDynamicWithHeaderViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:29"]
  S20 -->|calls| T20
  S21["method:TableDynamicWithHeaderViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:53"]
  T21["method:TableDynamicWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:65"]
  S21 -->|calls| T21
  S22["method:TableDynamicWithHeaderViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:65"]
  T22["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S22 -->|calls| T22
  S23["method:TableDynamicWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:135"]
  T23["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S23 -->|calls| T23
  S24["method:TableDynamicWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:135"]
  T24["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S24 -->|calls| T24
  S25["method:TableDynamicWithHeaderViewController::tableView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/Controller/Dynamic Section/TableDynamicWithHeaderViewController.m:135"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
