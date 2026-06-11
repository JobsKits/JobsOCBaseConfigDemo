# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T1["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S1 -->|calls| T1
  S2["method:ASCollectionViewLayoutController::initWithCollectionView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:35"]
  T2["method:ASCollectionNode::collectionViewLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:695"]
  S2 -->|calls| T2
  S3["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T3["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S3 -->|calls| T3
  S4["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T4["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S4 -->|calls| T4
  S5["method:ASCollectionViewLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:46"]
  T5["method:ASCollectionViewLayoutController::elementsWithinRangeBounds:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:98"]
  S5 -->|calls| T5
  S6["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T6["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S6 -->|calls| T6
  S7["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T7["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S7 -->|calls| T7
  S8["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T8["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S8 -->|calls| T8
  S9["method:ASCollectionViewLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:53"]
  T9["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  S9 -->|calls| T9
  S10["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T10["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S10 -->|calls| T10
  S11["method:ASCollectionViewLayoutController::rangeBoundsWithScrollDirection:rangeTuningParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutController.mm:118"]
  T11["method:ASCollectionView::scrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1768"]
  S11 -->|calls| T11
  S12["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T12["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S12 -->|calls| T12
  S13["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  T13["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S13 -->|calls| T13
  S14["method:ASCollectionViewLayoutInspector::collectionView:constrainedSizeForNodeAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:54"]
  T14["function:NodeConstrainedSizeForScrollDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionViewLayoutInspector.mm:20"]
  S14 -->|calls| T14
  S15["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T15["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S15 -->|calls| T15
  S16["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T16["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S16 -->|calls| T16
  S17["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T17["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S17 -->|calls| T17
  S18["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  T18["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S18 -->|calls| T18
  S19["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T19["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S19 -->|calls| T19
  S20["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T20["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S20 -->|calls| T20
  S21["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T21["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  S21 -->|calls| T21
  S22["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  T22["function:ASDispatchApply<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S22 -->|calls| T22
  S23["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T23["function:ASSizeRangeHasSignificantArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:239"]
  S23 -->|calls| T23
  S24["method:ASDataController::_layoutNode:withConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:195"]
  T24["function:NSStringFromASSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S24 -->|calls| T24
  S25["method:ASDataController::_allIndexPathsForItemsOfKind:inSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:210"]
  T25["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
