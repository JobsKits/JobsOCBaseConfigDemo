# `calls 符号关系 - 055`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MAS_VIEW::mas_safeAreaLayoutGuideLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:142"]
  T1["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S1 -->|calls| T1
  S2["method:MAS_VIEW::mas_safeAreaLayoutGuideRight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:146"]
  T2["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S2 -->|calls| T2
  S3["method:MAS_VIEW::mas_safeAreaLayoutGuideTop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:150"]
  T3["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S3 -->|calls| T3
  S4["method:MAS_VIEW::mas_safeAreaLayoutGuideBottom<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:154"]
  T4["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S4 -->|calls| T4
  S5["method:MAS_VIEW::mas_safeAreaLayoutGuideWidth<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:158"]
  T5["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S5 -->|calls| T5
  S6["method:MAS_VIEW::mas_safeAreaLayoutGuideHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:162"]
  T6["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S6 -->|calls| T6
  S7["method:MAS_VIEW::mas_safeAreaLayoutGuideCenterX<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:166"]
  T7["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S7 -->|calls| T7
  S8["method:MAS_VIEW::mas_safeAreaLayoutGuideCenterY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:170"]
  T8["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S8 -->|calls| T8
  S9["method:MAS_VIEW::attribute<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASShorthandAdditions.h:119"]
  T9["method:MAS_VIEW::mas_attribute<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:82"]
  S9 -->|calls| T9
  S10["method:MAS_VIEW_CONTROLLER::mas_topLayoutGuide<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/ViewController+MASAdditions.m:17"]
  T10["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S10 -->|calls| T10
  S11["method:MAS_VIEW_CONTROLLER::mas_topLayoutGuideTop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/ViewController+MASAdditions.m:20"]
  T11["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S11 -->|calls| T11
  S12["method:MAS_VIEW_CONTROLLER::mas_topLayoutGuideBottom<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/ViewController+MASAdditions.m:23"]
  T12["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S12 -->|calls| T12
  S13["method:MAS_VIEW_CONTROLLER::mas_bottomLayoutGuide<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/ViewController+MASAdditions.m:27"]
  T13["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S13 -->|calls| T13
  S14["method:MAS_VIEW_CONTROLLER::mas_bottomLayoutGuideTop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/ViewController+MASAdditions.m:30"]
  T14["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S14 -->|calls| T14
  S15["method:MAS_VIEW_CONTROLLER::mas_bottomLayoutGuideBottom<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/ViewController+MASAdditions.m:33"]
  T15["method:MASViewAttribute::initWithView:item:layoutAttribute:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASViewAttribute.m:17"]
  S15 -->|calls| T15
  S16["method:TABAnimatedWaterFallLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/WaterFallLayout/TABAnimatedWaterFallLayout.m:96"]
  T16["method:TABAnimatedWaterFallLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/WaterFallLayout/TABAnimatedWaterFallLayout.m:96"]
  S16 -->|calls| T16
  S17["method:JJTestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Util/JJTestTableView.m:18"]
  T17["method:JJTestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Util/JJTestTableView.m:18"]
  S17 -->|calls| T17
  S18["method:DelegateSelfCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:25"]
  T18["method:DelegateSelfCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:25"]
  S18 -->|calls| T18
  S19["method:DelegateSelfCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:25"]
  T19["method:DelegateSelfCollectionViewController::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:70"]
  S19 -->|calls| T19
  S20["method:DelegateSelfCollectionViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:25"]
  T20["method:DelegateSelfCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:47"]
  S20 -->|calls| T20
  S21["method:DelegateSelfCollectionViewController::afterGetData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:47"]
  T21["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S21 -->|calls| T21
  S22["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T22["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S22 -->|calls| T22
  S23["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T23["method:UIColor::tab_normalDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:27"]
  S23 -->|calls| T23
  S24["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:DelegateSelfCollectionViewController::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/DelegateSelf/Controller/DelegateSelfCollectionViewController.m:76"]
  T25["method:NewsCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/NewsCollectionViewCell.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
