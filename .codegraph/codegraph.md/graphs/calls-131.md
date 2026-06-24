# `calls 符号关系 - 131`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1370"]
  T1["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S1 -->|calls| T1
  S2["method:ASTableView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1370"]
  T2["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S2 -->|calls| T2
  S3["method:ASTableView::scrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1392"]
  T3["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  S3 -->|calls| T3
  S4["method:ASTableView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1405"]
  T4["method:ASTableView::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1421"]
  S4 -->|calls| T4
  S5["method:ASTableView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1405"]
  T5["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S5 -->|calls| T5
  S6["method:ASTableView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1466"]
  T6["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S6 -->|calls| T6
  S7["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  T7["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1490"]
  S7 -->|calls| T7
  S8["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1490"]
  T8["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S8 -->|calls| T8
  S9["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1490"]
  T9["method:ASTableView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1497"]
  S9 -->|calls| T9
  S10["method:ASTableView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1497"]
  T10["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S10 -->|calls| T10
  S11["method:ASTableView::interfaceStateForRangeController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1532"]
  T11["function:ASInterfaceStateForDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:60"]
  S11 -->|calls| T11
  S12["method:ASTableView::nameForRangeControllerDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1537"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T13["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S13 -->|calls| T13
  S14["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T14["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S14 -->|calls| T14
  S15["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T15["method:ASTableView::beginAdjustingContentOffset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:857"]
  S15 -->|calls| T15
  S16["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T16["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S16 -->|calls| T16
  S17["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T17["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S17 -->|calls| T17
  S18["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T18["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:837"]
  S18 -->|calls| T18
  S19["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T19["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S19 -->|calls| T19
  S20["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T20["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:802"]
  S20 -->|calls| T20
  S21["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T21["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S21 -->|calls| T21
  S22["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T22["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:828"]
  S22 -->|calls| T22
  S23["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T23["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S23 -->|calls| T23
  S24["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T24["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:793"]
  S24 -->|calls| T24
  S25["method:ASTableView::rangeController:updateWithChangeSet:updates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1549"]
  T25["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
