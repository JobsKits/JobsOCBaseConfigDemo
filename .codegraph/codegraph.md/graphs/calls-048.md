# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseCollectionCell::cellSizeValue<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:20"]
  T1["method:BaseCollectionCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:43"]
  S1 -->|calls| T1
  S2["method:BaseCollectionCell::registerCellInCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:24"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:BaseCollectionCell::registerCellInCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:24"]
  T3["method:BaseCollectionCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:12"]
  S3 -->|calls| T3
  S4["method:BaseCollectionCell::cellWithIndexPath:atCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:28"]
  T4["method:BaseCollectionCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Cell/BaseCollectionCell.m:12"]
  S4 -->|calls| T4
  S5["method:BaseDemoViewController::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:20"]
  T5["method:BaseDemoViewController::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:20"]
  S5 -->|calls| T5
  S6["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  T6["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  S6 -->|calls| T6
  S7["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  T7["method:BaseDemoViewController::setupUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:38"]
  S7 -->|calls| T7
  S8["method:UILabel::setLineSpace:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Util/UILabel+TABCategory.m:14"]
  T8["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S8 -->|calls| T8
  S9["method:UILabel::setLineSpace:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Util/UILabel+TABCategory.m:14"]
  T9["method:BaseDemoViewController::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:20"]
  S9 -->|calls| T9
  S10["method:UILabel::setLineSpace:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Util/UILabel+TABCategory.m:14"]
  T10["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S10 -->|calls| T10
  S11["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  T11["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S11 -->|calls| T11
  S12["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  T12["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S12 -->|calls| T12
  S13["function:TABInjectionIIIHelper::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:19"]
  T13["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  S13 -->|calls| T13
  S14["method:TABInjectionIIIHelper::load<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:23"]
  T14["method:TABInjectionIIIHelper::load<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:23"]
  S14 -->|calls| T14
  S15["method:TABInjectionIIIHelper::load<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:23"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:TABPopViewController::clickCancel<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/AlertView/TABPopViewController.m:200"]
  T16["method:TABPopViewController::dissPopView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/AlertView/TABPopViewController.m:154"]
  S16 -->|calls| T16
  S17["method:UIButton::gradientButtonWithSize:colorArray:percentageArray:gradientType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Gradient/UIButton+Gradient.m:13"]
  T17["method:UIImage::createImageWithSize:gradientColors:percentage:gradientType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Gradient/UIImage+Gradient.m:13"]
  S17 -->|calls| T17
  S18["method:UIButton::gradientButtonWithSize:colorArray:percentageArray:gradientType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Gradient/UIButton+Gradient.m:13"]
  T18["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  S18 -->|calls| T18
  S19["method:JXCategoryBaseView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:43"]
  T19["method:JXCategoryBaseView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:63"]
  S19 -->|calls| T19
  S20["method:JXCategoryBaseView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:43"]
  T20["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  S20 -->|calls| T20
  S21["method:JXCategoryBaseView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:53"]
  T21["method:JXCategoryBaseView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:63"]
  S21 -->|calls| T21
  S22["method:JXCategoryBaseView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:53"]
  T22["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  S22 -->|calls| T22
  S23["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  T23["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S23 -->|calls| T23
  S24["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  T24["method:JXCategoryBaseView::preferredCellClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:467"]
  S24 -->|calls| T24
  S25["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  T25["method:JXCategoryBaseView::preferredCellClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:467"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
