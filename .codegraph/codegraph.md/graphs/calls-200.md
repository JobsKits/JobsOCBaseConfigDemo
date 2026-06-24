# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T1["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S1 -->|calls| T1
  S2["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:791"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S2 -->|calls| T2
  S3["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:802"]
  T3["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T4["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T5["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T6["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T7["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T8["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T9["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S9 -->|calls| T9
  S10["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:866"]
  T10["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T11["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T12["function:ASHierarchyChangeTypeIsFinal<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:35"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T13["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T14["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S14 -->|calls| T14
  S15["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:972"]
  T15["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T16["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T17["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T18["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T19["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T20["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S20 -->|calls| T20
  S21["function:_ASPendingState::ASPendingStateApplyMetricsToLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:178"]
  T21["function:ASBoundsAndPositionForFrame<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:83"]
  S21 -->|calls| T21
  S22["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T22["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  S22 -->|calls| T22
  S23["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T23["function:ASDefaultAllowsGroupOpacity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:20"]
  S23 -->|calls| T23
  S24["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T24["function:ASDefaultAllowsEdgeAntialiasing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:31"]
  S24 -->|calls| T24
  S25["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T25["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
