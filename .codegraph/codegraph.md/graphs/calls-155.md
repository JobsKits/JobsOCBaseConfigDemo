# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T1["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:54"]
  T2["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  S2 -->|calls| T2
  S3["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T3["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S3 -->|calls| T3
  S4["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T5["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S5 -->|calls| T5
  S6["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T7["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S7 -->|calls| T7
  S8["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T8["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S8 -->|calls| T8
  S9["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T9["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S9 -->|calls| T9
  S10["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T10["function:ASDispatchApply<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S10 -->|calls| T10
  S11["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T11["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S11 -->|calls| T11
  S12["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T12["function:NSStringFromASSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S12 -->|calls| T12
  S13["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  T14["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S14 -->|calls| T14
  S15["method:ASDataController::_repopulateSupplementaryNodesIntoMap:forSectionsContainingIndexPaths:changeSet:traitCollection:indexPathsAreNew:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:254"]
  T15["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  S15 -->|calls| T15
  S16["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T16["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S16 -->|calls| T16
  S17["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T17["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  S17 -->|calls| T17
  S18["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T18["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S18 -->|calls| T18
  S19["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T19["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S19 -->|calls| T19
  S20["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T20["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S20 -->|calls| T20
  S21["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T21["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S21 -->|calls| T21
  S22["method:ASDataController::_updateSupplementaryNodesIntoMap:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:293"]
  T22["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  S22 -->|calls| T22
  S23["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  T23["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  S23 -->|calls| T23
  S24["method:ASDataController::_insertElementsIntoMap:kind:forSections:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:338"]
  T24["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  S24 -->|calls| T24
  S25["method:ASDataController::_insertElementsIntoMap:kind:atIndexPaths:traitCollection:shouldFetchSizeRanges:changeSet:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:365"]
  T25["method:ASDataController::constrainedSizeForNodeOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:468"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
