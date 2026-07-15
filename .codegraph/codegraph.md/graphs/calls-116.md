# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableNode::setAllowsMultipleSelectionDuringEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:508"]
  T1["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S1 -->|calls| T1
  S2["method:ASTableNode::allowsMultipleSelectionDuringEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:518"]
  T2["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S2 -->|calls| T2
  S3["method:ASTableNode::updateCurrentRangeWithMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:539"]
  T3["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S3 -->|calls| T3
  S4["method:ASTableNode::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:555"]
  T4["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:565"]
  S4 -->|calls| T4
  S5["method:ASTableNode::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:560"]
  T5["method:ASTableNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:574"]
  S5 -->|calls| T5
  S6["method:ASTableNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:565"]
  T6["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S6 -->|calls| T6
  S7["method:ASTableNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:574"]
  T7["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S7 -->|calls| T7
  S8["method:ASTableNode::numberOfRowsInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:638"]
  T8["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S8 -->|calls| T8
  S9["method:ASTableNode::numberOfSections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:645"]
  T9["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S9 -->|calls| T9
  S10["method:ASTableNode::nodeForRowAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:663"]
  T10["method:ASTableNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:628"]
  S10 -->|calls| T10
  S11["method:ASTableNode::indexPathsForVisibleRows<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:729"]
  T11["method:ASTableNode::visibleNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:652"]
  S11 -->|calls| T11
  S12["method:ASTableNode::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:744"]
  T12["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S12 -->|calls| T12
  S13["method:ASTableNode::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:766"]
  T13["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S13 -->|calls| T13
  S14["method:ASTableNode::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:783"]
  T14["method:ASTableNode::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:766"]
  S14 -->|calls| T14
  S15["method:ASTableNode::onDidFinishProcessingUpdates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:857"]
  T15["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S15 -->|calls| T15
  S16["method:ASTableNode::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:879"]
  T16["method:ASTableNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:869"]
  S16 -->|calls| T16
  S17["method:ASTableNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:887"]
  T17["method:ASTableNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:887"]
  S17 -->|calls| T17
  S18["method:ASTableNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:887"]
  T18["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S18 -->|calls| T18
  S19["method:ASTableNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:887"]
  T19["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h:1"]
  T21["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h:1"]
  T22["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h:1"]
  T24["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
