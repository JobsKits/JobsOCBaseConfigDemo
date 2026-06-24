# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T1["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S1 -->|calls| T1
  S2["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T2["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S2 -->|calls| T2
  S3["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T4["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S4 -->|calls| T4
  S5["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T5["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S5 -->|calls| T5
  S6["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T6["method:ASCollectionFlowLayoutDelegate::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:40"]
  S6 -->|calls| T6
  S7["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T7["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S7 -->|calls| T7
  S8["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T8["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S8 -->|calls| T8
  S9["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T9["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  S9 -->|calls| T9
  S10["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  T10["method:ASCollectionLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:124"]
  S10 -->|calls| T10
  S11["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  T11["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S11 -->|calls| T11
  S12["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T12["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S12 -->|calls| T12
  S13["method:ASCollectionLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:176"]
  T13["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S13 -->|calls| T13
  S14["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T14["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S14 -->|calls| T14
  S15["method:ASCollectionLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:201"]
  T15["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S15 -->|calls| T15
  S16["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T16["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S16 -->|calls| T16
  S17["method:ASCollectionLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:218"]
  T17["function:ASCollectionLayout::ASCollectionLayoutSetSizeToElement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:385"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayout::_viewportSizeForCollectionNode:scrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:255"]
  T18["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T19["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T20["function:ASDispatchApply<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T21["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T22["function:ASDispatchAsync<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:33"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayout::_measureElementsInRect:blockingRect:layout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:275"]
  T23["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  S23 -->|calls| T23
  S24["function:ASCollectionLayout::ASCollectionLayoutElementSizeRangeFromSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:378"]
  T24["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  T25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
