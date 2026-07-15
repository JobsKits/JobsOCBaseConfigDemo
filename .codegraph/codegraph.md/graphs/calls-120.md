# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T1["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S1 -->|calls| T1
  S2["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T2["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:709"]
  S2 -->|calls| T2
  S3["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T3["function:ASDisplayNodeLayerHasAnimations<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:183"]
  S3 -->|calls| T3
  S4["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T4["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S4 -->|calls| T4
  S5["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T5["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S5 -->|calls| T5
  S6["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T6["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S6 -->|calls| T6
  S7["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T7["method:ASTableView::requeryNodeHeights<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1947"]
  S7 -->|calls| T7
  S8["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T8["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  S8 -->|calls| T8
  S9["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T9["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S9 -->|calls| T9
  S10["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:784"]
  T10["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S10 -->|calls| T10
  S11["method:ASTableView::insertSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:784"]
  T11["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S11 -->|calls| T11
  S12["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:793"]
  T12["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S12 -->|calls| T12
  S13["method:ASTableView::deleteSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:793"]
  T13["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S13 -->|calls| T13
  S14["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:802"]
  T14["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S14 -->|calls| T14
  S15["method:ASTableView::reloadSections:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:802"]
  T15["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S15 -->|calls| T15
  S16["method:ASTableView::moveSection:toSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:811"]
  T16["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S16 -->|calls| T16
  S17["method:ASTableView::moveSection:toSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:811"]
  T17["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S17 -->|calls| T17
  S18["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:819"]
  T18["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S18 -->|calls| T18
  S19["method:ASTableView::insertRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:819"]
  T19["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S19 -->|calls| T19
  S20["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:828"]
  T20["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S20 -->|calls| T20
  S21["method:ASTableView::deleteRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:828"]
  T21["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S21 -->|calls| T21
  S22["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:837"]
  T22["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S22 -->|calls| T22
  S23["method:ASTableView::reloadRowsAtIndexPaths:withRowAnimation:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:837"]
  T23["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S23 -->|calls| T23
  S24["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:846"]
  T24["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S24 -->|calls| T24
  S25["method:ASTableView::moveRowAtIndexPath:toIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:846"]
  T25["method:ASTableView::endUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:698"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
