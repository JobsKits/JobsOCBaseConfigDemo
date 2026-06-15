# `calls 符号关系 - 158`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  T1["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  S1 -->|calls| T1
  S2["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  T2["method:ASDataController::_repopulateSupplementaryNodesIntoMap:forSectionsContainingIndexPaths:changeSet:traitCollection:indexPathsAreNew:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:254"]
  S2 -->|calls| T2
  S3["method:ASDataController::_insertElementsIntoMap:sections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:815"]
  T3["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  S3 -->|calls| T3
  S4["method:ASDataController::_insertElementsIntoMap:sections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:815"]
  T4["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  S4 -->|calls| T4
  S5["method:ASDataController::relayoutNodes:nodesSizeChanged:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:841"]
  T5["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S5 -->|calls| T5
  S6["method:ASDataController::relayoutNodes:nodesSizeChanged:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:841"]
  T6["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S6 -->|calls| T6
  S7["method:ASDataController::relayoutAllNodesWithInvalidationBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:875"]
  T7["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  S7 -->|calls| T7
  S8["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T8["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  S8 -->|calls| T8
  S9["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T9["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S9 -->|calls| T9
  S10["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T10["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S10 -->|calls| T10
  S11["method:ASDataController::_relayoutAllNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:897"]
  T11["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S11 -->|calls| T11
  S12["method:ASDataController::environmentDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:937"]
  T12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S12 -->|calls| T12
  S13["method:ASDataController::clearData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  T13["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S13 -->|calls| T13
  S14["method:ASDataController::clearData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  T14["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S14 -->|calls| T14
  S15["method:ASTableViewProxy::modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:78"]
  T15["method:ASDelegateProxy::_modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:260"]
  S15 -->|calls| T15
  S16["method:ASTableViewProxy::indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:82"]
  T16["method:ASDelegateProxy::_indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:264"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewProxy::modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:146"]
  T17["method:ASDelegateProxy::_modelIdentifierForElementAtIndexPath:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:260"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewProxy::indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:150"]
  T18["method:ASDelegateProxy::_indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:264"]
  S18 -->|calls| T18
  S19["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  T19["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S19 -->|calls| T19
  S20["method:ASDelegateProxy::methodSignatureForSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:229"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:ASDelegateProxy::methodSignatureForSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:229"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
