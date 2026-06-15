# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T1["function:ASDisplayNodeDefaultTintColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:316"]
  S1 -->|calls| T1
  S2["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T2["function:ASLayerToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S2 -->|calls| T2
  S3["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T3["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S3 -->|calls| T3
  S4["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T4["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S4 -->|calls| T4
  S5["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T5["variable:copy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S5 -->|calls| T5
  S6["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T6["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S6 -->|calls| T6
  S7["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  T7["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S7 -->|calls| T7
  S8["function:ASDisplayNodePerformBlockOnEveryNodeBFS<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:113"]
  T8["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S8 -->|calls| T8
  S9["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  T9["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S9 -->|calls| T9
  S10["function:ASDisplayNodeFindFirstSupernode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:139"]
  T10["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S10 -->|calls| T10
  S11["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  T11["function:ASLayerToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S11 -->|calls| T11
  S12["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  T12["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  S12 -->|calls| T12
  S13["function:ASCollectDisplayNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:170"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["function:ASCollectDisplayNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:170"]
  T14["function:_ASCollectDisplayNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:158"]
  S14 -->|calls| T14
  S15["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  T15["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S15 -->|calls| T15
  S16["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  T16["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  S16 -->|calls| T16
  S17["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  T18["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  S18 -->|calls| T18
  S19["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T19["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  S19 -->|calls| T19
  S20["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T21["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S21 -->|calls| T21
  S22["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T22["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  T23["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S23 -->|calls| T23
  S24["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  T24["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S24 -->|calls| T24
  S25["function:ASDisplayNodeFindFirstSubnodeOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:236"]
  T25["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
