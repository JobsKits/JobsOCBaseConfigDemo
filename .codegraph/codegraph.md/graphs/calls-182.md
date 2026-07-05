# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::yogaHorizontalStack<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:37"]
  T1["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S1 -->|calls| T1
  S2["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T2["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S2 -->|calls| T2
  S3["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T3["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S3 -->|calls| T3
  S4["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  T4["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S4 -->|calls| T4
  S5["function:yogaDimensionToPercent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:132"]
  T5["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S5 -->|calls| T5
  S6["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  T6["method:ASDisplayNode::implementsLayoutMethod<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:42"]
  S6 -->|calls| T6
  S7["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T7["function:cgFloatForYogaFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S7 -->|calls| T7
  S8["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T8["function:cgFloatForYogaFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S8 -->|calls| T8
  S9["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T9["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S9 -->|calls| T9
  S10["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T10["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S10 -->|calls| T10
  S11["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T11["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S11 -->|calls| T11
  S12["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T12["method:ASCollectionView::canBatchFetch<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1829"]
  S12 -->|calls| T12
  S13["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T13["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S13 -->|calls| T13
  S14["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T14["method:ASBatchContext::isFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:33"]
  S14 -->|calls| T14
  S15["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T15["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S15 -->|calls| T15
  S16["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T16["function:ASScrollDirectionContainsUp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:31"]
  S16 -->|calls| T16
  S17["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T17["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S17 -->|calls| T17
  S18["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T18["function:ASScrollDirectionContainsLeft<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:27"]
  S18 -->|calls| T18
  S19["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T19["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayout::initWithLayoutDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:47"]
  T21["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T23["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  S23 -->|calls| T23
  S24["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T24["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayout::layoutContextWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:61"]
  T25["method:ASCollectionFlowLayoutDelegate::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:40"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
