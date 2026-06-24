# `calls 符号关系 - 185`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  T1["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S1 -->|calls| T1
  S2["method:ASStackLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:181"]
  T2["method:ASStackLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:181"]
  S2 -->|calls| T2
  S3["method:ASStackLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:211"]
  T3["method:ASLayoutSpec::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:248"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  T4["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::yogaSpacerNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:23"]
  T5["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::yogaVerticalStack<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:30"]
  T6["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::yogaHorizontalStack<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:37"]
  T7["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S7 -->|calls| T7
  S8["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T8["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S8 -->|calls| T8
  S9["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  T9["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S9 -->|calls| T9
  S10["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  T10["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S10 -->|calls| T10
  S11["function:yogaDimensionToPercent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:132"]
  T11["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S11 -->|calls| T11
  S12["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  T12["method:ASDisplayNode::implementsLayoutMethod<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:42"]
  S12 -->|calls| T12
  S13["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T13["function:cgFloatForYogaFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S13 -->|calls| T13
  S14["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T14["function:cgFloatForYogaFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:120"]
  S14 -->|calls| T14
  S15["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T15["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S15 -->|calls| T15
  S16["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T16["function:yogaDimensionToPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:125"]
  S16 -->|calls| T16
  S17["function:ASLayoutElementYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:210"]
  T17["method:ASLayoutElementStyle::size<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:224"]
  S17 -->|calls| T17
  S18["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T18["method:ASCollectionView::canBatchFetch<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1829"]
  S18 -->|calls| T18
  S19["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  T19["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  S19 -->|calls| T19
  S20["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T20["method:ASBatchContext::isFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:33"]
  S20 -->|calls| T20
  S21["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T21["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S21 -->|calls| T21
  S22["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T22["function:ASScrollDirectionContainsUp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:31"]
  S22 -->|calls| T22
  S23["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T23["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S23 -->|calls| T23
  S24["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T24["function:ASScrollDirectionContainsLeft<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:27"]
  S24 -->|calls| T24
  S25["function:ASDisplayShouldFetchBatchForContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:37"]
  T25["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
