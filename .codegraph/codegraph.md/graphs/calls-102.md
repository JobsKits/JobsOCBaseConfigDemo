# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T1["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T2["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T3["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T4["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S4 -->|calls| T4
  S5["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T7["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S7 -->|calls| T7
  S8["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T8["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T9["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T10["method:ItemNode::displayWillStart<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/CatDealsCollectionView/Sample/ItemNode.m:242"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T11["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T12["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T13["variable:layerActionForKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:386"]
  S13 -->|calls| T13
  S14["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  T14["function:ASDisplayNodeFindClosestCommonAncestor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:277"]
  S14 -->|calls| T14
  S15["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T15["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S15 -->|calls| T15
  S16["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T16["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S16 -->|calls| T16
  S17["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T17["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S17 -->|calls| T17
  S18["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T18["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S18 -->|calls| T18
  S19["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T19["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S19 -->|calls| T19
  S20["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T20["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S20 -->|calls| T20
  S21["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T21["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S21 -->|calls| T21
  S22["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T22["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S22 -->|calls| T22
  S23["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T23["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S23 -->|calls| T23
  S24["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T24["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S24 -->|calls| T24
  S25["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T25["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
