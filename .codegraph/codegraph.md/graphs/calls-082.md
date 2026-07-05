# `calls 符号关系 - 082`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::dataController:supplementaryNodeKindsInSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2136"]
  T1["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::dataController:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2157"]
  T2["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::interfaceStateForRangeController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2219"]
  T3["function:ASInterfaceStateForDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:60"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::nameForRangeControllerDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2224"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T5["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T6["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T7["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T8["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T9["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T10["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T11["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T12["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2344"]
  T13["method:ASCollectionNode::selectItemAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:841"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2344"]
  T14["method:ASCollectionNode::deselectItemAtIndexPath:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:855"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::nodeDidInvalidateSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2364"]
  T15["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::nodesDidRelayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2370"]
  T16["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::nodesDidRelayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2370"]
  T17["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T18["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T19["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T20["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T21["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T22["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T23["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T24["method:ASCollectionView::relayoutItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:372"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  T25["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
