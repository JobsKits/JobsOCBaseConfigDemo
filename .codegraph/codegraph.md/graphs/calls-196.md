# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:initWithOldData:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:136"]
  T1["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S1 -->|calls| T1
  S2["function:initWithOldData:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:136"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S2 -->|calls| T2
  S3["function:initWithOldData:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:136"]
  T3["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S3 -->|calls| T3
  S4["function:addCompletionHandler:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:164"]
  T4["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S4 -->|calls| T4
  S5["function:indexesForItemChangesOfType:inSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:237"]
  T5["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T6["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T7["function:if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T8["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T9["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T10["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T11["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T12["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T13["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T14["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T15["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T16["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S16 -->|calls| T16
  S17["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T17["function:ASHierarchyChangeTypeIsFinal<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:35"]
  S17 -->|calls| T17
  S18["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T18["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S18 -->|calls| T18
  S19["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T19["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S19 -->|calls| T19
  S20["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:723"]
  T20["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S20 -->|calls| T20
  S21["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:791"]
  T21["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S21 -->|calls| T21
  S22["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:802"]
  T22["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T23["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T24["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T25["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
