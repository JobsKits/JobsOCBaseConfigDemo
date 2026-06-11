# `calls 符号关系 - 092`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T1["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T2["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T3["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T4["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T5["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2344"]
  T6["method:ASCollectionNode::selectItemAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:841"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2344"]
  T7["method:ASCollectionNode::deselectItemAtIndexPath:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:855"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::nodeDidInvalidateSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2364"]
  T8["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::nodesDidRelayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2370"]
  T9["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::nodesDidRelayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2370"]
  T10["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T11["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T12["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T13["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T14["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T15["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T16["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T17["method:ASCollectionView::relayoutItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:372"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  T18["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  T19["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T21["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T22["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T23["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T24["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T25["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
