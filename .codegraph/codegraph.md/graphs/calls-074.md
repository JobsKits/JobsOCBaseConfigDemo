# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::collectionView:layout:minimumLineSpacingForSectionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1151"]
  T1["method:ASCollectionView::delegateIndexForSection:withSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1121"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T2["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T3["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::collectionView:willDisplayCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1222"]
  T4["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::collectionView:didEndDisplayingCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1283"]
  T5["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::collectionView:didEndDisplayingCell:forItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1283"]
  T6["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1328"]
  T7["method:ASCollectionView::supplementaryNodeForElementKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:774"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::collectionView:didEndDisplayingSupplementaryView:forElementOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1368"]
  T8["method:ASCollectionView::supplementaryNodeForElementKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:774"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T10["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T11["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T12["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T13["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T14["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T15["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T16["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T17["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T18["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1648"]
  T19["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1716"]
  T20["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::scrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1732"]
  T21["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T22["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T23["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T24["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T25["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
