# `calls 符号关系 - 131`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableNode::inverted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:273"]
  T1["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S1 -->|calls| T1
  S2["method:ASTableNode::setContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:324"]
  T2["method:ASTableNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:329"]
  S2 -->|calls| T2
  S3["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T3["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S3 -->|calls| T3
  S4["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["method:ASTableNode::delegate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:414"]
  T5["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S5 -->|calls| T5
  S6["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T6["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S6 -->|calls| T6
  S7["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T7["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S7 -->|calls| T7
  S8["method:ASTableNode::dataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:441"]
  T8["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S8 -->|calls| T8
  S9["method:ASTableNode::setAllowsSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:451"]
  T9["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S9 -->|calls| T9
  S10["method:ASTableNode::allowsSelection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:461"]
  T10["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S10 -->|calls| T10
  S11["method:ASTableNode::setAllowsSelectionDuringEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:470"]
  T11["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S11 -->|calls| T11
  S12["method:ASTableNode::allowsSelectionDuringEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:480"]
  T12["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S12 -->|calls| T12
  S13["method:ASTableNode::setAllowsMultipleSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:489"]
  T13["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S13 -->|calls| T13
  S14["method:ASTableNode::allowsMultipleSelection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:499"]
  T14["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S14 -->|calls| T14
  S15["method:ASTableNode::setAllowsMultipleSelectionDuringEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:508"]
  T15["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S15 -->|calls| T15
  S16["method:ASTableNode::allowsMultipleSelectionDuringEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:518"]
  T16["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S16 -->|calls| T16
  S17["method:ASTableNode::updateCurrentRangeWithMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:539"]
  T17["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S17 -->|calls| T17
  S18["method:ASTableNode::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:555"]
  T18["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:565"]
  S18 -->|calls| T18
  S19["method:ASTableNode::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:560"]
  T19["method:ASTableNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:574"]
  S19 -->|calls| T19
  S20["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:565"]
  T20["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S20 -->|calls| T20
  S21["method:ASTableNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:574"]
  T21["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S21 -->|calls| T21
  S22["method:ASTableNode::numberOfRowsInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:638"]
  T22["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S22 -->|calls| T22
  S23["method:ASTableNode::numberOfSections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:645"]
  T23["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S23 -->|calls| T23
  S24["method:ASTableNode::nodeForRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:663"]
  T24["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S24 -->|calls| T24
  S25["method:ASTableNode::indexPathsForVisibleRows<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:729"]
  T25["method:ASTableNode::visibleNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:652"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
