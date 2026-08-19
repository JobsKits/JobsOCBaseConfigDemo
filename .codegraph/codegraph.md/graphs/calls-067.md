# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::reloadSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:994"]
  T1["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::moveSection:toSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1003"]
  T2["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::insertItemsAtIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1017"]
  T3["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::deleteItemsAtIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1026"]
  T4["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::reloadItemsAtIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1035"]
  T5["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  T6["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  T7["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::endInteractiveMovement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1062"]
  T8["method:ASCollectionView::endInteractiveMovement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1062"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::cancelInteractiveMovement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1067"]
  T9["method:ASCollectionView::cancelInteractiveMovement<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1067"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::numberOfSectionsInCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1075"]
  T10["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::collectionView:layout:insetForSectionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1130"]
  T11["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::collectionView:layout:minimumInteritemSpacingForSectionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1140"]
  T12["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::collectionView:layout:minimumLineSpacingForSectionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1151"]
  T13["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T14["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T15["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T16["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::collectionView:didEndDisplayingCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1283"]
  T17["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::collectionView:didEndDisplayingCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1283"]
  T18["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1328"]
  T19["method:ASCollectionView::supplementaryNodeForElementKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:774"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::collectionView:didEndDisplayingSupplementaryView:forElementOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1368"]
  T20["method:ASCollectionView::supplementaryNodeForElementKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:774"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T22["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T23["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T24["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T25["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
