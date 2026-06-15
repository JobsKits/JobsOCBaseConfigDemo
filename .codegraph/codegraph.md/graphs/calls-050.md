# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:DelegateSelfCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:47"]
  T1["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S1 -->|calls| T1
  S2["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T2["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S2 -->|calls| T2
  S3["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T3["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S3 -->|calls| T3
  S4["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T5["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S5 -->|calls| T5
  S6["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T6["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S6 -->|calls| T6
  S7["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T7["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S7 -->|calls| T7
  S8["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T8["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S8 -->|calls| T8
  S9["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T9["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S9 -->|calls| T9
  S10["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T10["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S10 -->|calls| T10
  S11["method:DoubanCardViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:26"]
  T11["method:DoubanCardViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:26"]
  S11 -->|calls| T11
  S12["method:DoubanCardViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:37"]
  T12["method:DoubanCardViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:46"]
  S12 -->|calls| T12
  S13["method:DoubanCardViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:46"]
  T13["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S13 -->|calls| T13
  S14["method:DoubanCardViewController::collectionView:layout:sizeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:68"]
  T14["method:CardCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/CardCollectionViewCell.m:21"]
  S14 -->|calls| T14
  S15["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T15["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S15 -->|calls| T15
  S16["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T17["method:CardCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/CardCollectionViewCell.m:21"]
  S17 -->|calls| T17
  S18["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T18["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S18 -->|calls| T18
  S19["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T19["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S19 -->|calls| T19
  S20["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T20["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  S20 -->|calls| T20
  S21["method:DoubanCardViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCardViewController.m:88"]
  T21["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  S21 -->|calls| T21
  S22["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  T22["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  S22 -->|calls| T22
  S23["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  T23["method:DoubanCollectionViewController::initData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:83"]
  S23 -->|calls| T23
  S24["method:DoubanCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:27"]
  T24["method:DoubanCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:91"]
  S24 -->|calls| T24
  S25["method:DoubanCollectionViewController::reloadViewAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:38"]
  T25["method:DoubanCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/Douban/Controller/DoubanCollectionViewController.m:50"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
