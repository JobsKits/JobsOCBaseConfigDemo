# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASIGListAdapterBasedDataSource::overridesForSectionControllerClass:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:382"]
  T1["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S1 -->|calls| T1
  S2["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T2["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S2 -->|calls| T2
  S3["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T3["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S3 -->|calls| T3
  S4["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T4["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S4 -->|calls| T4
  S5["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T5["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S5 -->|calls| T5
  S6["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T6["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S6 -->|calls| T6
  S7["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T7["method:ASTip::initWithNode:kind:format:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTip.mm:18"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T8["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T9["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T10["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T11["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["method:ASLayoutTransition::initWithNode:pendingLayout:previousLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:66"]
  T12["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S12 -->|calls| T12
  S13["method:ASLayoutTransition::isSynchronous<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:81"]
  T13["function:ASLayoutCanTransitionAsynchronous<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:29"]
  S13 -->|calls| T13
  S14["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  T14["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S14 -->|calls| T14
  S15["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T15["function:if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S15 -->|calls| T15
  S16["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T16["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S16 -->|calls| T16
  S17["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T17["method:OrderedDictionary::sort<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:453"]
  S17 -->|calls| T17
  S18["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T18["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S18 -->|calls| T18
  S19["class:ASLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T19["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S19 -->|calls| T19
  S20["class:ASLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:54"]
  T20["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S20 -->|calls| T20
  S21["method:ASLayoutTransition::transitionContext:constrainedSizeForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:236"]
  T21["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S21 -->|calls| T21
  S22["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  T22["function:ASLayoutTransition::findNodesInLayoutAtIndexesWithFilteredNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:265"]
  S22 -->|calls| T22
  S23["function:ASLayoutTransition::findNodesInLayoutAtIndexesWithFilteredNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:265"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["function:ASLayoutTransition::findNodesInLayoutAtIndexesWithFilteredNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:265"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
