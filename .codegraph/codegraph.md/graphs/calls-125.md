# `calls 符号关系 - 125`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:226"]
  T1["method:ASTableNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:226"]
  S1 -->|calls| T1
  S2["method:ASTableNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:232"]
  T2["method:ASTableNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:232"]
  S2 -->|calls| T2
  S3["method:ASTableNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:239"]
  T3["method:ASTableNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:239"]
  S3 -->|calls| T3
  S4["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  T4["method:ASTableNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:127"]
  S4 -->|calls| T4
  S5["method:ASTableNode::setInverted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:262"]
  T5["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S5 -->|calls| T5
  S6["method:ASTableNode::inverted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:273"]
  T6["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S6 -->|calls| T6
  S7["method:ASTableNode::setContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:324"]
  T7["method:ASTableNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:329"]
  S7 -->|calls| T7
  S8["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T8["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S8 -->|calls| T8
  S9["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T9["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S9 -->|calls| T9
  S10["method:ASTableNode::delegate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:414"]
  T10["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S10 -->|calls| T10
  S11["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T11["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S11 -->|calls| T11
  S12["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S12 -->|calls| T12
  S13["method:ASTableNode::dataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:441"]
  T13["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S13 -->|calls| T13
  S14["method:ASTableNode::setAllowsSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:451"]
  T14["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S14 -->|calls| T14
  S15["method:ASTableNode::allowsSelection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:461"]
  T15["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S15 -->|calls| T15
  S16["method:ASTableNode::setAllowsSelectionDuringEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:470"]
  T16["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S16 -->|calls| T16
  S17["method:ASTableNode::allowsSelectionDuringEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:480"]
  T17["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S17 -->|calls| T17
  S18["method:ASTableNode::setAllowsMultipleSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:489"]
  T18["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S18 -->|calls| T18
  S19["method:ASTableNode::allowsMultipleSelection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:499"]
  T19["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S19 -->|calls| T19
  S20["method:ASTableNode::setAllowsMultipleSelectionDuringEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:508"]
  T20["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S20 -->|calls| T20
  S21["method:ASTableNode::allowsMultipleSelectionDuringEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:518"]
  T21["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S21 -->|calls| T21
  S22["method:ASTableNode::updateCurrentRangeWithMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:539"]
  T22["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S22 -->|calls| T22
  S23["method:ASTableNode::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:555"]
  T23["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:565"]
  S23 -->|calls| T23
  S24["method:ASTableNode::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:560"]
  T24["method:ASTableNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:574"]
  S24 -->|calls| T24
  S25["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:565"]
  T25["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
