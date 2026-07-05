# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T1["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S1 -->|calls| T1
  S2["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T2["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S2 -->|calls| T2
  S3["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T3["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  S3 -->|calls| T3
  S4["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  T4["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  S4 -->|calls| T4
  S5["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  T5["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S5 -->|calls| T5
  S6["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T6["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S6 -->|calls| T6
  S7["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T7["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S7 -->|calls| T7
  S8["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T8["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S8 -->|calls| T8
  S9["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T9["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S9 -->|calls| T9
  S10["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T10["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S10 -->|calls| T10
  S11["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T11["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S11 -->|calls| T11
  S12["method:ASCollectionLayout::_viewportSizeForCollectionNode:scrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:255"]
  T12["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S12 -->|calls| T12
  S13["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T13["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S13 -->|calls| T13
  S14["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T14["function:ASDispatchApply<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S14 -->|calls| T14
  S15["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T15["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S15 -->|calls| T15
  S16["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T16["function:ASDispatchAsync<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:33"]
  S16 -->|calls| T16
  S17["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T17["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S17 -->|calls| T17
  S18["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  T18["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  T19["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayoutCache::removeAllLayouts<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:82"]
  T20["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutContext+Private.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutContext+Private.h:1"]
  T21["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  T22["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S22 -->|calls| T22
  S23["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  T23["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewFlowLayoutInspector::initWithFlowLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:37"]
  T24["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S24 -->|calls| T24
  S25["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T25["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
