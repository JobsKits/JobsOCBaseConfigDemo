# `calls 符号关系 - 144`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionFlowLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:31"]
  T1["method:ASCollectionFlowLayoutDelegate::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:26"]
  S1 -->|calls| T1
  S2["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T2["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S2 -->|calls| T2
  S3["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T3["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S3 -->|calls| T3
  S4["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T5["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S5 -->|calls| T5
  S6["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T6["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S6 -->|calls| T6
  S7["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T7["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S7 -->|calls| T7
  S8["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T8["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S8 -->|calls| T8
  S9["method:ASCollectionGalleryLayoutDelegate::additionalInfoForLayoutWithElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:70"]
  T9["method:_ASCollectionGalleryLayoutInfo::initWithItemSize:minimumLineSpacing:minimumInteritemSpacing:sectionInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:14"]
  S9 -->|calls| T9
  S10["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T10["method:_ASGalleryLayoutItem::initWithItemSize:collectionElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:25"]
  S10 -->|calls| T10
  S11["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T11["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S11 -->|calls| T11
  S12["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T12["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S12 -->|calls| T12
  S13["method:ASCollectionGalleryLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:88"]
  T13["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S13 -->|calls| T13
  S14["method:ASCollectionLayoutContext::initWithViewportSize:initialContentOffset:scrollableDirections:elements:layoutDelegateClass:layoutCache:additionalInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:23"]
  T14["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S14 -->|calls| T14
  S15["method:ASCollectionLayoutContext::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:73"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:ASCollectionLayoutContext::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:73"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T17["method:_ASCollectionGalleryLayoutInfo::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:52"]
  S17 -->|calls| T17
  S18["method:ASCollectionLayoutContext::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutContext.mm:84"]
  T18["function:ASHashBytes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S18 -->|calls| T18
  S19["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T19["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S19 -->|calls| T19
  S20["method:ASCollectionLayoutState::initWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:41"]
  T20["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S20 -->|calls| T20
  S21["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T21["method:NSMapTable::elementToLayoutAttributesTable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:25"]
  S21 -->|calls| T21
  S22["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  T22["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  S22 -->|calls| T22
  S23["method:ASCollectionLayoutState::initWithContext:contentSize:elementToLayoutAttributesTable:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:98"]
  T23["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S23 -->|calls| T23
  S24["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T24["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S24 -->|calls| T24
  S25["method:ASCollectionLayoutState::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:147"]
  T25["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
