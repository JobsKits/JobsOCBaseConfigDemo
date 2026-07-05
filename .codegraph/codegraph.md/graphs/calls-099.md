# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T1["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S1 -->|calls| T1
  S2["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T2["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S2 -->|calls| T2
  S3["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T3["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T4["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T5["property:ASDisplayNode::layer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.h:237"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T6["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T7["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T8["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T9["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T10["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T11["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T13["function:shouldDisableNotificationsForMovingBetweenParents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1976"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T14["function:canUseViewAPI<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1990"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T15["function:subtreeIsRasterized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1995"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T16["function:subtreeIsRasterized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1995"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T17["function:subtreeIsRasterized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1995"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T18["function:incrementIfFound<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1985"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T19["function:incrementIfFound<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1985"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T20["function:subtreeIsRasterized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1995"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T21["function:incrementIfFound<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1985"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T22["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T23["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T24["function:ASDisplayNodeSetResizableContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:18"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T25["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
