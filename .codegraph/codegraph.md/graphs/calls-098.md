# `calls 符号关系 - 098`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T2["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T3["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T5["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T6["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S6 -->|calls| T6
  S7["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T9["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S9 -->|calls| T9
  S10["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T10["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T11["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T12["method:ItemNode::displayWillStart<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/CatDealsCollectionView/Sample/ItemNode.m:242"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T13["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T14["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T15["variable:layerActionForKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:386"]
  S15 -->|calls| T15
  S16["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  T16["function:ASDisplayNodeFindClosestCommonAncestor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:277"]
  S16 -->|calls| T16
  S17["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T17["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S17 -->|calls| T17
  S18["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T18["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S18 -->|calls| T18
  S19["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T19["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S19 -->|calls| T19
  S20["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T20["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S20 -->|calls| T20
  S21["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T21["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S21 -->|calls| T21
  S22["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T22["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S22 -->|calls| T22
  S23["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T23["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S23 -->|calls| T23
  S24["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T24["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S24 -->|calls| T24
  S25["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T25["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
