# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T1["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S1 -->|calls| T1
  S2["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  T2["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S2 -->|calls| T2
  S3["function:yogaDimensionToPercent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:132"]
  T3["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S3 -->|calls| T3
  S4["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  T4["method:ASDisplayNode::implementsLayoutMethod<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:42"]
  S4 -->|calls| T4
  S5["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T5["function:cgFloatForYogaFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S5 -->|calls| T5
  S6["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T6["function:cgFloatForYogaFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S6 -->|calls| T6
  S7["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T7["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S7 -->|calls| T7
  S8["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T8["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S8 -->|calls| T8
  S9["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T9["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S9 -->|calls| T9
  S10["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T10["method:ASCollectionView::canBatchFetch<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1829"]
  S10 -->|calls| T10
  S11["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T11["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S11 -->|calls| T11
  S12["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T12["method:ASBatchContext::isFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:33"]
  S12 -->|calls| T12
  S13["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T13["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S13 -->|calls| T13
  S14["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T14["function:ASScrollDirectionContainsUp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:31"]
  S14 -->|calls| T14
  S15["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T15["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S15 -->|calls| T15
  S16["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T16["function:ASScrollDirectionContainsLeft<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:27"]
  S16 -->|calls| T16
  S17["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T17["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T18["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T19["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T21["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T22["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T23["method:ASCollectionFlowLayoutDelegate::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:40"]
  S23 -->|calls| T23
  S24["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T24["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayout::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:96"]
  T25["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
