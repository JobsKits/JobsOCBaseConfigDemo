# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::tableView:heightForRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:927"]
  T1["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S1 -->|calls| T1
  S2["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:995"]
  T2["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S2 -->|calls| T2
  S3["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:995"]
  T3["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:846"]
  S3 -->|calls| T3
  S4["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:995"]
  T4["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S4 -->|calls| T4
  S5["method:ASTableView::tableView:willDisplayCell:forRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1014"]
  T5["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S5 -->|calls| T5
  S6["method:ASTableView::tableView:willDisplayCell:forRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1014"]
  T6["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  S6 -->|calls| T6
  S7["method:ASTableView::tableView:didEndDisplayingCell:forRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1049"]
  T7["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S7 -->|calls| T7
  S8["method:ASTableView::tableView:willSelectRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1081"]
  T8["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:599"]
  S8 -->|calls| T8
  S9["method:ASTableView::tableView:willDeselectRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1120"]
  T9["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:599"]
  S9 -->|calls| T9
  S10["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T10["method:PhotoFeedTableViewController::scrollViewDidScroll<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/PhotoFeedTableViewController.swift:99"]
  S10 -->|calls| T10
  S11["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T11["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S11 -->|calls| T11
  S12["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T12["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S12 -->|calls| T12
  S13["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T13["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S13 -->|calls| T13
  S14["method:ASTableView::scrollViewDidScroll:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1257"]
  T14["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S14 -->|calls| T14
  S15["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1277"]
  T15["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1277"]
  S15 -->|calls| T15
  S16["method:ASTableView::scrollViewWillEndDragging:withVelocity:targetContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1277"]
  T16["method:ASTableView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1490"]
  S16 -->|calls| T16
  S17["method:ASTableView::scrollViewDidEndDecelerating:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1299"]
  T17["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S17 -->|calls| T17
  S18["method:ASTableView::scrollViewDidEndDecelerating:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1299"]
  T18["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S18 -->|calls| T18
  S19["method:ASTableView::scrollViewWillBeginDragging:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1317"]
  T19["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S19 -->|calls| T19
  S20["method:ASTableView::scrollViewWillBeginDragging:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1317"]
  T20["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S20 -->|calls| T20
  S21["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  T21["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  S21 -->|calls| T21
  S22["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  T22["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S22 -->|calls| T22
  S23["method:ASTableView::scrollViewDidEndDragging:willDecelerate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1337"]
  T23["method:_ASTableViewCell::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:99"]
  S23 -->|calls| T23
  S24["method:ASTableView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1370"]
  T24["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S24 -->|calls| T24
  S25["method:ASTableView::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1370"]
  T25["method:ASTableView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1480"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
