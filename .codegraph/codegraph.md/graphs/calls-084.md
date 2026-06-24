# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::collectionView:canMoveItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1566"]
  T1["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T2["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T3["method:ASCollectionView::moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1044"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::collectionView:moveItemAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1602"]
  T4["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T5["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T6["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T7["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1626"]
  T8["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1648"]
  T9["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1716"]
  T10["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::scrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1732"]
  T11["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T12["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T13["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1745"]
  T14["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T15["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T16["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T18["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T19["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T20["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T21["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1850"]
  T22["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  T23["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T24["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T25["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
