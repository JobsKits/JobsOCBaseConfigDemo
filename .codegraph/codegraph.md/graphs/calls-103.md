# `calls 符号关系 - 103`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::detailedLayoutDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:3715"]
  T1["function:NSStringFromASSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::detailedLayoutDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:3715"]
  T2["function:ASPopMainThreadAssertionsDisabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASAssert.mm:23"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::detailedLayoutDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:3715"]
  T3["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S3 -->|calls| T3
  S4["method:CALayer::addSubnode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:3809"]
  T4["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S4 -->|calls| T4
  S5["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  T5["function:ASInterfaceStateIncludesMeasureLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:49"]
  S5 -->|calls| T5
  S6["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  T6["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S6 -->|calls| T6
  S7["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  T7["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S7 -->|calls| T7
  S8["function:NSStringFromASInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:54"]
  T8["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T9["function:ASLayerToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T10["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T11["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T12["function:ASDisplayNodeFindFirstSupernode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:139"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T13["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASEqualityHelpers.h:16"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T14["function:ASDisplayNodeFindFirstSupernodeOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:151"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T15["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T16["function:ASFindClosestViewOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:266"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T17["function:ASDisplayNodeFindClosestCommonAncestor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:277"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T18["function:ASCollectDisplayNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:170"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T19["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T20["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASEqualityHelpers.h:16"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T21["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T22["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T23["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASEqualityHelpers.h:16"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T24["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:1"]
  T25["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASEqualityHelpers.h:16"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
