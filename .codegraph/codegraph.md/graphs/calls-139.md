# `calls 符号关系 - 139`

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
  S2["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T2["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S2 -->|calls| T2
  S3["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T3["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S3 -->|calls| T3
  S4["method:ASTableView::dataController:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1801"]
  T4["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S4 -->|calls| T4
  S5["method:ASTableView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1855"]
  T5["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S5 -->|calls| T5
  S6["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T6["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S6 -->|calls| T6
  S7["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T7["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:709"]
  S7 -->|calls| T7
  S8["method:ASTableView::didLayoutSubviewsOfTableViewCell:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1879"]
  T8["function:ASDisplayNodeLayerHasAnimations<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:183"]
  S8 -->|calls| T8
  S9["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T9["method:ASTableNode::selectRowAtIndexPath:animated:scrollPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:585"]
  S9 -->|calls| T9
  S10["method:ASTableView::nodeSelectedStateDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1920"]
  T10["method:ASTableNode::deselectRowAtIndexPath:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:599"]
  S10 -->|calls| T10
  S11["method:ASTableView::nodeDidInvalidateSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1940"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1947"]
  T12["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S12 -->|calls| T12
  S13["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1947"]
  T13["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S13 -->|calls| T13
  S14["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T14["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S14 -->|calls| T14
  S15["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T15["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S15 -->|calls| T15
  S16["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T16["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S16 -->|calls| T16
  S17["method:ASTableView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1994"]
  T17["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S17 -->|calls| T17
  S18["method:ASTableView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:2040"]
  T18["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S18 -->|calls| T18
  S19["method:ASTableView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:2040"]
  T19["method:ASTableView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:2040"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T21["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T22["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T23["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T24["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableViewProtocols.h:1"]
  T25["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
