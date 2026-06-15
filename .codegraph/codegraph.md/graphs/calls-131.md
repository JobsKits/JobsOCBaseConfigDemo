# `calls 符号关系 - 131`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::tableView:didEndDisplayingCell:forRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1049"]
  T1["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S1 -->|calls| T1
  S2["method:ASTableView::tableView:willSelectRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1081"]
  T2["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:599"]
  S2 -->|calls| T2
  S3["method:ASTableView::tableView:willDeselectRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1120"]
  T3["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:599"]
  S3 -->|calls| T3
  S4["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T4["method:PhotoFeedTableViewController::scrollViewDidScroll<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/PhotoFeedTableViewController.swift:99"]
  S4 -->|calls| T4
  S5["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T5["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S5 -->|calls| T5
  S6["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T6["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S6 -->|calls| T6
  S7["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T7["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S7 -->|calls| T7
  S8["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T8["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S8 -->|calls| T8
  S9["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1277"]
  T9["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1277"]
  S9 -->|calls| T9
  S10["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1277"]
  T10["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1490"]
  S10 -->|calls| T10
  S11["method:ASTableView::scrollViewDidEndDecelerating:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1299"]
  T11["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S11 -->|calls| T11
  S12["method:ASTableView::scrollViewDidEndDecelerating:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1299"]
  T12["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S12 -->|calls| T12
  S13["method:ASTableView::scrollViewWillBeginDragging:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1317"]
  T13["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S13 -->|calls| T13
  S14["method:ASTableView::scrollViewWillBeginDragging:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1317"]
  T14["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S14 -->|calls| T14
  S15["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  T15["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  S15 -->|calls| T15
  S16["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  T16["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S16 -->|calls| T16
  S17["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  T17["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S17 -->|calls| T17
  S18["method:ASTableView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1370"]
  T18["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S18 -->|calls| T18
  S19["method:ASTableView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1370"]
  T19["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S19 -->|calls| T19
  S20["method:ASTableView::scrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1392"]
  T20["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  S20 -->|calls| T20
  S21["method:ASTableView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1405"]
  T21["method:ASTableView::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1421"]
  S21 -->|calls| T21
  S22["method:ASTableView::_scrollDirectionForVelocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1405"]
  T22["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S22 -->|calls| T22
  S23["method:ASTableView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1466"]
  T23["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S23 -->|calls| T23
  S24["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  T24["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1490"]
  S24 -->|calls| T24
  S25["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1490"]
  T25["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
