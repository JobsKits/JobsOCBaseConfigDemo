# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T1["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S1 -->|calls| T1
  S2["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T2["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S2 -->|calls| T2
  S3["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T3["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S3 -->|calls| T3
  S4["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T4["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S4 -->|calls| T4
  S5["method:ASCollectionGalleryLayoutDelegate::additionalInfoForLayoutWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:70"]
  T5["method:_ASCollectionGalleryLayoutInfo::initWithItemSize:minimumLineSpacing:minimumInteritemSpacing:sectionInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:14"]
  S5 -->|calls| T5
  S6["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T6["method:_ASGalleryLayoutItem::initWithItemSize:collectionElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:25"]
  S6 -->|calls| T6
  S7["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T7["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S7 -->|calls| T7
  S8["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T8["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S8 -->|calls| T8
  S9["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T9["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S9 -->|calls| T9
  S10["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:ASCollectionLayoutContext::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:73"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:ASCollectionLayoutContext::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:73"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T13["method:_ASCollectionGalleryLayoutInfo::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:52"]
  S13 -->|calls| T13
  S14["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T14["function:ASHashBytes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S14 -->|calls| T14
  S15["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T15["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S15 -->|calls| T15
  S16["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T16["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S16 -->|calls| T16
  S17["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T17["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T18["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  T19["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T20["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T21["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T22["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T23["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S23 -->|calls| T23
  S24["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T24["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayoutState::getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:178"]
  T25["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
