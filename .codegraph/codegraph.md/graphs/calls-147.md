# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryBaseView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:83"]
  T1["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S1 -->|calls| T1
  S2["method:JXCategoryBaseView::willMoveToSuperview:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:104"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:JXCategoryBaseView::willMoveToSuperview:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:104"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:JXCategoryBaseView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:117"]
  T4["method:JXCategoryBaseView::refreshDataSource<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:181"]
  S4 -->|calls| T4
  S5["method:JXCategoryBaseView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:117"]
  T5["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  S5 -->|calls| T5
  S6["method:JXCategoryBaseView::reloadCellAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:124"]
  T6["method:JXCategoryBaseView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:471"]
  S6 -->|calls| T6
  S7["method:JXCategoryBaseView::selectItemAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:135"]
  T7["method:JXCategoryBaseView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:290"]
  S7 -->|calls| T7
  S8["method:JXCategoryBaseView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:139"]
  T8["method:JXCategoryBaseView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:139"]
  S8 -->|calls| T8
  S9["method:JXCategoryBaseView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:139"]
  T9["method:JXCategoryBaseView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:117"]
  S9 -->|calls| T9
  S10["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T10["method:JXCategoryBaseView::getContentEdgeInsetLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:572"]
  S10 -->|calls| T10
  S11["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T11["method:JXCategoryBaseView::getContentEdgeInsetRight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:579"]
  S11 -->|calls| T11
  S12["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T12["method:JXCategoryBaseView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:471"]
  S12 -->|calls| T12
  S13["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T13["method:JXCategoryBaseView::getContentEdgeInsetLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:572"]
  S13 -->|calls| T13
  S14["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T14["method:JXCategoryBaseView::getContentEdgeInsetRight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:579"]
  S14 -->|calls| T14
  S15["method:JXCategoryBaseView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:185"]
  T15["method:ASBridgedPropertiesTestView::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:29"]
  S15 -->|calls| T15
  S16["method:JXCategoryBaseView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:290"]
  T16["method:JXCategoryBaseView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:372"]
  S16 -->|calls| T16
  S17["method:JXCategoryBaseView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:290"]
  T17["method:JXCategoryBaseView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:372"]
  S17 -->|calls| T17
  S18["method:JXCategoryBaseView::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:485"]
  T18["method:JXCategoryBaseView::preferredCellClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:467"]
  S18 -->|calls| T18
  S19["method:JXCategoryBaseView::collectionView:layout:insetForSectionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:511"]
  T19["method:JXCategoryBaseView::getContentEdgeInsetLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:572"]
  S19 -->|calls| T19
  S20["method:JXCategoryBaseView::collectionView:layout:insetForSectionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:511"]
  T20["method:JXCategoryBaseView::getContentEdgeInsetRight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:579"]
  S20 -->|calls| T20
  S21["method:JXCategoryBaseView::getTargetCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:542"]
  T21["method:JXCategoryBaseView::getContentEdgeInsetLeft<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:572"]
  S21 -->|calls| T21
  S22["method:JXCategoryBaseView::clickSelectItemAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:590"]
  T22["method:JXCategoryBaseView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:290"]
  S22 -->|calls| T22
  S23["method:JXCategoryBaseView::scrollSelectItemAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:594"]
  T23["method:JXCategoryBaseView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:290"]
  S23 -->|calls| T23
  S24["method:JXCategoryCollectionView::setIndicators:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryCollectionView.m:12"]
  T24["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S24 -->|calls| T24
  S25["method:JXCategoryCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryCollectionView.m:25"]
  T25["method:JXCategoryCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryCollectionView.m:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
