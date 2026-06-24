# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABWeakDelegateManager::removeAllDelegates<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:49"]
  T1["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S1 -->|calls| T1
  S2["method:TABWeakDelegateManager::getDelegates<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:54"]
  T2["method:TABWeakDelegateManager::delegatesCompact<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:75"]
  S2 -->|calls| T2
  S3["method:TABWeakDelegateManager::enumerateDelegatesUsingBlock:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:59"]
  T3["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S3 -->|calls| T3
  S4["method:TABWeakDelegateManager::count<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:68"]
  T4["method:TABWeakDelegateManager::delegatesCompact<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:75"]
  S4 -->|calls| T4
  S5["method:UIScrollView::tab_scrollToTopAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/UIScrollView+TABExtension.m:142"]
  T5["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S5 -->|calls| T5
  S6["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T6["method:TABAnimated::initWithOnlySkeleton<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:57"]
  S6 -->|calls| T6
  S7["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T7["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S7 -->|calls| T7
  S8["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T8["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S8 -->|calls| T8
  S9["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T9["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S9 -->|calls| T9
  S10["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T10["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S10 -->|calls| T10
  S11["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T11["method:BaseDemoViewController::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:20"]
  S11 -->|calls| T11
  S12["function:main<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/main.m:11"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:BaseCollectionCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:12"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:BaseCollectionCell::cellSizeValue<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:20"]
  T14["method:BaseCollectionCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:43"]
  S14 -->|calls| T14
  S15["method:BaseCollectionCell::registerCellInCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:24"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:BaseCollectionCell::registerCellInCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:24"]
  T16["method:BaseCollectionCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:12"]
  S16 -->|calls| T16
  S17["method:BaseCollectionCell::cellWithIndexPath:atCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:28"]
  T17["method:BaseCollectionCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:12"]
  S17 -->|calls| T17
  S18["method:BaseDemoViewController::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:20"]
  T18["method:BaseDemoViewController::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:20"]
  S18 -->|calls| T18
  S19["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  T19["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  S19 -->|calls| T19
  S20["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  T20["method:BaseDemoViewController::setupUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:38"]
  S20 -->|calls| T20
  S21["method:UILabel::setLineSpace:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Util/UILabel+TABCategory.m:14"]
  T21["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S21 -->|calls| T21
  S22["method:UILabel::setLineSpace:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Util/UILabel+TABCategory.m:14"]
  T22["method:BaseDemoViewController::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:20"]
  S22 -->|calls| T22
  S23["method:UILabel::setLineSpace:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Util/UILabel+TABCategory.m:14"]
  T23["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S23 -->|calls| T23
  S24["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  T24["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S24 -->|calls| T24
  S25["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  T25["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
