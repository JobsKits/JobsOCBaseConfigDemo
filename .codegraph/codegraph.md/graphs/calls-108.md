# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T2["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S2 -->|calls| T2
  S3["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  T3["function:_recursivelySetDisplaySuspended<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1659"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T5["method:ItemNode::displayWillStart<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/CatDealsCollectionView/Sample/ItemNode.m:242"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T6["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T7["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T8["variable:layerActionForKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:386"]
  S8 -->|calls| T8
  S9["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  T9["function:ASDisplayNodeFindClosestCommonAncestor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:277"]
  S9 -->|calls| T9
  S10["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T10["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S10 -->|calls| T10
  S11["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T11["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S11 -->|calls| T11
  S12["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1869"]
  T12["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S12 -->|calls| T12
  S13["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T13["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S13 -->|calls| T13
  S14["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T14["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S14 -->|calls| T14
  S15["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1899"]
  T15["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S15 -->|calls| T15
  S16["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T16["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S16 -->|calls| T16
  S17["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T17["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S17 -->|calls| T17
  S18["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1924"]
  T18["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S18 -->|calls| T18
  S19["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T19["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S19 -->|calls| T19
  S20["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T20["function:ASDisplayNodeUltimateParentOfNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:291"]
  S20 -->|calls| T20
  S21["function:node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1949"]
  T21["function:_calculateTransformFromReferenceToTarget<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1856"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T22["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T23["property:ASDisplayNode::layer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.h:237"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T24["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T25["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
