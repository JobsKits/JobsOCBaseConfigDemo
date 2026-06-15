# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T1["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S1 -->|calls| T1
  S2["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T2["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S2 -->|calls| T2
  S3["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T3["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S3 -->|calls| T3
  S4["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T4["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S4 -->|calls| T4
  S5["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T5["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S5 -->|calls| T5
  S6["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T6["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S6 -->|calls| T6
  S7["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T7["method:ASDataController::invalidateDataSourceItemCounts<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:432"]
  S7 -->|calls| T7
  S8["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T8["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S8 -->|calls| T8
  S9["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T10["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  S10 -->|calls| T10
  S11["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T11["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  S11 -->|calls| T11
  S12["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T12["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S12 -->|calls| T12
  S13["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T14["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  S14 -->|calls| T14
  S15["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T15["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S15 -->|calls| T15
  S16["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T16["method:ASMutableElementMap::removeAllSections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:41"]
  S16 -->|calls| T16
  S17["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T17["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S17 -->|calls| T17
  S18["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T18["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  S18 -->|calls| T18
  S19["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T19["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  S19 -->|calls| T19
  S20["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  T20["method:ASSection::initWithSectionID:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASSection.mm:15"]
  S20 -->|calls| T20
  S21["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  T21["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  S21 -->|calls| T21
  S22["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  T22["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S22 -->|calls| T22
  S23["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  T23["method:ASDataController::_insertElementsIntoMap:sections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:815"]
  S23 -->|calls| T23
  S24["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  T24["method:ASDataController::_repopulateSupplementaryNodesIntoMap:forSectionsContainingIndexPaths:changeSet:traitCollection:indexPathsAreNew:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:254"]
  S24 -->|calls| T24
  S25["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  T25["method:ASDataController::_insertElementsIntoMap:sections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:815"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
