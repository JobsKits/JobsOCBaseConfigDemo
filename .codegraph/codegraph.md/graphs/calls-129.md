# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T4["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S4 -->|calls| T4
  S5["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T5["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S5 -->|calls| T5
  S6["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T6["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S6 -->|calls| T6
  S7["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:ASTableView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1738"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T9["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S9 -->|calls| T9
  S10["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T11["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S11 -->|calls| T11
  S12["method:ASTableView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1855"]
  T12["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S12 -->|calls| T12
  S13["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T13["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S13 -->|calls| T13
  S14["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T14["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:709"]
  S14 -->|calls| T14
  S15["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T15["function:ASDisplayNodeLayerHasAnimations<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:183"]
  S15 -->|calls| T15
  S16["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T16["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S16 -->|calls| T16
  S17["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T17["method:ASTableNode::deselectRowAtIndexPath:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:599"]
  S17 -->|calls| T17
  S18["method:ASTableView::nodeDidInvalidateSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1940"]
  T18["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S18 -->|calls| T18
  S19["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1947"]
  T19["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S19 -->|calls| T19
  S20["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1947"]
  T20["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S20 -->|calls| T20
  S21["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T21["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S21 -->|calls| T21
  S22["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T22["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S22 -->|calls| T22
  S23["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T23["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S23 -->|calls| T23
  S24["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T24["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S24 -->|calls| T24
  S25["method:ASTableView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:2040"]
  T25["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
