# `calls 符号关系 - 146`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T1["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S1 -->|calls| T1
  S2["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T2["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S2 -->|calls| T2
  S3["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T3["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S3 -->|calls| T3
  S4["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T4["function:ASDispatchApply<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S4 -->|calls| T4
  S5["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T5["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S5 -->|calls| T5
  S6["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T6["function:NSStringFromASSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S6 -->|calls| T6
  S7["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  T7["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S7 -->|calls| T7
  S8["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  T8["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S8 -->|calls| T8
  S9["method:ASDataController::_repopulateSupplementaryNodesIntoMap:forSectionsContainingIndexPaths:changeSet:traitCollection:indexPathsAreNew:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:254"]
  T9["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  S9 -->|calls| T9
  S10["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T10["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S10 -->|calls| T10
  S11["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T11["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  S11 -->|calls| T11
  S12["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T14["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S14 -->|calls| T14
  S15["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T15["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S15 -->|calls| T15
  S16["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T16["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  S16 -->|calls| T16
  S17["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  T17["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  S17 -->|calls| T17
  S18["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  T18["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  S18 -->|calls| T18
  S19["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  T19["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S19 -->|calls| T19
  S20["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  T20["method:ASCollectionElement::initWithNodeModel:nodeBlock:supplementaryElementKind:constrainedSize:owningNode:traitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:26"]
  S20 -->|calls| T20
  S21["method:ASDataController::onDidFinishProcessingUpdates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:505"]
  T21["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S21 -->|calls| T21
  S22["method:ASDataController::onDidFinishProcessingUpdates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:505"]
  T22["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S22 -->|calls| T22
  S23["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T23["method:ASDataController::isSynchronized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S23 -->|calls| T23
  S24["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T24["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S24 -->|calls| T24
  S25["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T25["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
