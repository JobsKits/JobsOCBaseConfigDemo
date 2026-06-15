# `calls 符号关系 - 130`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T1["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1947"]
  S1 -->|calls| T1
  S2["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T2["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  S2 -->|calls| T2
  S3["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T3["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S3 -->|calls| T3
  S4["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:784"]
  T4["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S4 -->|calls| T4
  S5["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:784"]
  T5["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S5 -->|calls| T5
  S6["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:793"]
  T6["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S6 -->|calls| T6
  S7["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:793"]
  T7["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S7 -->|calls| T7
  S8["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:802"]
  T8["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S8 -->|calls| T8
  S9["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:802"]
  T9["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S9 -->|calls| T9
  S10["method:ASTableView::moveSection:toSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:811"]
  T10["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S10 -->|calls| T10
  S11["method:ASTableView::moveSection:toSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:811"]
  T11["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S11 -->|calls| T11
  S12["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:819"]
  T12["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S12 -->|calls| T12
  S13["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:819"]
  T13["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S13 -->|calls| T13
  S14["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:828"]
  T14["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S14 -->|calls| T14
  S15["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:828"]
  T15["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S15 -->|calls| T15
  S16["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:837"]
  T16["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S16 -->|calls| T16
  S17["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:837"]
  T17["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S17 -->|calls| T17
  S18["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:846"]
  T18["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S18 -->|calls| T18
  S19["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:846"]
  T19["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S19 -->|calls| T19
  S20["method:ASTableView::tableView:heightForRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:927"]
  T20["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S20 -->|calls| T20
  S21["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:995"]
  T21["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S21 -->|calls| T21
  S22["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:995"]
  T22["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:846"]
  S22 -->|calls| T22
  S23["method:ASTableView::tableView:moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:995"]
  T23["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S23 -->|calls| T23
  S24["method:ASTableView::tableView:willDisplayCell:forRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1014"]
  T24["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S24 -->|calls| T24
  S25["method:ASTableView::tableView:willDisplayCell:forRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1014"]
  T25["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
