# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  T1["method:ASIGListAdapterBasedDataSource::setASCollectionViewSuperclass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:337"]
  S1 -->|calls| T1
  S2["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForHeaderInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:210"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForFooterInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:220"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASIGListAdapterBasedDataSource::setASCollectionViewSuperclass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:337"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:ASIGListAdapterBasedDataSource::setASCollectionViewSuperclass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:337"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:ASIGListAdapterBasedDataSource::configureUpdater:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:350"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASIGListAdapterBasedDataSource::configureUpdater:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:350"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:ASIGListAdapterBasedDataSource::overridesForSupplementarySourceClass:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:363"]
  T8["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S8 -->|calls| T8
  S9["method:ASIGListAdapterBasedDataSource::overridesForSectionControllerClass:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:382"]
  T9["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S9 -->|calls| T9
  S10["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T10["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S10 -->|calls| T10
  S11["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T11["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S11 -->|calls| T11
  S12["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T12["function:_ASSizeFillWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:16"]
  S12 -->|calls| T12
  S13["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  T13["function:_ASSizeFitWithAspectRatio<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:26"]
  S13 -->|calls| T13
  S14["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T14["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S14 -->|calls| T14
  S15["method:ASLayerBackingTipProvider::tipForNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayerBackingTipProvider.mm:22"]
  T15["method:ASTip::initWithNode:kind:format:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTip.mm:18"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T16["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T17["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T18["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.h:1"]
  T19["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["method:ASLayoutTransition::initWithNode:pendingLayout:previousLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:66"]
  T20["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S20 -->|calls| T20
  S21["method:ASLayoutTransition::isSynchronous<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:81"]
  T21["function:ASLayoutCanTransitionAsynchronous<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:29"]
  S21 -->|calls| T21
  S22["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  T22["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S22 -->|calls| T22
  S23["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T23["function:if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S23 -->|calls| T23
  S24["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T24["function:ASLayoutTransition::findNodesInLayoutAtIndexes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:253"]
  S24 -->|calls| T24
  S25["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  T25["method:OrderedDictionary::sort<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:453"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
