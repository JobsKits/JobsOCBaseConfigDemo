# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T1["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:64"]
  T2["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T3["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForHeaderInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:210"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T4["method:ASCollectionView::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1098"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T5["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T6["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T7["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForFooterInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:220"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T8["method:ASCollectionView::collectionView:layout:referenceSizeForFooterInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1108"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T9["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewFlowLayoutInspector::collectionView:supplementaryNodesOfKind:inSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:134"]
  T11["method:ASCollectionViewFlowLayoutInspector::collectionView:constrainedSizeForSupplementaryNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionViewFlowLayoutInspector.mm:94"]
  S11 -->|calls| T11
  S12["method:ASControlTargetAction::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASControlTargetAction.mm:30"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:ASControlTargetAction::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASControlTargetAction.mm:30"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:ASDefaultPlayButton::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDefaultPlayButton.mm:15"]
  T14["method:ASDefaultPlayButton::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDefaultPlayButton.mm:15"]
  S14 -->|calls| T14
  S15["method:ASDefaultPlaybackButton::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:20"]
  T15["method:ASDefaultPlaybackButton::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:20"]
  S15 -->|calls| T15
  S16["method:ASDefaultPlaybackButton::setButtonType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDefaultPlaybackButton.mm:31"]
  T16["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  T17["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  T18["function:ASImageAlphaInfoIsOpaque<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:55"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T19["method:ASDisplayNode::drawParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:36"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T21["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T22["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T23["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T24["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T25["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
