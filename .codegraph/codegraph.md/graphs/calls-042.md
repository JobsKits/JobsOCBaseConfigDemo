# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:TABInjectionIIIHelper::injected<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:19"]
  T1["method:BaseDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Controller/BaseDemoViewController.m:27"]
  S1 -->|calls| T1
  S2["method:TABInjectionIIIHelper::load<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:23"]
  T2["method:TABInjectionIIIHelper::load<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:23"]
  S2 -->|calls| T2
  S3["method:TABInjectionIIIHelper::load<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/TABInjectionIIIHelper.m:23"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:TABPopViewController::clickCancel<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/AlertView/TABPopViewController.m:200"]
  T4["method:TABPopViewController::dissPopView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/AlertView/TABPopViewController.m:154"]
  S4 -->|calls| T4
  S5["method:UIButton::gradientButtonWithSize:colorArray:percentageArray:gradientType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Gradient/UIButton+Gradient.m:13"]
  T5["method:UIImage::createImageWithSize:gradientColors:percentage:gradientType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Gradient/UIImage+Gradient.m:13"]
  S5 -->|calls| T5
  S6["method:UIButton::gradientButtonWithSize:colorArray:percentageArray:gradientType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Gradient/UIButton+Gradient.m:13"]
  T6["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  S6 -->|calls| T6
  S7["method:JXCategoryBaseView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:43"]
  T7["method:JXCategoryBaseView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:63"]
  S7 -->|calls| T7
  S8["method:JXCategoryBaseView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:43"]
  T8["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  S8 -->|calls| T8
  S9["method:JXCategoryBaseView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:53"]
  T9["method:JXCategoryBaseView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:63"]
  S9 -->|calls| T9
  S10["method:JXCategoryBaseView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:53"]
  T10["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  S10 -->|calls| T10
  S11["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  T11["method:TestCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestCollectionView.m:22"]
  S11 -->|calls| T11
  S12["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  T12["method:JXCategoryBaseView::preferredCellClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:467"]
  S12 -->|calls| T12
  S13["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  T13["method:JXCategoryBaseView::preferredCellClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:467"]
  S13 -->|calls| T13
  S14["method:JXCategoryBaseView::willMoveToSuperview:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:104"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:JXCategoryBaseView::willMoveToSuperview:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:104"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:JXCategoryBaseView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:117"]
  T16["method:JXCategoryBaseView::refreshDataSource<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:181"]
  S16 -->|calls| T16
  S17["method:JXCategoryBaseView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:117"]
  T17["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  S17 -->|calls| T17
  S18["method:JXCategoryBaseView::reloadCellAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:124"]
  T18["method:JXCategoryBaseView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:471"]
  S18 -->|calls| T18
  S19["method:JXCategoryBaseView::selectItemAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:135"]
  T19["method:JXCategoryBaseView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:290"]
  S19 -->|calls| T19
  S20["method:JXCategoryBaseView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:139"]
  T20["method:JXCategoryBaseView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:139"]
  S20 -->|calls| T20
  S21["method:JXCategoryBaseView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:139"]
  T21["method:JXCategoryBaseView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:117"]
  S21 -->|calls| T21
  S22["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T22["method:JXCategoryBaseView::getContentEdgeInsetLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:572"]
  S22 -->|calls| T22
  S23["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T23["method:JXCategoryBaseView::getContentEdgeInsetRight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:579"]
  S23 -->|calls| T23
  S24["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T24["method:JXCategoryBaseView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:471"]
  S24 -->|calls| T24
  S25["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T25["method:JXCategoryBaseView::getContentEdgeInsetLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:572"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
