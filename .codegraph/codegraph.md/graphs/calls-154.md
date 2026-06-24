# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T1["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S1 -->|calls| T1
  S2["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T2["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S2 -->|calls| T2
  S3["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T3["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S3 -->|calls| T3
  S4["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T5["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S5 -->|calls| T5
  S6["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T7["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S7 -->|calls| T7
  S8["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T8["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S8 -->|calls| T8
  S9["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T9["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S9 -->|calls| T9
  S10["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T10["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S10 -->|calls| T10
  S11["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T11["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S11 -->|calls| T11
  S12["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T12["method:NSMapTable::pageTableForStrongObjectPointers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:89"]
  S12 -->|calls| T12
  S13["method:ASCollectionLayoutState::_unmeasuredLayoutAttributesTableFromTable:contentSize:pageSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:238"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T14["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S14 -->|calls| T14
  S15["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T15["method:ASCollectionNode::collectionViewLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:695"]
  S15 -->|calls| T15
  S16["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T16["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S16 -->|calls| T16
  S17["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T17["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S17 -->|calls| T17
  S18["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T18["method:ASCollectionViewLayoutController::elementsWithinRangeBounds:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:98"]
  S18 -->|calls| T18
  S19["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T19["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S19 -->|calls| T19
  S20["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T20["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S20 -->|calls| T20
  S21["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T21["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S21 -->|calls| T21
  S22["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T22["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S22 -->|calls| T22
  S23["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T23["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S23 -->|calls| T23
  S24["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T24["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S24 -->|calls| T24
  S25["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T25["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
