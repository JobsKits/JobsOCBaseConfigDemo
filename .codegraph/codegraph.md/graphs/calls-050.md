# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T1["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S1 -->|calls| T1
  S2["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T2["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S2 -->|calls| T2
  S3["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T3["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S3 -->|calls| T3
  S4["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T4["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S4 -->|calls| T4
  S5["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  T5["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  S5 -->|calls| T5
  S6["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  T6["method:DoubanCollectionViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:83"]
  S6 -->|calls| T6
  S7["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  T7["method:DoubanCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:91"]
  S7 -->|calls| T7
  S8["method:DoubanCollectionViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:38"]
  T8["method:DoubanCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:50"]
  S8 -->|calls| T8
  S9["method:DoubanCollectionViewController::collectionView:layout:sizeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:66"]
  T9["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S9 -->|calls| T9
  S10["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T10["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S10 -->|calls| T10
  S11["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T12["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S12 -->|calls| T12
  S13["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T13["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S13 -->|calls| T13
  S14["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T14["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S14 -->|calls| T14
  S15["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T15["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S15 -->|calls| T15
  S16["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T16["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S16 -->|calls| T16
  S17["method:DoubanCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:98"]
  T17["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S17 -->|calls| T17
  S18["method:XibCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/Controller/XibCollectionViewController.m:21"]
  T18["method:XibCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/Controller/XibCollectionViewController.m:21"]
  S18 -->|calls| T18
  S19["method:XibCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/Controller/XibCollectionViewController.m:21"]
  T19["method:XibCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/Controller/XibCollectionViewController.m:34"]
  S19 -->|calls| T19
  S20["method:XibCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/Controller/XibCollectionViewController.m:70"]
  T20["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S20 -->|calls| T20
  S21["method:XibCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/Controller/XibCollectionViewController.m:70"]
  T21["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S21 -->|calls| T21
  S22["method:XibCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/Controller/XibCollectionViewController.m:70"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:XibCollectionViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/View/XibCollectionViewCell.m:12"]
  T23["method:XibCollectionViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UseXib/View/XibCollectionViewCell.m:12"]
  S23 -->|calls| T23
  S24["method:CardViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/CardViewController.m:26"]
  T24["method:CardViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/CardViewController.m:26"]
  S24 -->|calls| T24
  S25["method:CardViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/CardViewController.m:26"]
  T25["method:CardViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/Controller/CardViewController.m:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
