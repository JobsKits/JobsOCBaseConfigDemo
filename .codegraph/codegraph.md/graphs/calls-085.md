# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T1["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T2["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::dataController:supplementaryNodeKindsInSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2136"]
  T5["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::dataController:supplementaryNodeKindsInSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2136"]
  T6["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::dataController:supplementaryNodeKindsInSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2136"]
  T7["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::dataController:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2157"]
  T8["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::interfaceStateForRangeController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2219"]
  T9["function:ASInterfaceStateForDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:60"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::nameForRangeControllerDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2224"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T11["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T12["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T13["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T14["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T15["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T16["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T17["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2236"]
  T18["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2344"]
  T19["method:ASCollectionNode::selectItemAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:841"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2344"]
  T20["method:ASCollectionNode::deselectItemAtIndexPath:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:855"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::nodeDidInvalidateSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2364"]
  T21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::nodesDidRelayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2370"]
  T22["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::nodesDidRelayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2370"]
  T23["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T24["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T25["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
