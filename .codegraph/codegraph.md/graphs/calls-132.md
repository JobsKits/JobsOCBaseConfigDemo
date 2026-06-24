# `calls 符号关系 - 132`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T1["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:784"]
  S1 -->|calls| T1
  S2["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T2["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S2 -->|calls| T2
  S3["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T3["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:819"]
  S3 -->|calls| T3
  S4["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T4["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S4 -->|calls| T4
  S5["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T5["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S5 -->|calls| T5
  S6["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T10["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S10 -->|calls| T10
  S11["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T11["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S11 -->|calls| T11
  S12["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T15["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S15 -->|calls| T15
  S16["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T16["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S16 -->|calls| T16
  S17["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T17["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S17 -->|calls| T17
  S18["method:ASTableView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1855"]
  T18["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S18 -->|calls| T18
  S19["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T19["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S19 -->|calls| T19
  S20["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T20["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:709"]
  S20 -->|calls| T20
  S21["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T21["function:ASDisplayNodeLayerHasAnimations<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:183"]
  S21 -->|calls| T21
  S22["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T22["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S22 -->|calls| T22
  S23["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T23["method:ASTableNode::deselectRowAtIndexPath:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:599"]
  S23 -->|calls| T23
  S24["method:ASTableView::nodeDidInvalidateSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1940"]
  T24["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S24 -->|calls| T24
  S25["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1947"]
  T25["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
