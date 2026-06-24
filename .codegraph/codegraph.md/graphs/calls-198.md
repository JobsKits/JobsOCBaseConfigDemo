# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T1["function:useOptimizedFlexing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  S1 -->|calls| T1
  S2["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T2["variable:map<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:74"]
  S2 -->|calls| T2
  S3["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T3["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  S3 -->|calls| T3
  S4["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T4["function:collectChildrenIntoLines<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  S4 -->|calls| T4
  S5["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T5["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  S5 -->|calls| T5
  S6["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T6["function:stretchLinesAlongCrossDimension::computeLinesCrossSizeAndBaseline<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:278"]
  S6 -->|calls| T6
  S7["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T7["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  S7 -->|calls| T7
  S8["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T8["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  S8 -->|calls| T8
  S9["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T9["function:computeLinesCrossDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:108"]
  S9 -->|calls| T9
  S10["method:_ASCollectionGalleryLayoutInfo::initWithItemSize:minimumLineSpacing:minimumInteritemSpacing:sectionInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:14"]
  T10["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S10 -->|calls| T10
  S11["method:_ASCollectionGalleryLayoutInfo::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:41"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:_ASCollectionGalleryLayoutInfo::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:41"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:_ASCollectionGalleryLayoutInfo::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutInfo.mm:52"]
  T13["function:ASHashBytes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S13 -->|calls| T13
  S14["method:_ASGalleryLayoutItem::initWithItemSize:collectionElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:25"]
  T14["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S14 -->|calls| T14
  S15["method:_ASGalleryLayoutItem::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:63"]
  T15["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S15 -->|calls| T15
  S16["method:_ASGalleryLayoutItem::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:63"]
  T16["function:NSStringFromASSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S16 -->|calls| T16
  S17["method:_ASGalleryLayoutItem::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:72"]
  T17["method:_ASGalleryLayoutItem::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCollectionGalleryLayoutItem.mm:77"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.h:1"]
  T18["function:ASDisplayNodeUIContentModeFromNSString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:121"]
  S18 -->|calls| T18
  S19["function:ASDisplayNodeSetupLayerContentsWithResizableImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:13"]
  T19["function:ASDisplayNodeSetResizableContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:18"]
  S19 -->|calls| T19
  S20["function:ASDisplayNodeNSStringFromUIContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:109"]
  T20["function:UIContentModeDescriptionLUT<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:86"]
  S20 -->|calls| T20
  S21["function:ASDisplayNodeUIContentModeFromNSString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:121"]
  T21["function:UIContentModeDescriptionLUT<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:86"]
  S21 -->|calls| T21
  S22["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  T22["function:UIContentModeCAGravityLUT<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:64"]
  S22 -->|calls| T22
  S23["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  T23["function:UIContentModeCAGravityLUT<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:64"]
  S23 -->|calls| T23
  S24["function:initWithOldData:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:136"]
  T24["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S24 -->|calls| T24
  S25["function:initWithOldData:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:136"]
  T25["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:130"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
