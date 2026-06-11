# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:SegmentCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/SegmentCollectionViewController.m:166"]
  T1["method:BaseCollectionCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:12"]
  S1 -->|calls| T1
  S2["method:SegmentCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/SegmentCollectionViewController.m:166"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:SegmentCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/SegmentCollectionViewController.m:166"]
  T3["method:LawyerArticleCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/LawyerArticleCollectionViewCell.m:29"]
  S3 -->|calls| T3
  S4["method:SegmentCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/SegmentCollectionViewController.m:166"]
  T4["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S4 -->|calls| T4
  S5["method:SegmentCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/SegmentCollectionViewController.m:166"]
  T5["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S5 -->|calls| T5
  S6["method:SegmentCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/SegmentCollectionViewController.m:166"]
  T6["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S6 -->|calls| T6
  S7["method:SegmentCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/SegmentCollectionViewController.m:166"]
  T7["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S7 -->|calls| T7
  S8["method:TestCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:27"]
  T8["method:TestCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:27"]
  S8 -->|calls| T8
  S9["method:TestCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:27"]
  T9["method:TestCollectionViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:90"]
  S9 -->|calls| T9
  S10["method:TestCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:27"]
  T10["method:TestCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:98"]
  S10 -->|calls| T10
  S11["method:TestCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:27"]
  T11["method:TestCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:57"]
  S11 -->|calls| T11
  S12["method:TestCollectionViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:45"]
  T12["method:TestCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:57"]
  S12 -->|calls| T12
  S13["method:TestCollectionViewController::collectionView:layout:sizeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:74"]
  T13["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S13 -->|calls| T13
  S14["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T14["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S14 -->|calls| T14
  S15["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T15["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S15 -->|calls| T15
  S16["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T17["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S17 -->|calls| T17
  S18["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T18["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S18 -->|calls| T18
  S19["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T19["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S19 -->|calls| T19
  S20["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T20["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S20 -->|calls| T20
  S21["method:TestCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/TestCollectionViewController.m:104"]
  T21["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S21 -->|calls| T21
  S22["method:WaterFlowLayoutViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:29"]
  T22["method:WaterFlowLayoutViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:29"]
  S22 -->|calls| T22
  S23["method:WaterFlowLayoutViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:29"]
  T23["method:WaterFlowLayoutViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:96"]
  S23 -->|calls| T23
  S24["method:WaterFlowLayoutViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:29"]
  T24["method:WaterFlowLayoutViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:104"]
  S24 -->|calls| T24
  S25["method:WaterFlowLayoutViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:29"]
  T25["method:WaterFlowLayoutViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/WaterFlowLayoutViewController.m:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
